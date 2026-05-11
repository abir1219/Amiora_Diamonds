import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/api_end_points.dart';
import '../core/constants/app_constants.dart';
import '../core/local/shared_preferences_helper.dart';
import '../features/estimation_screen/data/repository/estimation_repository.dart';
import '../features/estimation_screen/presentation/bloc/estimation_bloc.dart';
import '../features/legal_entity_screen/data/repository/WarehouseRepository.dart';
import '../features/legal_entity_screen/presentation/bloc/legal_entity_bloc.dart';
import '../features/login_screen/bloc/login_bloc.dart';
import '../features/login_screen/data/repository/login_repository.dart';
import '../features/salesman_screen/data/repository/salesman_repository.dart';
import '../features/salesman_screen/presentation/bloc/salesman_bloc.dart';
import '../features/splash_screen/data/repository/store_repository.dart';
import '../features/splash_screen/presentation/bloc/store_bloc.dart';
import '../features/update_password_screen/data/repository/update_password_repository.dart';
import '../features/update_password_screen/presentation/bloc/update_password_bloc.dart';
import '../router/app_pages.dart';
import '../router/app_routers.dart';
import '../websocket_service.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late WebSocketService _webSocketService;

  bool isConnected = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeWebSocket();
  }

  Future<String> getDeviceId() async {
    SharedPreferencesHelper.init();
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

  Future<bool> _initializeWebSocket() async {
    await SharedPreferencesHelper.init();
    String deviceId = await getDeviceId(); // Fetch Device ID
    debugPrint("deviceId--->$deviceId");
    //bool isConnected =
    //await connectToWebSocket(deviceId); // Connect to WebSocket
    _webSocketService = WebSocketService(url: '${ApiEndPoints.SOCKET_BASE_URL}=$deviceId');
    if(_webSocketService.connect()){
      SharedPreferencesHelper.saveString(AppConstants.DEVICE_ID, deviceId);
    }
    debugPrint("isConnected------>${_webSocketService.connect()}");
    if(_webSocketService.connect()){
      setState(() {
        isConnected = true;
      });
    }
    // return isConnected;
    return _webSocketService.connect();
  }

  void _connectWebSocket() {
    _webSocketService.connect();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _webSocketService.disconnect();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _webSocketService.disconnect();
    } else if (state == AppLifecycleState.resumed) {
      _connectWebSocket();
    }
  }

  @override
  Widget build(BuildContext context) {
    final GoRouter routers = AppRouters.createRouter();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      debugPrint("----->>>><<<<<-----");
      routers.go(AppPages.SPLASH_SCREEN, extra: _webSocketService.connect());
    });

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UpdatePasswordBloc(UpdatePasswordRepository())),
        BlocProvider(create: (_) => EstimationBloc(EstimationRepository())),
        BlocProvider(create: (_) => LegalEntityBloc(WarehouseRepository())),
        BlocProvider(create: (_) => SalesmanBloc(SalesmanRepository())),
        BlocProvider(create: (_) => LoginBloc(LoginRepository())),
        BlocProvider(create: (_) => StoreBloc(StoreRepository())),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Amiora Diamond',
        routerDelegate: routers.routerDelegate,
        routeInformationProvider: routers.routeInformationProvider,
        routeInformationParser: routers.routeInformationParser,
        theme: ThemeData(
          fontFamily: "Montserrat",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}