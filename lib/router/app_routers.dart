import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/customer_screen/presentation/add_customer/add_customer_dialog.dart';
import '../features/customer_screen/presentation/view_customer/view_customer.dart';
import '../features/estimation_screen/data/model/estimation_response_model.dart';
import '../features/estimation_screen/presentation/estimation_screen.dart';
import '../features/legal_entity_screen/presentation/legal_entity_screen.dart';
import '../features/login_screen/data/model/login_model.dart';
import '../features/login_screen/presentation/screens/login_screen.dart';
import '../features/payment_screen/presentation/payment_screen.dart';
import '../features/pdf_view_screen/presentation/pdfview_screen.dart';
import '../features/pdf_view_screen/presentation/pdfview_screen_old.dart';
import '../features/product_screen/presentation/mobile_ui/mobile_product_search_screen.dart';
import '../features/product_screen/presentation/mobile_ui/product_list_dialog.dart';
import '../features/splash_screen/presentation/splash_screen.dart';
import '../features/store_screen/presentation/store_screen.dart';
import '../features/update_password_screen/presentation/features/update_password_screen.dart';
import '../main.dart';
import 'app_pages.dart';

class AppRouters {
  // final bool? isConnected;
  //
  // AppRouters(this.isConnected);

  static GoRouter createRouter() {
    return GoRouter(
      navigatorKey: navigatorKey,
      // initialLocation: AppPages.SPLASH_SCREEN,
      routes: [
        GoRoute(
          path: AppPages.SPLASH_SCREEN,
          builder: (context, state) {
            final isConnected = state.extra is bool
                ? state.extra as bool
                : false;
            debugPrint("------->${state.extra as bool}");
            Future.delayed(Duration(milliseconds: 500));
            return SplashScreen(isConnected: isConnected);
          },
          // builder: (BuildContext context, GoRouterState state) =>
          //     const SplashScreen(),
        ),
        GoRoute(
          path: AppPages.STORE_LIST,
          pageBuilder: (context, state) {
            //var warehouseList = state.extra as List<WarehouseList>;
            return MaterialPage(
              // child: StoreScreen(warehouseList: warehouseList),
              child: StoreScreen(),
            );
          },
          // builder: (BuildContext context, GoRouterState state) =>
          //     const SplashScreen(),
        ),
        GoRoute(
          path: AppPages.LOGIN,
          pageBuilder: (context, state) =>
              const MaterialPage(child: LoginScreen()),
          // builder: (BuildContext context, GoRouterState state) =>
          //     const SplashScreen(),
        ),
        GoRoute(
          path: AppPages.LEGAL_ENTITY,
          builder: (BuildContext context, GoRouterState state) {
            final LoginModel loginModel = state.extra as LoginModel;
            return LegalEntityScreen(loginModel: loginModel);
          },
        ),
        GoRoute(
          path: AppPages.ESTIMATION,
          pageBuilder: (context, state) =>
              const MaterialPage(child: EstimationScreen()),
          // builder: (BuildContext context, GoRouterState state) =>
          //     const EstimationScreen(),
        ),
        GoRoute(
          path: AppPages.ADD_CUSTOMER,
          pageBuilder: (context, state) =>
              const MaterialPage(child: AddCustomerDialog()),
          // builder: (BuildContext context, GoRouterState state) =>
          //     const AddCustomerDialog(),
        ),
        GoRoute(
          path: AppPages.VIEW_CUSTOMER,
          pageBuilder: (context, state) =>
              const MaterialPage(child: ViewCustomer()),
          // builder: (BuildContext context, GoRouterState state) =>
          //     const AddCustomerDialog(),
        ),
        GoRoute(
          path: AppPages.SEARCH_PRODUCT,
          pageBuilder: (context, state) =>
              const MaterialPage(child: ProductSearchScreen()),
          // builder: (BuildContext context, GoRouterState state) =>
          //     const AddCustomerDialog(),
        ),
        GoRoute(
          path: AppPages.UPDATE_PASSWORD,
          pageBuilder: (context, state) =>
              const MaterialPage(child: UpdatePasswordScreen()),
          // builder: (BuildContext context, GoRouterState state) =>
          //     const AddCustomerDialog(),
        ),
        GoRoute(
          path: '/product-list',
          builder: (context, state) => const ProductListDialog(isDialog: false),
        ),
        GoRoute(
          path: AppPages.PDFVIEW,
          builder: (BuildContext context, GoRouterState state) {
            // final EstimationResponseModel estimationResponseModel =
            //     state.extra as EstimationResponseModel;
            // final mobile = state.extra;
            final extra = state.extra as Map<String, dynamic>;
            final estimationResponseModel =
            extra['estimationResponseModel'] as EstimationResponseModel;
            final mobileNo = extra['mobileNo'] as String;
            return PdfviewScreen(
              estimationResponseModel: estimationResponseModel,
              mobileNo: mobileNo,
            );
          },
        ),
        GoRoute(
          path: AppPages.PAYMENT,
          // pageBuilder: (context, state) =>
          //     const MaterialPage(child: PaymentScreen()),
          builder: (BuildContext context, GoRouterState state) {
            final mobile = state.extra as String;
            return PaymentScreen(mobileNo: mobile);
          }
        ),
      ],
    );
  }

  /*static final GoRouter _routers = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: AppPages.SPLASH_SCREEN,
      routes: [

        GoRoute(
          path: AppPages.SPLASH_SCREEN,
          builder: (context, state) {
            final bool isConnected = state.extra as bool? ?? false;
            return SplashScreen(isConnected: isConnected);
          },
          // builder: (BuildContext context, GoRouterState state) =>
          //     const SplashScreen(),
        ),
        GoRoute(
          path: AppPages.LOGIN,
          pageBuilder: (context, state) => const MaterialPage(
            child: LoginScreen(),
          ),
          // builder: (BuildContext context, GoRouterState state) =>
          //     const SplashScreen(),
        ),
        GoRoute(
            path: AppPages.LEGAL_ENTITY,
            builder: (BuildContext context, GoRouterState state) {
              final LoginModel loginModel = state.extra as LoginModel;
              return LegalEntityScreen(loginModel: loginModel);
            }),

        GoRoute(
          path: AppPages.ESTIMATION,
          pageBuilder: (context, state) => const MaterialPage(
            child: EstimationScreen(),
          ),
          // builder: (BuildContext context, GoRouterState state) =>
          //     const EstimationScreen(),
        ),
        GoRoute(
          path: AppPages.ADD_CUSTOMER,
          pageBuilder: (context, state) => const MaterialPage(
            child: AddCustomerDialog(),
          ),
          // builder: (BuildContext context, GoRouterState state) =>
          //     const AddCustomerDialog(),
        ),
        GoRoute(
          path: AppPages.VIEW_CUSTOMER,
          pageBuilder: (context, state) => const MaterialPage(
            child: ViewCustomer(),
          ),
          // builder: (BuildContext context, GoRouterState state) =>
          //     const AddCustomerDialog(),
        ),
        GoRoute(
          path: AppPages.SEARCH_PRODUCT,
          pageBuilder: (context, state) => const MaterialPage(
            child: ProductSearchScreen(),
          ),
          // builder: (BuildContext context, GoRouterState state) =>
          //     const AddCustomerDialog(),
        ),
        GoRoute(
          path: AppPages.UPDATE_PASSWORD,
          pageBuilder: (context, state) => const MaterialPage(
            child: UpdatePasswordScreen(),
          ),
          // builder: (BuildContext context, GoRouterState state) =>
          //     const AddCustomerDialog(),
        ),
        GoRoute(
            path: AppPages.PDFVIEW,
            builder: (BuildContext context, GoRouterState state) {
              final EstimationResponseModel estimationResponseModel = state.extra as EstimationResponseModel;
              return PdfviewScreen(estimationResponseModel: estimationResponseModel);
            }),
      ]);

  static GoRouter get routers => _routers;*/
}
