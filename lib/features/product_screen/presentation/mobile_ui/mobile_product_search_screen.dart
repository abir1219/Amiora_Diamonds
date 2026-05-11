import 'dart:io';

import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../features/product_screen/presentation/mobile_ui/product_list.dart';
import '../../../../features/product_screen/presentation/mobile_ui/product_list_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/api_status.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../../../../router/app_pages.dart';
import '../../../estimation_screen/presentation/bloc/estimation_bloc.dart';
import '../../../legal_entity_screen/presentation/bloc/legal_entity_bloc.dart';
import 'estimation_info_dialog.dart';

class ProductSearchScreen extends StatefulWidget {
  const ProductSearchScreen({super.key});

  @override
  State<ProductSearchScreen> createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showMyDialog();
    });
  }

  void _showMyDialog() {
    showDialog(
      barrierDismissible: false,
      builder: (context) {
        return const ProductListDialog(isDialog: true);
      },
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return ScaffoldMessenger(
      child: PopScope(
        //canPop: false, // we handle back navigation manually
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return; // already popped, no need to handle

          /*final now = DateTime.now();
          if (_lastPressed == null || now.difference(_lastPressed!) > Duration(seconds: 2)) {
            _lastPressed = now;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Press again to exit'),
                duration: Duration(milliseconds: 1000),
              ),
            );
          } else {
            // Exit the app manually
            //Navigator.of(context).pop(result); // or SystemNavigator.pop();
            exit(0);
          }*/
          exit(0);
        },
        child: Scaffold(
          floatingActionButton: Padding(
            padding: EdgeInsets.only(
              top: AppDimensions.getResponsiveHeight(context) * .02,
            ),
            child: FloatingActionButton.small(
              backgroundColor: AppColors.APP_WHITE_COLOR,
              onPressed: () {
                context.read<EstimationBloc>().add(LogoutEvent());
                context.read<LegalEntityBloc>().add(ClearStateEvent());
                // context.read<StoreBloc>().add(FetchStoreEvent());
                Future.delayed(Duration(milliseconds: 500), () {
                  if (mounted) {
                    context.go(
                      // AppPages.LOGIN,
                      AppPages.STORE_LIST,
                    );
                  }
                });
              },
              child: Icon(
                Icons.home,
                color: AppColors.LOGO_BACKGROUND_RED_COLOR,//Colors.white,
              ), //SvgPicture.asset("assets/images/logout.svg"),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          body: SafeArea(
            child: Column(
              children: [
                AppWidgets().buildTopEstimationContainer(size),
                Gap(size.height * .01),
                AppWidgets().buildStepperContainer(size, pageNo: 1),
                /*Gap(size.height * .01),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return SalesmanListDialog(employeeList: null);
                      },
                    );
                  },
                  child: Container(
                    height: size.height * .05,
                    //MediaQuery.sizeOf(context),
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                    ),
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(145),
                          blurRadius: 1.2,
                          blurStyle: BlurStyle.outer,
                          offset: Offset(0.5, 0.5),
                          spreadRadius: 1.5,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocConsumer<EstimationBloc, EstimationState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return Text(
                              (state.salesmanName == null ||
                                  state.salesmanName!.isEmpty)
                                  ? "Employee Name"
                                  : state.salesmanName!,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 34,
                          width: 34,
                          child: Center(
                            child: SvgPicture.asset("assets/images/search.svg"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),*/
                Gap(size.height * .01),
                const Expanded(child: ProductList()),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.height * .02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      /*Expanded(
                        child: AppWidgets.customMobileButton(
                          size: size,
                          btnName: 'Cancel',
                          color: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
                          func: () => context.go(
                            AppPages.ESTIMATION,
                          ),
                        ),
                      ),*/
                      Expanded(
                        child: AppWidgets.customMobileButton(
                          size: size,
                          btnName: 'Reset',
                          func:
                              () =>
                              context.read<EstimationBloc>().add(
                                ResetSelectedProductDataEvent(),
                              ),
                          color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                        ),
                      ),
                      Expanded(
                        child: AppWidgets.customMobileButton(
                          size: size,
                          btnName: 'Add Product',
                          color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                          func: () {
                            showDialog(
                              barrierDismissible: false,
                              builder: (context) {
                                return const ProductListDialog(isDialog: true);
                              },
                              context: context,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(size.height * 0.01),
                // Gap(size.height * .01),
                Container(
                  //margin: EdgeInsets.symmetric(horizontal: size.width * .02,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                  ),
                  height: size.height * .08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: BlocConsumer<EstimationBloc, EstimationState>(
                          listener: (context, state) {
                          },
                          builder: (context, state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Estimate Amount",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Gap(size.width * 0.004),
                                    (state.selectedProductList!.isNotEmpty)?InkWell(
                                      onTap: () {
                                        showGeneralDialog(
                                          context: context,
                                          // builder: (context) => const IngredientsFormDialog(),
                                          barrierDismissible: true,
                                          barrierLabel:
                                          MaterialLocalizations
                                              .of(
                                            context,
                                          )
                                              .modalBarrierDismissLabel,
                                          barrierColor: Colors.black45,
                                          transitionDuration: const Duration(
                                            milliseconds: 300,
                                          ),
                                          transitionBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child,) {
                                            return SlideTransition(
                                              position: Tween<Offset>(
                                                begin: const Offset(0, 1),
                                                // Start from the bottom
                                                end: const Offset(
                                                  0,
                                                  0,
                                                ), // End at the center
                                              ).animate(
                                                CurvedAnimation(
                                                  parent: animation,
                                                  curve:
                                                  Curves
                                                      .easeInOut, // Ease-in transformation
                                                ),
                                              ),
                                              child: child,
                                            );
                                          },
                                          pageBuilder:
                                              (BuildContext context,
                                              Animation<double> animation,
                                              Animation<double>
                                              secondaryAnimation,) => const EstimationInfoDialog(),
                                        );
                                      },
                                      child: const Icon(
                                        Icons.info,
                                        size: 22,
                                        color: Colors.white,
                                      ),
                                    ):Container(),
                                  ],
                                ),
                                BlocConsumer<EstimationBloc, EstimationState>(
                                  listener: (context, state) {},
                                  builder: (BuildContext context,
                                      EstimationState state,) {
                                    if (state.lineAmountList!.isNotEmpty) {
                                      double totalAmount = 0.0;
                                      for (
                                      int i = 0;
                                      i < state.lineAmountList!.length;
                                      i++
                                      ) {
                                        totalAmount += state.lineAmountList![i];
                                      }
                                      return Text(
                                        // "₹ ${totalAmount.toStringAsFixed(2)}",
                                        "₹ ${AppWidgets.formatIndianNumber(
                                            totalAmount)}",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      );
                                    } else {
                                      return const Text(
                                        "₹ 0.00",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.01,
                          ),
                          child: BlocConsumer<EstimationBloc, EstimationState>(
                            listenWhen:
                                (previous, current) =>
                            current.apiStatus == ApiStatus.success,
                            listener: (context, state) {
                              debugPrint("STATE_STATUS--->${state.apiStatus}");
                              if (state.apiStatus == ApiStatus.success) {
                                /*ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        content: Text(
                                  state.message!,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )));*/
                                /*Lottie.asset(
                                  'assets/animations/success_lottie.json',
                                  width: 150,
                                  height: 150,
                                  repeat: false,
                                );*/
                                _showSuccessDialog();
                                Future.delayed(
                                  const Duration(milliseconds: 2500),
                                      () {
                                    if (!mounted) return;
                                    context.go(AppPages.PDFVIEW,
                                        extra: state.estimationResponseModel);
                                  },
                                );
                              }
                            },
                            builder: (context, state) {
                              return AppWidgets.customMobileButton(
                                size: size,
                                func: () {
                                  if (state.selectedProductList!.isNotEmpty) {
                                    /*context
                                        .read<EstimationBloc>()
                                        .add(const SendEstimateData());*/
                                    //context.go(AppPages.ESTIMATION);
                                    /*if(state.employee != null){
                          context
                              .read<EstimationBloc>()
                              .add(const SendEstimateData());
                        }else{
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return SalesmanListDialog(employeeList: null);
                            },
                          );
                        }*/
                                    // context
                                    //     .read<EstimationBloc>()
                                    //     .add(const SendEstimateData());

                                    // context.go(AppPages.PAYMENT);
                                    context.go(AppPages.ESTIMATION);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Please add product",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),),
                                      ),
                                    );
                                  }
                                },
                                btnName: "Sales Advice",//"Submit",
                                //"Sales Advice",
                                isLoading:
                                state.apiStatus == ApiStatus.loading
                                    ? true
                                    : false,
                                color: Colors.white,
                                textColor: AppColors.LOGO_BACKGROUND_RED_COLOR,
                              );
                            },
                          ),
                        ),
                      ),
                      Gap(size.width * 0.01),
                    ],
                  ),
                ),
                //Gap(size.height * .01),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*Future _showSuccessDialog() {
    var size = MediaQuery.sizeOf(context);
    return showDialog(
      barrierColor: Colors.white,
      context: context,
      builder: (context) {
        return Lottie.asset(
          'assets/lottie/success_lottie.json',
          width: size.width * 0.4,
          height: size.height * 0.4,
          // height: 150,
          repeat: false,
        );
      },
    );
  }*/

  Future _showSuccessDialog() {
    var size = MediaQuery.sizeOf(context);
    return showDialog(
      barrierColor: Colors.white,
      context: context,
      builder: (context) {
        return Lottie.asset(
          'assets/lottie/success_lottie.json',
          width: size.width * 0.4,
          height: size.height * 0.4,
          // height: 150,
          repeat: false,
        );
      },
    );
  }
}
