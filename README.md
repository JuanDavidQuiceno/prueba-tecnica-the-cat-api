
# Guía de Compilación del Proyecto

Este documento proporciona los comandos necesarios para compilar la aplicación en sus diferentes entornos (sabores): **Desarrollo**, **Staging** y **Producción** para las plataformas de Android e iOS.

## Prerrequisitos

Asegúrate de tener los archivos de configuración de claves de API para cada entorno en la raíz del proyecto:
- `api-key-local.json`
- `api-key-dev.json`
- `api-key-stg.json`
- `api-key-prod.json`

---

## 📱 Android

### Compilación de AppBundle (.aab) para Google Play

Usa los siguientes comandos para generar un Android App Bundle, que es el formato recomendado para publicar en la Google Play Store.

* **Desarrollo (Development)**
    ```sh
    flutter build appbundle --flavor development --target=lib/main_development.dart --dart-define-from-file=api-key-dev.json
    ```

* **Staging**
    ```sh
    flutter build appbundle --flavor staging --target=lib/main_staging.dart --dart-define-from-file=api-key-stg.json
    ```

* **Producción (Production)**
    ```sh
    flutter build appbundle --flavor production --target=lib/main_production.dart --dart-define-from-file=api-key-prod.json
    ```

### Compilación de APK (.apk) para Pruebas

Usa estos comandos para generar archivos APK, útiles para instalaciones directas en dispositivos de prueba. El flag `--split-per-abi` crea un APK optimizado para diferentes arquitecturas de procesador.

* **Desarrollo (Development)**
    ```sh
    flutter build apk --split-per-abi --flavor development --target=lib/main_development.dart --dart-define-from-file=api-key-dev.json
    ```

* **Staging**
    ```sh
    flutter build apk --split-per-abi --flavor staging --target=lib/main_staging.dart --dart-define-from-file=api-key-stg.json
    ```

* **Producción (Production)**
    ```sh
    flutter build apk --split-per-abi --flavor production --target=lib/main_production.dart --dart-define-from-file=api-key-prod.json
    ```

---

## 🍏 iOS

### Compilación de IPA (.ipa) para TestFlight y App Store

Usa los siguientes comandos para generar un archivo `.ipa`, que se utiliza para distribuir la aplicación a través de TestFlight o para subirla a la App Store.

* **Desarrollo (Development)**
    ```sh
    flutter build ipa --flavor development --target=lib/main_development.dart --dart-define-from-file=api-key-dev.json
    ```

* **Staging**
    ```sh
    flutter build ipa --flavor staging --target=lib/main_staging.dart --dart-define-from-file=api-key-stg.json
    ```

* **Producción (Production)**
    ```sh
    flutter build ipa --flavor production --target=lib/main_production.dart --dart-define-from-file=api-key-prod.json
    ```

### Abrir el Archivo de Xcode

Después de ejecutar cualquiera de los comandos `build ipa`, se generará un archivo `.xcarchive`. Para abrirlo en Xcode (y proceder con la distribución), ejecuta el siguiente comando:

```sh
open ./build/ios/archive/Runner.xcarchive
```
