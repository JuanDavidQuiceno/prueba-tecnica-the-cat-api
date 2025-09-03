class Environment {
  const Environment._();

  static Map<String, String> get headers => const {
    'x-api-key': String.fromEnvironment('x-api-key'),
  };
  static String get urlApi => const String.fromEnvironment('API_URL');
  static String get urlCatImage =>
      const String.fromEnvironment('URL_CAT_IMAGE');
}
