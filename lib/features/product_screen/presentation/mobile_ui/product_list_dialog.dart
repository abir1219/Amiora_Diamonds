import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../features/product_screen/presentation/mobile_ui/product_estimate_form_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/api_status.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../../../estimation_screen/presentation/bloc/estimation_bloc.dart';

class ProductListDialog extends StatefulWidget {
  final bool isDialog;

  const ProductListDialog({super.key, this.isDialog = false});

  @override
  State<ProductListDialog> createState() => _ProductListDialogState();
}

class _ProductListDialogState extends State<ProductListDialog> {
  final _searchTextController = TextEditingController();
  final _qtyTextController = TextEditingController();
  bool _dialogShown = false;

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<EstimationBloc>().add(ApiStatusChangeEvent());
    // context.read<EstimationBloc>().add(CheckRateSetEvent());
    context.read<EstimationBloc>().add(const FetchProductListEvent(search: ""));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    // return
    Widget content = ScaffoldMessenger(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            child: Column(
              children: [
                Gap(size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Product search",
                      style: TextStyle(
                        color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: SvgPicture.asset(
                          "assets/images/circle_close.svg",
                          colorFilter: const ColorFilter.mode(
                            AppColors.LOGO_BACKGROUND_RED_COLOR,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(size.height * 0.02),
                BlocConsumer<EstimationBloc, EstimationState>(
                  listener: (context, state) {
                    if (state.isRateSet == false && !_dialogShown) {
                      _dialogShown = true;
                      AwesomeDialog(
                        // autoDismiss: false,
                        context: context,
                        dialogType: DialogType.error,
                        dismissOnTouchOutside: false,
                        title: 'Rate Alert',
                        titleTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                        desc: 'Please fix the rate',
                        btnOkOnPress: () => exit(0),
                      ).show();
                    }
                  },
                  builder: (context, state) {
                    switch (state.apiDialogStatus) {
                      case ApiStatus.loading:
                        return Expanded(
                          child: Center(
                            child: SizedBox(
                              height: size.height * 0.08,
                              width: size.width * 0.1,
                              child: Platform.isAndroid
                                  ? const CircularProgressIndicator(
                                      color:
                                          AppColors.LOGO_BACKGROUND_RED_COLOR,
                                    )
                                  : const CupertinoActivityIndicator(
                                color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                              ),
                            ),
                          ),
                        );
                      case ApiStatus.success:
                        return Expanded(
                          child: Column(
                            children: [
                              /*AppWidgets.buildSearchableField(
                                  size,
                                  qtyTextController: _qtyTextController,
                                  change: (text) {
                                    */
                              /*context.read<EstimationBloc>().add(
                                      FetchProductListEvent(
                                        search: _searchTextController
                                            .text
                                            .trim(),
                                      ),
                                    );*/
                              /*
                                    debugPrint("SEARCHED_TEXT-->$text");
                                    context.read<EstimationBloc>().add(SearchProductEvent(text.trim()));
                                  },
                                  "Sku id",
                                  func: () {
                                    */
                              /*context.read<EstimationBloc>().add(
                                          FetchProductListEvent(
                                            search: _searchTextController.text
                                                .trim(),
                                          ),
                                        );*/
                              /*
                                    // context.read<EstimationBloc>().add(SearchProductEvent( _searchTextController.text.trim()));
                                  },
                                  _searchTextController,
                                  isEnabled: true),*/
                              AppWidgets.buildSearchableField(
                                size,
                                "Sku id",
                                _searchTextController,
                                qtyTextController: _qtyTextController,
                                isEnabled: true,
                                change: (sku, qty) {
                                  debugPrint(
                                    "SEARCHED_SKU --> $sku | QTY --> $qty",
                                  );
                                  context.read<EstimationBloc>().add(
                                    SearchProductEvent(
                                      sku.trim(),
                                      qty.trim(),
                                    ),
                                  );
                                },
                                func: () {
                                  // optional button action
                                },
                              ),
                              //Gap(size.height * 0.05),
                              Expanded(
                                child: state.filteredProductList.isNotEmpty
                                    ? ListView.builder(
                                        itemBuilder: (context, index) {
                                          final product =
                                              state.filteredProductList[index];
                                          debugPrint(
                                            "PRODUCT_LIST--->${product.sKUNumber}",
                                          );
                                          return _buildProductContainer(
                                            index,
                                            size,
                                            state,
                                            () {
                                              if (widget.isDialog) {
                                                Navigator.pop(context);
                                              }
                                              showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder: (context) {
                                                  return ProductEstimateFormDialog(
                                                    // sKUNumber: state.productList![index].sKUNumber!,
                                                    sKUNumber:
                                                        product.sKUNumber ?? '',
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                        // itemCount: state.productList!.length,
                                        itemCount:
                                            state.filteredProductList.length,
                                      )
                                    : Center(
                                        child: Text(
                                          "No product found",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        );
                      case ApiStatus.error:
                        return Expanded(
                          child: Center(child: Text(state.message!)),
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
    );

    if (widget.isDialog) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        insetPadding: EdgeInsets.symmetric(
          horizontal: size.width * 0.02,
          vertical: size.height * 0.1,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: Colors.white,
        child: content,
      );
    } else {
      return content;
    }
  }

  Widget _buildProductContainer(
    int index,
    Size size,
    EstimationState state,
    void Function() func,
  ) {
    return GestureDetector(
      onTap: () => func(),
      child: Container(
        /*margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.01, vertical: size.height * 0.02),*/
        margin: EdgeInsets.symmetric(
          vertical: size.height * .005,
          horizontal: size.width * .005,
        ),
        // padding: const EdgeInsets.symmetric(horizontal: 6), //,vertical: 2
        // padding: const EdgeInsets.only(left: 6), //,vertical: 2
        height: size.height * 0.08,
        decoration: BoxDecoration(
          color: index % 2 == 0
              ? AppColors.APP_BACKGROUND_COLOR
              : AppColors.APP_WHITE_COLOR,
          /*boxShadow: [
            BoxShadow(
              color: Colors.white,
            ),
          ],
          borderRadius: BorderRadius.circular(12.0),*/
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(40),
              spreadRadius: 1.3,
              offset: Offset(.5, .5),
              blurRadius: 1.0,
            ),
          ],
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Product Details Column
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SKU Number Container
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: size.height * .005,
                      //horizontal: size.width * .01,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,//.006,
                      vertical: size.height *  0.01,//.002,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                      // index % 2 == 0
                      //     ? AppColors.APP_BACKGROUND_COLOR
                      //     : AppColors.APP_WHITE_COLOR,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Center(
                      child: Text(
                        // "${state.productList![index].sKUNumber}",
                        "${state.filteredProductList[index].sKUNumber}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  // Product Name, Purity, and Pieces
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: size.height * .005,
                      horizontal: size.width * .01,
                    ),
                    child: Text(
                      // "${state.productList![index].prodName}, "
                      "${state.filteredProductList[index].prodName}, "
                      // "${state.productList![index].purity ?? '0'}, "
                      "${state.filteredProductList[index].purity ?? '0'}, "
                      // "${state.productList![index].pcs}Pc.",
                      "${state.filteredProductList[index].pcs}Pc.",
                      style: const TextStyle(
                        color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Arrow Icon
            Container(
              margin: EdgeInsets.only(right: 10,),//size.width * 0.02
              height: 35,
              width: 35,
              child: SvgPicture.asset(
                "assets/images/arrow_right_circle.svg",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
