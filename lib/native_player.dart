import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeVideoView extends StatefulWidget {
  final String url;
  const NativeVideoView({super.key, required this.url});

  @override
  State<NativeVideoView> createState() => _NativeVideoViewState();
}

class _NativeVideoViewState extends State<NativeVideoView> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AndroidView(
          viewType: 'app.native/video_view',
          creationParams: {'url': widget.url},
          creationParamsCodec: const StandardMessageCodec(),
          onPlatformViewCreated: (_) {
            setState(() => _isLoading = false);
          },
        ),
        if (_isLoading) const CircularProgressIndicator(),
      ],
    );
  }
}
