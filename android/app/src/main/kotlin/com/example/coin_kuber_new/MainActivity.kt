package com.example.coin_kuber_new

import android.content.ActivityNotFoundException
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

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "shareTextToWhatsApp" -> {
                    val text = call.argument<String>("text")
                    val packageName = call.argument<String>("packageName")
                    resultCallback = result

                    if (text != null && packageName != null) {
                        shareTextOnlyToWhatsApp(text, packageName)
                    } else {
                        result.error("INVALID_ARGUMENT", "Arguments 'text' and 'packageName' are required.", null)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun shareTextOnlyToWhatsApp(text: String, packageName: String) {
        val packageManager = packageManager
        val isTargetInstalled = packageManager.getLaunchIntentForPackage(packageName) != null

        val intent = Intent(Intent.ACTION_SEND).apply {
            type = "text/plain"
            putExtra(Intent.EXTRA_TEXT, text)
            setPackage(packageName)
        }

        try {
            startActivityForResult(intent, 1)
        } catch (e: ActivityNotFoundException) {
            // App is not installed, inform the Flutter side
            Toast.makeText(this, "App not installed: $packageName", Toast.LENGTH_SHORT).show()
            resultCallback?.success("failed")
            resultCallback = null
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == 1) {
            if (resultCode == RESULT_OK) {
                resultCallback?.success("success")
            } else {
                resultCallback?.success("failed")
            }
            resultCallback = null
        }
    }
}


