import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../../../estimation_screen/presentation/bloc/estimation_bloc.dart';

class EstimationInfoDialog extends StatefulWidget {
  const EstimationInfoDialog({super.key});

  @override
  State<EstimationInfoDialog> createState() => _EstimationInfoDialogState();
}

class _EstimationInfoDialogState extends State<EstimationInfoDialog> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      insetPadding: EdgeInsets.symmetric(
          horizontal: size.width * 0.08,
          vertical: size.height * 0.4//0.36
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      child: ScaffoldMessenger(
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                BlocConsumer<EstimationBloc, EstimationState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state.lineAmountList!.isNotEmpty) {
                      double totalAmount = 0.0;
                      for (int i = 0; i < state.lineAmountList!.length; i++) {
                        totalAmount += state.lineAmountList![i];
                      }

                      double totalTaxAmount = 0.0;
                      for (int i = 0; i < state.taxAmountList!.length; i++) {
                        totalTaxAmount += state.taxAmountList![i];
                      }

                      double totalDiscountAmount = 0.0;
                      for (int i = 0; i < state.discountAmountList!.length; i++) {
                        totalDiscountAmount += state.discountAmountList![i];
                      }

                      double totalQty = 0.0;
                      for (int i = 0; i < state.totalQtyList!.length; i++) {
                        totalQty += state.totalQtyList![i];
                      }

                      return Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.04),
                        child: SingleChildScrollView(
                          child: Column(
                            spacing: size.height * 0.008,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Total Qty",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.LOGO_BACKGROUND_RED_COLOR),
                                  ),
                                  Text(
                                    totalQty.toStringAsFixed(2),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.LOGO_BACKGROUND_RED_COLOR),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Total Value",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.LOGO_BACKGROUND_RED_COLOR),
                                  ),
                                  Text(
                                    // "₹ ${((totalAmount - totalTaxAmount) + totalDiscountAmount).toStringAsFixed(2)}",
                                    "₹ ${AppWidgets.formatIndianNumber(((totalAmount - totalTaxAmount) + totalDiscountAmount))}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.LOGO_BACKGROUND_RED_COLOR),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Total Discount",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.LOGO_BACKGROUND_RED_COLOR),
                                  ),
                                  Text(
                                    // "₹ ${totalDiscountAmount.toStringAsFixed(2)}",
                                    "₹ ${AppWidgets.formatIndianNumber(totalDiscountAmount)}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.LOGO_BACKGROUND_RED_COLOR),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Taxable Amount",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.LOGO_BACKGROUND_RED_COLOR),
                                  ),
                                  Text(
                                    // "₹ ${(totalAmount - totalTaxAmount).toStringAsFixed(2)}",
                                    "₹ ${AppWidgets.formatIndianNumber((totalAmount - totalTaxAmount))}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.LOGO_BACKGROUND_RED_COLOR),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Tax Amount",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.LOGO_BACKGROUND_RED_COLOR),
                                  ),
                                  Text(
                                    // "₹ ${totalTaxAmount.toStringAsFixed(2)}",
                                    "₹ ${AppWidgets.formatIndianNumber(totalTaxAmount)}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.LOGO_BACKGROUND_RED_COLOR),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Estimate Amount",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.LOGO_BACKGROUND_RED_COLOR),
                                  ),
                                  Text(
                                    // "₹ ${totalAmount.toStringAsFixed(2)}",
                                    "₹ ${AppWidgets.formatIndianNumber(totalAmount)}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.LOGO_BACKGROUND_RED_COLOR),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const Text(
                        "₹ 0.00",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      );
                    }
                  },
                ),
              ]
            ),
          ),
        ),
      ),
      /*actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Close"),
                                          ),
                                        ],*/
    );
  }
}
