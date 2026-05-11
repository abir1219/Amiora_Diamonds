import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/api_status.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../estimation_screen/presentation/bloc/estimation_bloc.dart';

class MiscellaneousProductList extends StatefulWidget {
  final int? index;

  const MiscellaneousProductList({super.key, this.index});

  @override
  State<MiscellaneousProductList> createState() =>
      _MiscellaneousProductListState();
}

class _MiscellaneousProductListState extends State<MiscellaneousProductList> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      insetPadding: EdgeInsets.symmetric(
        horizontal: size.width * 0.02,
        vertical: size.height * 0.15,
      ),
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
                            "Miscellaneous Charges",
                            style: TextStyle(
                                color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
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
                          )),
                    ],
                  ),
                  Gap(size.height * 0.02),
                  BlocConsumer<EstimationBloc, EstimationState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      switch(state.apiDialogStatus) {
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
                          return Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Gap(size.height * 0.02),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          // height: size.height * 0.02,
                                          //width: size.width * 0.25,
                                          margin: EdgeInsets.symmetric(
                                              vertical: size.height * .005,
                                              horizontal: size.width * .01),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * .006,
                                              vertical: size.height * .002),
                                          decoration: BoxDecoration(
                                            color: AppColors.STEPPER_DONE_COLOR,
                                            borderRadius: BorderRadius.circular(3),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "${state.selectedProductList![widget.index!].skuDetails!.sKUNumber}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        const Spacer()
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: size.height * .005,
                                          horizontal: size.width * .01),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * .002,
                                          vertical: size.height * .002),
                                      child: Text(
                                        "${state.selectedProductList![widget.index!].skuDetails!.prodName!}, ${state.selectedProductList![widget.index!].skuDetails!.purity != null ? state.selectedProductList![widget.index!].skuDetails!.purity! : 0}, ${state.selectedProductList![widget.index!].skuDetails!.pcs}Pc.",
                                        style:const TextStyle(
                                            color: AppColors.STEPPER_DONE_COLOR,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                AppWidgets.buildSearchableField(
                                  size,
                                  "Misc. charge code search",
                                  null,
                                  isEnabled: true,
                                ),
                                Gap(size.height * 0.005),
                                //Misc List Start ~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                /*Expanded(
                                  child: state.selectedProductList![widget.index!]
                                      .miscCharge!.isNotEmpty?ListView.builder(
                                    itemBuilder: (context, index) {
                                      return _buildProductContainer(state,index, size, () {
                                        *//*Navigator.pop(context);
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return const MiscellaneousAdd();
                                          },
                                        );*//*
                                      });
                                    },
                                    itemCount: state.selectedProductList![widget.index!].miscCharge!.length,
                                  ):
                                  const Center(
                                    child: Text(
                                      "No Miscellaneous Product Found",
                                      style: TextStyle(color: Colors.black,fontSize: 14,),
                                    ),
                                  ),
                                ),*/
                                //Misc List End ~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                /*Gap(size.height * 0.01),
                                Container(
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
                                            btnName: 'Add Product',
                                            color: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
                                            func: () {
                                              showDialog(
                                                barrierDismissible: true,
                                                builder: (context) {
                                                  return MiscellaneousAdd(index: widget.index!,);//const ProductListDialog();
                                                },
                                                context: context,
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ),*/
                                Gap(size.height * 0.02),
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

  Widget _buildProductContainer(EstimationState state,int index, Size size, void Function() func) {
    return GestureDetector(
      onTap: () => func(),
      child: Container(
        /*margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.01, vertical: size.height * 0.02),*/
        margin: EdgeInsets.symmetric(vertical: size.height * .005),
        // padding: const EdgeInsets.symmetric(horizontal: 6), //,vertical: 2
        // padding: const EdgeInsets.only(left: 6), //,vertical: 2
        height: size.height * 0.07,
        decoration: BoxDecoration(
          color: index % 2 == 0
              ? AppColors.CONTAINER_BACKGROUND_COLOR_01
              : AppColors.CONTAINER_BACKGROUND_COLOR_02,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*Container(
                  // height: size.height * 0.02,
                  margin: EdgeInsets.symmetric(
                      vertical: size.height * .005,
                      horizontal: size.width * .01),
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.01, //.002,
                      vertical: size.height * .002),
                  decoration: BoxDecoration(
                    color: index % 2 == 0
                        ? AppColors.STEPPER_DONE_COLOR
                        : AppColors.CONTAINER_BACKGROUND_COLOR_03,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: const Center(
                    child: Text(
                      "CUS0000001",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),*/
                Container(
                  margin: EdgeInsets.symmetric(
                     // vertical: size.height * .005,
                      horizontal: size.width * .01
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .002,
                      vertical: size.height * .002),
                  /*child: Text(
                    state.selectedProductList![widget.index!].miscCharge![index].miscChargeCode!,
                    style: const TextStyle(
                        color: AppColors.STEPPER_DONE_COLOR,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),*/
                ),
                /*Container(
                  margin: EdgeInsets.symmetric(
                      //vertical: size.height * .005,
                      horizontal: size.width * .01),
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .002,
                      vertical: size.height * .002),
                  child: Text(
                    "₹${state.selectedProductList![widget.index!].miscCharge![index].rate}",
                    style: const TextStyle(
                        color: AppColors.STEPPER_DONE_COLOR,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),*/
              ],
            ),
            /*Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent),
                    child: SvgPicture.asset(
                      "assets/images/edit.svg",
                      colorFilter: const ColorFilter
                          .mode(
                          AppColors
                              .LOGO_BACKGROUND_BLUE_COLOR,
                          BlendMode.srcIn),
                    ),
                  ),
                  Gap(size.width * 0.03),
                  GestureDetector(
                    onTap: () {
                      context.read<EstimationBloc>().add(DeleteMiscProdEvent(widget.index!,index));
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration:
                      const BoxDecoration(
                          shape:
                          BoxShape.circle,
                          color: Colors.transparent),
                      child: const Icon(
                        Icons.delete_outline,
                        color: AppColors
                            .LOGO_BACKGROUND_BLUE_COLOR,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
