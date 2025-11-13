package com.example.study


import android.content.Context
import android.net.Uri
import android.widget.FrameLayout
import android.widget.MediaController
import android.widget.VideoView
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory("app.native/video_view", NativeVideoFactory())
    }
}

// Factory لإنشاء VideoView
class NativeVideoFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val params = args as Map<String, Any>?
        val url = params?.get("url") as? String ?: ""
        return NativeVideoView(context, url)
    }
}

// View نفسه
class NativeVideoView(context: Context, private val url: String) : PlatformView {
    private val videoView = VideoView(context)
    private val container = FrameLayout(context)

    init {
        val controller = MediaController(context)
        controller.setAnchorView(videoView)
        videoView.setMediaController(controller)
        videoView.setVideoURI(Uri.parse(url))
        videoView.setOnPreparedListener {
            videoView.start()
        }
        container.addView(videoView)
    }

    override fun getView() = container
    override fun dispose() {
        videoView.stopPlayback()
    }
}
