import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Enum to specify the type of image source.
enum ImageType { file, network, asset }

/// A customizable and efficient widget for displaying images from various
/// sources, with built-in caching for network images.
class CustomImage extends StatelessWidget {
  /// Creates a [CustomImage] widget.
  const CustomImage(
    this.image, {
    super.key,
    this.type,
    this.onTap,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.backgroundColor,
    this.color,
    this.borderRadius = BorderRadius.zero,
    this.boxShadow,
    this.childLoading,
    this.pathLoading,
    this.childNoImage,
    this.pathNoImage,
    this.sizeIconError,
    this.filterQuality = FilterQuality.medium,
  });

  /// Path, URL, or asset name for the image.
  final String image;

  /// The type of the image source. If null, it will be inferred from the image
  /// string.
  final ImageType? type;

  /// Callback function for when the image is tapped.
  final VoidCallback? onTap;

  /// How the image should be inscribed into the space allocated during layout.
  final BoxFit fit;

  /// The height of the image.
  final double? height;

  /// The width of the image.
  final double? width;

  /// Background color for the container.
  final Color? backgroundColor;

  /// The color to apply to the image as a color filter.
  final Color? color;

  /// The border radius of the image container.
  final BorderRadius borderRadius;

  /// A list of shadows to apply behind the container. If null, no shadow is
  /// applied.
  final List<BoxShadow>? boxShadow;

  /// The widget to be displayed while the main image is loading.
  /// Overrides [pathLoading].
  final Widget? childLoading;

  /// The asset path for an image to display while loading.
  final String? pathLoading;

  /// The widget to be displayed if the main image fails to load.
  /// Overrides [pathNoImage].
  final Widget? childNoImage;

  /// The asset path for an image to display on error.
  final String? pathNoImage;

  /// The size of the default error icon if no other error widget is provided.
  final double? sizeIconError;

  /// The quality of the image filter.
  final FilterQuality filterQuality;

  // Helper method to determine the image type if not explicitly provided.
  // This centralizes the detection logic.
  ImageType _getEffectiveImageType() {
    if (type != null) {
      return type!;
    }
    if (image.startsWith('http')) {
      return ImageType.network;
    }
    if (image.startsWith('assets/')) {
      return ImageType.asset;
    }
    // Assumes it's a file path if it starts with a slash (common on mobile
    // OSes).
    if (image.startsWith('/')) {
      return ImageType.file;
    }
    // Default fallback, could be adjusted based on your needs.
    return ImageType.asset;
  }

  @override
  Widget build(BuildContext context) {
    // GestureDetector enables the onTap functionality.
    return GestureDetector(
      onTap: onTap,
      // Using a Container is slightly more convenient than a DecoratedBox.
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
        ),
        // ClipRRect ensures the image respects the border radius.
        child: ClipRRect(borderRadius: borderRadius, child: _buildImage()),
      ),
    );
  }

  // Central widget builder that uses a switch for better readability.
  Widget _buildImage() {
    final isSvg = image.toLowerCase().endsWith('.svg');
    final effectiveType = _getEffectiveImageType();

    switch (effectiveType) {
      case ImageType.network:
        return isSvg ? _buildSvgNetwork() : _buildRasterNetwork();
      case ImageType.file:
        return isSvg ? _buildSvgFile() : _buildRasterFile();
      case ImageType.asset:
        return isSvg ? _buildSvgAsset() : _buildRasterAsset();
    }
  }

  // --- Image type specific builders ---

  Widget _buildRasterNetwork() {
    // implementacion con el paquete de CachedNetworkImage
    // return CachedNetworkImage(
    //   imageUrl: image,
    //   height: height,
    //   width: width,
    //   fit: fit,
    //   color: color,
    //   // Provides a much cleaner way to handle loading states.
    //   placeholder: (context, url) => _buildLoadingWidget(),
    //   // Provides a cleaner way to handle error states.
    //   errorWidget: (context, url, error) => _buildErrorWidget(),
    // );
    return Image.network(
      image,
      height: height,
      width: width,
      fit: fit,
      color: color,
      filterQuality: filterQuality,
      errorBuilder: (context, error, stackTrace) => _buildErrorWidget(),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return _buildLoadingWidget();
      },
    );
  }

  Widget _buildSvgNetwork() {
    return SvgPicture.network(
      image,
      height: height,
      width: width,
      fit: fit,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
      placeholderBuilder: (context) => _buildLoadingWidget(),
    );
  }

  Widget _buildRasterFile() {
    return Image.file(
      File(image),
      height: height,
      width: width,
      fit: fit,
      color: color,
      filterQuality: filterQuality,
      errorBuilder: (context, error, stackTrace) => _buildErrorWidget(),
    );
  }

  Widget _buildSvgFile() {
    return SvgPicture.file(
      File(image),
      height: height,
      width: width,
      fit: fit,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
      placeholderBuilder: (context) => _buildLoadingWidget(),
    );
  }

  Widget _buildRasterAsset() {
    return Image.asset(
      image,
      height: height,
      width: width,
      fit: fit,
      color: color,
      filterQuality: filterQuality,
      errorBuilder: (context, error, stackTrace) => _buildErrorWidget(),
    );
  }

  Widget _buildSvgAsset() {
    return SvgPicture.asset(
      image,
      height: height,
      width: width,
      fit: fit,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
      placeholderBuilder: (context) => _buildLoadingWidget(),
    );
  }

  // --- Placeholder and Error Widgets ---

  Widget _buildLoadingWidget() {
    if (childLoading != null) return childLoading!;
    if (pathLoading != null) return Image.asset(pathLoading!, fit: fit);
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildErrorWidget() {
    if (childNoImage != null) return childNoImage!;
    if (pathNoImage != null) {
      return Image.asset(
        pathNoImage!,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _defaultErrorIcon(),
      );
    }
    return _defaultErrorIcon();
  }

  Widget _defaultErrorIcon() =>
      Icon(Icons.error_outline, size: sizeIconError, color: Colors.grey[400]);
}
