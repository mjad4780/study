import 'package:flutter/material.dart';
import 'package:study/firebase_options.dart';

import 'native_player.dart';

void main() async {
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

//  # env:
//     #   FIREBASE_APP_ID: ${{ secrets.APP_ID }}
//     #   FIREBASE_CLI_TOKEN: ${{ secrets.FIREBASE_CLI_TOKEN }}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const VideoPage(),
    );
  }
}

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Native Video Player')),
      body: Column(
        children: [
          // الفيديو يظهر في نصف الشاشة
          SizedBox(
            // height: MediaQuery.of(context).size.height * 0.4,
            child: NativeVideoView(
              url:
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'باقي محتوى Flutter هنا 👇',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
