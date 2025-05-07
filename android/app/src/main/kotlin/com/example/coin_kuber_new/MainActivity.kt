package com.example.coin_kuber_new

import io.flutter.embedding.android.FlutterActivity
import android.content.Intent
import android.net.Uri
import android.widget.Toast
import androidx.annotation.NonNull
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileOutputStream
import java.net.HttpURLConnection
import java.net.URL
import android.webkit.MimeTypeMap
import android.content.pm.PackageManager
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterFragmentActivity() {
    private val CHANNEL = "com.example.coin_kuber_new/share"
    private var resultCallback: MethodChannel.Result? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            val packageName = call.argument<String>("packageName")

            when (call.method) {
                "shareTextToWhatsApp" -> {
                    val imageUrl = call.argument<String>("imageUrl")
                    val text = call.argument<String>("text")
                    if (imageUrl != null && text != null && packageName != null) {
                        resultCallback = result
                        shareMediaToWhatsApp(imageUrl, text, packageName)
                    } else if(imageUrl == null && text != null && packageName != null) {
                        resultCallback = result
                        shareMediaToWhatsApp(imageUrl, text, packageName)
                    } else {
                        result.error("INVALID_ARGUMENT", "Arguments 'imageUrl' and 'text' are required.", null)
                    }
                }

                "isAppInstalled" -> {
                    if (packageName != null) {
                        val isInstalled = isPackageInstalled(packageName)
                        result.success(isInstalled)
                    } else {
                        result.error("INVALID_ARGUMENT", "Missing 'packageName'.", null)
                    }
                }

                "openApp" -> {
                    if (packageName != null) {
                        val opened = openApp(packageName)
                        result.success(opened)
                    } else {
                        result.error("INVALID_ARGUMENT", "Missing 'packageName'.", null)
                    }
                }

                else -> result.notImplemented()
            }
        }
    }

    private fun isPackageInstalled(packageName: String): Boolean {
        return try {
            packageManager.getPackageInfo(packageName, 0)
            true
        } catch (e: PackageManager.NameNotFoundException) {
            false
        }
    }

    private fun openApp(packageName: String): Boolean {
        return try {
            val launchIntent = packageManager.getLaunchIntentForPackage(packageName)
            if (launchIntent != null) {
                startActivity(launchIntent)
                true
            } else {
                false
            }
        } catch (e: Exception) {
            false
        }
    }

    private fun shareMediaToWhatsApp(mediaUrl: String?, text: String, packageName: String) {
        Thread {
            try {
                val packageManager = packageManager
                val isTargetInstalled = packageManager.getLaunchIntentForPackage(packageName) != null

                if (!isTargetInstalled) {
                    runOnUiThread {
                        Toast.makeText(
                            this,
                            "Selected WhatsApp version is not installed!",
                            Toast.LENGTH_SHORT
                        ).show()
                    }
                    resultCallback?.error("WHATSAPP_NOT_INSTALLED", "WhatsApp not installed", null)
                    resultCallback = null
                    return@Thread
                }

                val intent = Intent(Intent.ACTION_SEND).apply {
                    putExtra(Intent.EXTRA_TEXT, text)
                    setPackage(packageName)
                    addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                }

                // ✅ Check for real null/empty or 'null' string
                if (!mediaUrl.isNullOrEmpty() && !mediaUrl.contains("null")) {
                    val url = URL(mediaUrl)
                    val connection = url.openConnection() as HttpURLConnection
                    connection.doInput = true
                    connection.connect()
                    val inputStream = connection.inputStream

                    val fileExtension = MimeTypeMap.getFileExtensionFromUrl(mediaUrl)
                    val mimeType =
                        MimeTypeMap.getSingleton().getMimeTypeFromExtension(fileExtension) ?: "*/*"
                    val fileName = "shared_file.$fileExtension"

                    val cachePath = File(cacheDir, "shared")
                    cachePath.mkdirs()
                    val file = File(cachePath, fileName)
                    val outputStream = FileOutputStream(file)
                    inputStream.copyTo(outputStream)
                    outputStream.flush()
                    outputStream.close()

                    val uri = FileProvider.getUriForFile(
                        applicationContext,
                        "${applicationContext.packageName}.fileprovider",
                        file
                    )

                    intent.type = mimeType
                    intent.putExtra(Intent.EXTRA_STREAM, uri)
                } else {
                    intent.type = "text/plain"
                }

                startActivityForResult(Intent.createChooser(intent, "Share via WhatsApp"), 1)

            } catch (e: Exception) {
                runOnUiThread {
                    Toast.makeText(this, "Failed to share media: ${e.message}", Toast.LENGTH_SHORT).show()
                }
                resultCallback?.error("SHARE_FAILED", e.message, null)
                resultCallback = null
            }
        }.start()
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if (requestCode == 1) {
            if (resultCallback != null) {
                if (resultCode == RESULT_OK) {
                    resultCallback?.success("success")
                } else {
                    resultCallback?.success("failed")
                }
                resultCallback = null
            }
        }
    }
}


