import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/local/shared_preferences_helper.dart';
import '../../../router/app_pages.dart';

class SplashScreen extends StatefulWidget {
  final bool isConnected;

  const SplashScreen({super.key, required this.isConnected});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int count = 0;
  bool _hasHandledRouting = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !_hasHandledRouting) {
        _hasHandledRouting = true;
        _handleRouting();
      }
    });
  }

  Future<void> _handleRouting() async {
    debugPrint("🔵 SplashScreen started, isConnected: ${widget.isConnected}");
    if (!widget.isConnected) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        dismissOnTouchOutside: false,
        title: 'Device Alert',
        desc:
            'This app is being used on another device. Please close the app from the other device to continue.',
        btnOkOnPress: () => exit(0),
      ).show();
      return;
    } else {
      Future.delayed(
        Duration(milliseconds: 1500),
        () => context.go(AppPages.STORE_LIST),
      );
    }
  }

/*
  Future<bool> _initialize() async {
    String deviceId = await getDeviceId(); // Fetch Device ID
    bool isConnected =
        await connectToWebSocket(deviceId); // Connect to WebSocket

    if(isConnected){
      SharedPreferencesHelper.saveString(AppConstants.DEVICE_ID, deviceId);
    }
    debugPrint("isConnected------>$isConnected");
    return isConnected;
  }

  Future<String> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id; // Unique Android device ID
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor!; // Unique iOS device ID
    }
    return "Unknown_Device";
  }

  /// Function to connect to WebSocket and send the device ID
  Future<bool> connectToWebSocket(String deviceId) async {
    try {
      debugPrint("DeviceId-->$deviceId");

      final wsUrl = Uri.parse(
          '${ApiEndPoints.SOCKET_BASE_URL}=$deviceId');
      final channel = WebSocketChannel.connect(wsUrl);

      await channel
          .ready; // Ensures the connection is successful before returning

      channel.stream.listen(
        (event) {
          debugPrint("event-->$event");
        },
        onError: (error) {
          debugPrint("WebSocket ERROR: $error");
        },
        cancelOnError: true,
      );

      return true;
    } catch (error) {
      debugPrint("WebSocket connection failed: $error");
      return false;
    }
  }*/

  @override
  Widget build(BuildContext context) {
    // Future.delayed(
    //   const Duration(seconds: 2),
    //   () {
    //     if (mounted) {
    //       context.go(AppPages.URL_VERIFICATION);
    //     }
    //   },
    // );

    return Scaffold(
      backgroundColor: AppColors.LOGO_BACKGROUND_RED_COLOR, //Color(0xFFF1F1F1),
      body: SafeArea(
        child: Container(
          /*decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/doodle.png"),
              fit: BoxFit.cover,
            ),
          ),*/
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  child: Image.asset(
                    "assets/images/logo.png",
                  ),
                ),
              ),
              Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: AppColors.APP_WHITE_COLOR,
                  size: 35,
                ),
              ),
              Gap(MediaQuery.sizeOf(context).height * 0.01)
            ],
          ),
        ),
      ),
    );
  }

  bool _checkAccessToken() {
    // Example token retrieval (adjust to your use case)
    String? accessToken = SharedPreferencesHelper.getString(
        AppConstants.ACCESS_TOKEN); // Replace with your method

    if (accessToken == null || JwtDecoder.isExpired(accessToken)) {
      // Token is expired or doesn't exist
      return true;
    } else {
      // Token is valid
      return false;
    }
  }
}
