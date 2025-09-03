import 'dart:async';
import 'package:app/src/common/theme/app_colors.dart';
import 'package:app/src/shared/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomTextFieldSearch extends StatefulWidget {
  const CustomTextFieldSearch({
    this.callback,
    this.hintText = 'Buscar',
    this.controller,
    this.initialText,
    this.voiceActive = true,
    this.debounceTime = 1200,
    this.actions,
    this.hintStyle,
    this.focusNode,
    super.key,
  });
  final String hintText;
  final String? initialText;
  final void Function(String)? callback;
  final TextEditingController? controller;
  final bool voiceActive;
  final int debounceTime;
  final List<Widget>? actions;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;

  @override
  State<CustomTextFieldSearch> createState() => _CustomTextFieldSearchState();
}

class _CustomTextFieldSearchState extends State<CustomTextFieldSearch> {
  //================ para las busquedas
  TextEditingController searchController = TextEditingController();
  Timer? debounce;

  @override
  void initState() {
    debounce = Timer(Duration(milliseconds: widget.debounceTime), () {});
    if (widget.initialText != null) {
      searchController.text = widget.initialText!;
    }
    searchController.addListener(_onSearchChanged);
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    debounce?.cancel();
    super.dispose();
  }

  //debounce para la busqueda
  void _onSearchChanged() {
    if (debounce != null && debounce!.isActive) {
      debounce?.cancel();
    }
    debounce = Timer(const Duration(milliseconds: 1200), () {
      setState(() {
        if (widget.callback == null) return;
        widget.callback!(searchController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            focusNode: widget.focusNode,
            controller: searchController,
            hintText: widget.hintText,
            onTapOutSide: (value) {
              FocusScope.of(context).unfocus();
            },
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: AppColors.textColor,
            ),
            suffixIcon: searchController.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      searchController.clear();
                    },
                    icon: const Icon(Icons.close, color: AppColors.textColor),
                  )
                : null,
          ),
        ),
        if (widget.actions != null) ...widget.actions!,
      ],
    );
  }
}
