import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/api_status.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../estimation_screen/presentation/bloc/estimation_bloc.dart';

class IngredientsFormDialog extends StatefulWidget {
  final int? index;

  const IngredientsFormDialog({super.key, this.index});

  @override
  State<IngredientsFormDialog> createState() => _IngredientsFormDialogState();
}

class _IngredientsFormDialogState extends State<IngredientsFormDialog> {
  final pieceController = TextEditingController();
  final quantityController = TextEditingController();
  final nettController = TextEditingController();
  final amountController = TextEditingController();
  final rateController = TextEditingController();
  final cTypeController = TextEditingController();

  /*@override
  void initState() {
    context.read<EstimationBloc>().add(ApiStatusChangeEvent());
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      insetPadding: EdgeInsets.symmetric(
          horizontal: size.width * 0.02, vertical: size.height * 0.1),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      child: ScaffoldMessenger(
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Center(
                          child: Text(
                            "Ingredient Details",
                            style: TextStyle(
                              color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: SvgPicture.asset(
                            "assets/images/circle_close.svg",
                            colorFilter: const ColorFilter.mode(
                                AppColors.LOGO_BACKGROUND_RED_COLOR,
                                BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(size.height * 0.02),
                  BlocConsumer<EstimationBloc, EstimationState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      //debugPrint("Size--->${state.selectedProductList!.length}");
                      // debugPrint("index-->${widget.index!}, Lng --> ${state.selectedProductList![widget.index!]
                      //     .ingredientInfo!.length}");
                      debugPrint("STATUS--->${state.apiDialogStatus}");
                      switch(state.apiDialogStatus){
                        case ApiStatus.loading:
                          return Center(
                            child: SizedBox(
                              height: size.height * 0.03,
                              width: size.width * 0.06,
                              child: Platform.isAndroid
                                  ? const CircularProgressIndicator(
                                color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                              )
                                  : const CupertinoActivityIndicator(),
                            ),
                          );
                        case ApiStatus.success:
                          return
                            Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Gap(size.height * 0.02),

                                Expanded(
                                  child: state.selectedProductList![widget.index!]
                                      .skuSubdetails!.isNotEmpty?ListView.builder(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      debugPrint("index-->$index");
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "${state.selectedProductList![widget.index!].skuSubdetails![index].subDProdCode}",
                                                  style: const TextStyle(
                                                    color: AppColors
                                                        .LOGO_BACKGROUND_RED_COLOR,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Gap(size.height * 0.01),
                                          Row(
                                            children: [
                                              Expanded(
                                                child:
                                                AppWidgets().buildTextField(
                                                  size,
                                                  text: state
                                                      .selectedProductList![widget.index!]
                                                      .skuSubdetails![index]
                                                      .subDPcs
                                                      .toString(),
                                                  //controller: pieceController,
                                                  hintText: "Piece(s)",
                                                  labelText: 'Piece(s)',
                                                ),
                                              ),
                                              Expanded(
                                                child:
                                                AppWidgets().buildTextField(
                                                  size,
                                                  text: state
                                                      .selectedProductList![widget.index!]
                                                      .skuSubdetails![index]
                                                      .subDQty
                                                      .toString(),
                                                  //controller: quantityController,
                                                  hintText: "Qty",
                                                  labelText: 'Qty',
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child:
                                                AppWidgets().buildTextField(
                                                  size,
                                                  text: state
                                                      .selectedProductList![widget.index!]
                                                      .skuSubdetails![index]
                                                      .subDNett
                                                      .toString(),
                                                  // controller: nettController,
                                                  hintText: "Net",
                                                  labelText: 'Net',
                                                ),
                                              ),
                                              Expanded(
                                                child:
                                                AppWidgets().buildTextField(
                                                  size,
                                                  text: state
                                                      .selectedProductList![widget.index!]
                                                      .skuSubdetails![index]
                                                      .subDRate
                                                      .toString(),
                                                  // controller: rateController,
                                                  hintText: "Rate",
                                                  labelText: 'Rate',
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              /*Expanded(
                                                child:
                                                AppWidgets().buildTextField(
                                                  size,
                                                  text: state.selectedProductList![widget.index!].skuSubdetails![index].subDCtype.toString(),
                                                  // controller: cTypeController,
                                                  hintText: "C Type",
                                                  labelText: 'C Type',
                                                ),
                                              ),*/
                                              Expanded(
                                                child:
                                                AppWidgets().buildTextField(
                                                  size,
                                                  text: state.selectedProductList![widget.index!].skuSubdetails![index].subDCvalue.toString(),
                                                  hintText: "Amount",
                                                  labelText: 'Amount',
                                                ),
                                              ),
                                            ],
                                          ),
                                          Gap(size.height * 0.02),
                                          state.selectedProductList![widget.index!]
                                              .skuSubdetails!.length -
                                              1 !=
                                              index
                                              ? Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 5,
                                                width: 5,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors
                                                      .LOGO_BACKGROUND_RED_COLOR,
                                                ),
                                              ),
                                              const Expanded(
                                                child: Divider(
                                                  color: AppColors
                                                      .LOGO_BACKGROUND_RED_COLOR,
                                                  thickness: 1,
                                                ),
                                              ),
                                              Container(
                                                height: 5,
                                                width: 5,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors
                                                      .LOGO_BACKGROUND_RED_COLOR,
                                                ),
                                              ),
                                            ],
                                          )
                                              : Container(),
                                          Gap(size.height * 0.02),
                                        ],
                                      );
                                    },
                                    itemCount: state.selectedProductList![widget.index!]
                                        .skuSubdetails!.length,
                                  ):
                                  const Center(
                                    child: Text(
                                      "No Ingredient Found",
                                      style: TextStyle(color: Colors.black,fontSize: 14,),
                                    ),
                                  ),
                                ),
                                Gap(size.height * 0.01),
                                /*Container(
                                  padding: EdgeInsets.symmetric(horizontal: size.height * .02),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: AppWidgets.customMobileButton(
                                          size: size,
                                          btnName: 'Cancel',
                                          color: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
                                          func: () => Navigator.pop(context),
                                          //     context.go(
                                          //   AppPages.PRODUCT_LIST,
                                          // ),
                                        ),
                                      ),
                                      Expanded(
                                        child: AppWidgets.customMobileButton(
                                            size: size,
                                            btnName: 'Add Ingredient',
                                            color: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
                                            func: () {
                                              showDialog(
                                                barrierDismissible: true,
                                                builder: (context) {
                                                  return AddIngredient(parentIndex: widget.index!,);//const ProductListDialog();
                                                },
                                                context: context,
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                                Gap(size.height * 0.02)*/
                              ],
                            ),
                          );
                        default:
                          return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
