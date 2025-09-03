enum FlavorEmun {
  development,
  staging,
  production,
}

class FlavorsConfig {
  static late final FlavorEmun appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case FlavorEmun.development:
        return 'Dev Catbreeds';
      case FlavorEmun.staging:
        return 'Stg Catbreeds';
      case FlavorEmun.production:
        return 'Catbreeds';
    }
  }

  static String get iconApp {
    switch (appFlavor) {
      case FlavorEmun.development:
        return 'assets/icons/icon-app-dev.png';
      case FlavorEmun.staging:
        return 'assets/icons/icon-app-stg.png';
      case FlavorEmun.production:
        return 'assets/icons/icon-app.png';
    }
  }
}
