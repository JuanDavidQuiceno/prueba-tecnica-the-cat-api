import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("default")

    productFlavors {
        create("development") {
            dimension = "default"
            applicationId = "com.thecatapi.app.dev"
            resValue(type = "string", name = "app_name", value = "Dev Catbreeds")
        }
        create("staging") {
            dimension = "default"
            applicationId = "com.thecatapi.app.stg"
            resValue(type = "string", name = "app_name", value = "Stg Catbreeds")
        }
        create("production") {
            dimension = "default"
            applicationId = "com.thecatapi.app"
            resValue(type = "string", name = "app_name", value = "Catbreeds")
        }
    }
}