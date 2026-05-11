
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/api_status.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/local/shared_preferences_helper.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../../../../main.dart';
import '../../../../router/app_pages.dart';
import '../../../legal_entity_screen/presentation/bloc/legal_entity_bloc.dart';
import '../../../product_screen/presentation/mobile_ui/estimation_info_dialog.dart';
import '../../../salesman_screen/presentation/salesman_list_dialog.dart';
import '../bloc/estimation_bloc.dart';

class MobileEstimation extends StatefulWidget {
  const MobileEstimation({super.key});

  @override
  State<MobileEstimation> createState() => _MobileEstimationState();
}

class _MobileEstimationState extends State<MobileEstimation> {
  final estimateNoController = TextEditingController();
  final mobileNoController = TextEditingController();
  final mobileNoFocusNode = FocusNode();
  final _stateController = TextEditingController();
  final _salesmanController = TextEditingController();
  final _narrationController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    estimateNoController.dispose();
    mobileNoController.dispose();
    _stateController.dispose();
    _salesmanController.dispose();
    _narrationController.dispose();
    mobileNoFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),)));
  }

  bool _validateMobileNo() {
    final text = mobileNoController.text.trim();
    if (text.isEmpty) {
      _showSnack("Please add a mobile no.");
      return false;
    }
    if (text.length < 10) {
      _showSnack("Please enter a valid mobile no.");
      return false;
    }
    return true;
  }

  void _handleMobileSubmit(EstimationState state) {
    // if (!_validateMobileNo()) return ;

    mobileNoFocusNode.unfocus();
    // debugPrint("MobileController-->${mobileNoController.text}");
    // SharedPreferencesHelper.saveString(AppConstants.MOBILE_NO, mobileNoController.text);
    // debugPrint("Mobile-->${SharedPreferencesHelper.getString(AppConstants.MOBILE_NO)}");
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    if(mobileNoController.text.isEmpty){
      _showSnack("Please add a mobile no.");
    }else if(mobileNoController.text.length < 10){
      _showSnack("Please enter a valid mobile no.");
    }
    else if (_salesmanController.text.isNotEmpty) {
      // Navigate if required
    } else {
      _showSalesmanDialog(state);
    }
  }

  void _showSalesmanDialog(EstimationState state) {
    showDialog(
      context: context,
      builder: (context) {
        return SalesmanListDialog(
          employeeList: state.employeeList,
          onCallback: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mobileNoController.text.isEmpty || _salesmanController.text.isEmpty) {
                mobileNoFocusNode.requestFocus();
              }
            });
          },
        );
      },
    );
  }

  void _handleSubmit(EstimationState state) {
    if (state.selectedProductList!.isEmpty) {
      _showSnack("Please add product");
      return;
    }
    if(mobileNoController.text.isEmpty){
      _showSnack("Please add a mobile no.");
      mobileNoFocusNode.requestFocus();
    }else if(mobileNoController.text.length < 10){
      _showSnack("Please enter a valid mobile no.");
      mobileNoFocusNode.requestFocus();
    } else if (state.salesPersonId == null) {
      _showSnack("Please select a sales person");
      return;
    }else{
      SharedPreferencesHelper.saveString(AppConstants.MOBILE_NO, mobileNoController.text);
      //context.go(AppPages.PAYMENT,extra: mobileNoController.text);
      Future.delayed(Duration(microseconds: 300),() => context.read<EstimationBloc>().add(const SendEstimateData()));
    }

    //_handleMobileSubmit(state);
    // context.read<EstimationBloc>().add(const SendEstimateData());
    /*if (state.estimationNumber != null) {
      context.read<EstimationBloc>().add(const SendEstimateData());
    }*/
  }

  Future _showSuccessDialog() {
    final size = MediaQuery.sizeOf(context);
    return showDialog(
      barrierColor: Colors.white,
      context: context,
      builder: (context) {
        return Lottie.asset(
          'assets/lottie/success_lottie.json',
          width: size.width * 0.4,
          height: size.height * 0.4,
          repeat: false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.APP_BACKGROUND_COLOR,
      body: SafeArea(
        child: BlocConsumer<EstimationBloc, EstimationState>(
          listenWhen: (prev, curr) => curr.apiStatus == ApiStatus.success,
          listener: (context, state) {
            if (state.apiStatus == ApiStatus.success) {
              _showSuccessDialog();
              Future.delayed(const Duration(milliseconds: 2500), () {
                if (!mounted) return;
                navigatorKey.currentContext!.go(
                  AppPages.PDFVIEW,
                  //extra: state.estimationResponseModel,
                  extra: {
                    'estimationResponseModel': state.estimationResponseModel,
                    'mobileNo': mobileNoController.text, // pass mobile no here
                  },
                );
              });
            }
          },
          builder: (context, state) {
            // Update controllers only when state changes
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _stateController.text = state.stateName ?? "";
              _salesmanController.text = state.salesmanName ?? "";
              estimateNoController.text = state.estimationNumber ?? "";

              if (estimateNoController.text.isNotEmpty) {
                mobileNoFocusNode.requestFocus();
              }
            });

            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return SingleChildScrollView(
                  controller: _scrollController,
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom, // ✅ prevents overflow
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          AppWidgets().buildTopEstimationContainer(size, isShown: true, isLoggedIn: true),
                          Gap(AppDimensions.getResponsiveHeight(context) * .02),
                          AppWidgets().buildStepperContainer(size, pageNo: 2),
                          Gap(AppDimensions.getResponsiveHeight(context) * .02),

                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: AppDimensions.getResponsiveWidth(context) * .02),
                              padding: EdgeInsets.symmetric(
                                horizontal: AppDimensions.getResponsiveWidth(context) * .03,
                                vertical: AppDimensions.getResponsiveHeight(context) * .02,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    AppWidgets.buildField(
                                      size,
                                      "Mobile No",
                                      mobileNoController,
                                      focusNode: mobileNoFocusNode,
                                      onTap: () {
                                        Future.delayed(const Duration(milliseconds: 300), () {
                                          _scrollController.animateTo(
                                            _scrollController.position.maxScrollExtent,
                                            duration: const Duration(milliseconds: 300),
                                            curve: Curves.easeInOut,
                                          );
                                        });
                                      },
                                      onSubmit: () => _handleMobileSubmit(state),
                                      maxLength: 10,
                                      textInputType: TextInputType.phone,
                                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                    ),
                                    AppWidgets.buildSearchableField(
                                      size,
                                      "Sales Person",
                                      _salesmanController,
                                      isProductList: false,
                                      color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                                      // state.estimationNumber != null
                                      //     ? AppColors.STEPPER_DONE_COLOR
                                      //     : AppColors.HINT_TEXT_COLOR,
                                      func: () {
                                        _showSalesmanDialog(state);
                                        // if (state.estimationNumber != null) {
                                        //   _showSalesmanDialog(state);
                                        // }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Gap(AppDimensions.getResponsiveHeight(context) * .01),
                          _buildBottomButtons(size, state),
                          Gap(size.height * 0.01),
                          _buildFooter(size, state),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: _buildFloatingButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  Widget _buildBottomButtons(Size size, EstimationState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.getResponsiveHeight(context) * .01),
      child: Row(
        children: [
          Expanded(
            child: AppWidgets.customMobileButton(
              size: size,
              btnName: 'Home',
              color: AppColors.LOGO_BACKGROUND_RED_COLOR,
              func: () => context.go(AppPages.SEARCH_PRODUCT),
            ),
          ),
          Expanded(
            child: AppWidgets.customMobileButton(
              size: size,
              btnName: 'Reset',
              func: () {
                mobileNoController.clear();
                context.read<EstimationBloc>().add(ResetDataEvent());
                // if (state.estimationNumber != null) {
                //   context.read<EstimationBloc>().add(ResetDataEvent());
                // }
              },
              color: AppColors.LOGO_BACKGROUND_RED_COLOR,
              // state.estimationNumber != null
              //     ? AppColors.LOGO_BACKGROUND_RED_COLOR
              //     : AppColors.HINT_TEXT_COLOR,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(Size size, EstimationState state) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: AppColors.LOGO_BACKGROUND_RED_COLOR,
      ),
      height: size.height * .08,
      child: Row(
        children: [
          Expanded(child: _buildEstimateAmount(size, state)),
          Expanded(child: _buildSubmitButton(size, state)),
          Gap(size.width * 0.01),
        ],
      ),
    );
  }

  Widget _buildEstimateAmount(Size size, EstimationState state) {
    final totalAmount = state.lineAmountList?.fold<double>(0.0, (a, b) => a + b) ?? 0.0;

    return Expanded(
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
    );
      /*Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Estimate Amount", style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w300)),
            Gap(size.width * 0.004),
            InkWell(
              onTap: () => showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                barrierColor: Colors.black45,
                transitionDuration: const Duration(milliseconds: 300),
                transitionBuilder: (context, animation, secondary, child) =>
                    SlideTransition(position: Tween(begin: const Offset(0, 1), end: Offset.zero).animate(animation), child: child),
                pageBuilder: (_, __, ___) => const EstimationInfoDialog(),
              ),
              child: const Icon(Icons.info, size: 18, color: Colors.white),
            ),
          ],
        ),
        Text("₹ ${AppWidgets.formatIndianNumber(totalAmount)}",
            style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400)),
      ],
    );*/
  }

  Widget _buildSubmitButton(Size size, EstimationState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
      child: AppWidgets.customMobileButton(
        size: size,
        func: () => _handleSubmit(state),
        btnName: "Submit",
        isLoading: state.apiStatus == ApiStatus.loading,
        color: Colors.white,
        textColor: AppColors.LOGO_BACKGROUND_RED_COLOR,
      ),
    );
  }

  Widget _buildFloatingButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppDimensions.getResponsiveHeight(context) * .02),
      child: FloatingActionButton.small(
        backgroundColor: AppColors.APP_WHITE_COLOR,
        onPressed: () {
          context.read<EstimationBloc>().add(LogoutEvent());
          context.read<LegalEntityBloc>().add(ClearStateEvent());
          Future.delayed(const Duration(milliseconds: 500), () {
            if (mounted) navigatorKey.currentContext!.go(AppPages.STORE_LIST);
          });
        },
        child: const Icon(Icons.home, color: AppColors.LOGO_BACKGROUND_RED_COLOR,
            //Colors.white
        ),
      ),
    );
  }
}
