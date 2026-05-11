import '../../../../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/api_status.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../router/app_pages.dart';
import '../../estimation_screen/presentation/bloc/estimation_bloc.dart';
import '../../legal_entity_screen/presentation/bloc/legal_entity_bloc.dart';

class PaymentScreen extends StatefulWidget {
  final String mobileNo;
  const PaymentScreen({super.key, required this.mobileNo});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final Map<String, TextEditingController> _controllers = {
    "Card\t": TextEditingController(),
    "Cash\t": TextEditingController(),
    "Cheque\t": TextEditingController(),
    "Adjustment\t": TextEditingController(),
    "Other\t": TextEditingController(),
  };


  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  double _calculateLeftAmount(double totalEstimationAmount) {
    double sum = 0;
    for (final controller in _controllers.values) {
      if (controller.text.isNotEmpty) {
        sum += double.tryParse(controller.text) ?? 0;
      }
    }
    return totalEstimationAmount - sum;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    // compute totals
    final estState = context.watch<EstimationBloc>().state;
    double totalEstimationAmount = estState.lineAmountList?.fold(0.0, (sum, item) => sum! + item) ?? 0.0;
    double leftAmount = _calculateLeftAmount(totalEstimationAmount);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          // context.go(AppPages.SEARCH_PRODUCT);
          context.go(AppPages.ESTIMATION);
        }
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton.small(
          backgroundColor: AppColors.LOGO_BACKGROUND_RED_COLOR,
          onPressed: _handleLogout,
          child: const Icon(Icons.home, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: SafeArea(
          child: Column(
            children: [
              AppWidgets().buildTopEstimationContainer(size / 2),
              AppWidgets().buildStepperContainer(size, pageNo: 3),

              // 🔹 Payment Fields
              Expanded(
                flex: 2,
                child: ListView.separated(
                  padding: const EdgeInsets.all(4),
                  itemCount: _controllers.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 4),
                  itemBuilder: (context, index) {
                    final title = _controllers.keys.elementAt(index);
                    final controller = _controllers[title]!;
                    return _buildPaymentField(title, controller,totalEstimationAmount, leftAmount);
                  },
                ),
              ),
          Column(
            spacing: 1,
            children: [
              // 🔹 Top Bar: Left Amount
              // 🔹 Top Bar: Left Amount
              Container(
                margin: EdgeInsets.symmetric(vertical: size.height * 0.005, horizontal: size.width * 0.02),
                padding: EdgeInsets.symmetric(horizontal: size.height * .02, vertical: size.height * 0.008),
                decoration: BoxDecoration(
                  color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(20),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Left Amount",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "₹ ${AppWidgets.formatIndianNumber(leftAmount)}", // Bind dynamically
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // 🔹 Bottom Section: Estimate Amount + Next Button
              Container(
                height: size.height * .08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                ),
                child: Row(
                  children: [
                    // 🔹 Estimate Amount Section
                    Expanded(
                      child: BlocBuilder<EstimationBloc, EstimationState>(
                        builder: (context, state) {
                          // double totalEstimationAmount  = state.lineAmountList?.fold(0.0, (sum, item) => sum! + item) ?? 0.0;
                          // double leftAmount = _calculateLeftAmount(totalEstimationAmount);

                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Estimate Amount",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "₹ ${AppWidgets.formatIndianNumber(totalEstimationAmount)}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    // 🔹 Next Button
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
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
                                    'mobileNo': widget.mobileNo, // pass mobile no here
                                  },
                                );
                              });
                            }
                          },
                          builder: (context, state) {
                            return AppWidgets.customMobileButton(
                              size: size,
                              btnName: "Submit",
                              func: () {
                                final Map<String, double> filteredData = {};

                                _controllers.forEach((key, controller) {
                                  final value = double.tryParse(controller.text) ?? 0.0;
                                  if (value > 0) {
                                    filteredData[key] = value;
                                  }
                                });
                                context.read<EstimationBloc>().add(SavePaymentDetails(filteredData));
                                context.read<EstimationBloc>().add(const SendEstimateData());
                                // Future.delayed(Duration(milliseconds: 500),() => navigatorKey.currentContext!.go(AppPages.ESTIMATION),);
                                // await Future.delayed(Duration(milliseconds: 500));
                                // navigatorKey.currentContext!.go(AppPages.ESTIMATION);
                              },
                              isLoading: state.apiStatus == ApiStatus.loading,
                              color: Colors.white,
                              textColor: AppColors.LOGO_BACKGROUND_RED_COLOR,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.01),
                  ],
                ),
              ),
            ],
          ),
          ],
          ),
        ),
      ),
    );
  }

  void _handleLogout() {
    context.read<EstimationBloc>().add(LogoutEvent());
    context.read<LegalEntityBloc>().add(ClearStateEvent());

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        context.go(AppPages.STORE_LIST);
      }
    });
  }

  Future _showSuccessDialog() {
    final size = MediaQuery.sizeOf(context);
    return showDialog(
      barrierColor: Colors.white,
      context: context,
      builder: (_) => Lottie.asset(
        'assets/lottie/success_lottie.json',
        width: size.width * 0.4,
        height: size.height * 0.4,
        repeat: false,
      ),
    );
  }

  Widget _buildPaymentField(String title, TextEditingController controller,
      double totalEstimationAmount,
      double leftAmount,) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 6.0), // spacing between rows
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // ✅ Align center vertically
        children: [
          SizedBox(
            width: AppDimensions.getResponsiveWidth(context)*0.25,
            child: Text(
              "$title:",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 12), // ✅ proper horizontal spacing
          SizedBox(
            width: AppDimensions.getResponsiveWidth(context)*0.65,
            // flex: 1,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
              ],
              enabled: leftAmount > 0 || controller.text.isNotEmpty,
              onChanged: (value) {
                // Do not let the sum exceed totalEstimationAmount
                double sumOthers = 0;
                _controllers.forEach((k, c) {
                  if (k == title) return;
                  if (c.text.isNotEmpty) {
                    sumOthers += double.tryParse(c.text) ?? 0;
                  }
                });
                double allowedMax = totalEstimationAmount - sumOthers;
                if (allowedMax < 0) allowedMax = 0;

                final newVal = double.tryParse(value) ?? 0;
                if (newVal > allowedMax) {
                  final clamped = allowedMax;
                  controller.text = clamped.toStringAsFixed(2);
                  controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: controller.text.length),
                  );
                }
                setState(() {});
              },
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                hintText: "0.00",
                hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.APP_BACKGROUND_COLOR,
                    width: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
