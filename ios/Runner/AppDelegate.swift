import Flutter
import AVFoundation
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    var splashCoordinator: EasySplashCoordinator?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
        let splashConfig = EasySplashNativeConfig(
            duration: 3.2,
            text: "Built by Yousef",
            backgroundLightHex: "#F4F5F7",
            backgroundDarkHex: "#050505",
            imageLightName: "simple_splash_view_image_light.png",
            imageDarkName: nil,
            lottieLightName: "simple_splash_view_lottie_light.json",
            lottieDarkName: nil,
            soundName: nil,
            textColorLightHex: "#1E1E1E",
            textColorDarkHex: "#FAFAFA",
            indicatorColorLightHex: "#FF5722",
            indicatorColorDarkHex: "#FFC107",
            showsIndicator: true,
            indicatorPosition: "below_visual",
            textPosition: "bottom",
            flutterImageAssetLight: "assets/images/figma.png",
            flutterImageAssetDark: nil,
            flutterLottieAssetLight: "assets/lottie/loading.json",
            flutterLottieAssetDark: nil,
            flutterSoundAsset: nil
        )
        splashCoordinator = EasySplashCoordinator(window: window, config: splashConfig)
        splashCoordinator?.presentIfNeeded()

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
