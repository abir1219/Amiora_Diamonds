import 'dart:io';

import '../../../../main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/api_status.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/local/shared_preferences_helper.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../../../../router/app_pages.dart';
import '../../../estimation_screen/presentation/bloc/estimation_bloc.dart';
import '../../data/product_list_form_model.dart';

class ProductEstimateFormDialog extends StatefulWidget {
  final bool? fromView;

  final String sKUNumber;
  final double? discountAmount;
  final double? discountPercentage;

  const ProductEstimateFormDialog({
    super.key,
    required this.sKUNumber,
    this.fromView = false,
    this.discountAmount = 0.00,
    this.discountPercentage = 0.00,
  });

  @override
  State<ProductEstimateFormDialog> createState() =>
      _ProductEstimateFormDialogState();
}

class _ProductEstimateFormDialogState extends State<ProductEstimateFormDialog> {
  TextEditingController productIdController = TextEditingController();
  TextEditingController pieceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController netController = TextEditingController();
  TextEditingController makingRateController = TextEditingController();
  TextEditingController makingTypeController = TextEditingController();
  TextEditingController makingValueController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController stoneQtyController = TextEditingController();
  TextEditingController stoneValueController = TextEditingController();
  TextEditingController metalValueController = TextEditingController();
  TextEditingController diamondQtyController = TextEditingController();
  TextEditingController diamondValueController = TextEditingController();
  TextEditingController discPercentageController = TextEditingController();
  TextEditingController discAmountController = TextEditingController();
  TextEditingController taxCodeController = TextEditingController();
  TextEditingController taxAmountController = TextEditingController();
  TextEditingController taxableAmtController = TextEditingController();
  TextEditingController otherValueController = TextEditingController();
  TextEditingController calculationValue = TextEditingController();
  TextEditingController miscAmountController = TextEditingController();
  TextEditingController lineAmountController = TextEditingController();

  final discountAmountFocusNode = FocusNode();
  final discountPercentageFocusNode = FocusNode();

  final ScrollController _scrollController = ScrollController();

  double taxPercentage = 0.0;
  String taxCode = "";

  int data = 0;
  double originalMakingValue = 0.00;
  double newMakingValue = 0.00;

  double originalTaxableValue = 0.00;
  double originalLineAmount = 0.00;
  double originalTaxAmount = 0.00;

  double taxableAmount = 0.00;
  double discountAmount = 0.00;
  double taxAmount = 0.00;
  double lineAmount = 0.00;

  @override
  void dispose() {
    debugPrint("---DISPOSE---");
    productIdController.dispose();
    pieceController.dispose();
    quantityController.dispose();
    netController.dispose();
    metalValueController.dispose();
    makingRateController.dispose();
    makingTypeController.dispose();
    makingValueController.dispose();
    rateController.dispose();
    stoneQtyController.dispose();
    stoneValueController.dispose();
    diamondQtyController.dispose();
    diamondValueController.dispose();
    discPercentageController.dispose();
    discAmountController.dispose();
    taxCodeController.dispose();
    taxAmountController.dispose();
    taxableAmtController.dispose();
    otherValueController.dispose();
    calculationValue.dispose();
    miscAmountController.dispose();
    lineAmountController.dispose();
    _scrollController.dispose();
    discountAmountFocusNode.dispose();
    originalMakingValue = 0.00;
    newMakingValue = 0.00;

    originalTaxableValue = 0.00;
    originalLineAmount = 0.00;
    originalTaxAmount = 0.00;

    taxableAmount = 0.00;
    discountAmount = 0.00;
    taxAmount = 0.00;
    lineAmount = 0.00;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    context.read<EstimationBloc>().add(ApiStatusChangeEvent());
    context.read<EstimationBloc>().add(
      FetchSkuDetailsEvent(
        fromView: widget.fromView,
        skuCode: widget.sKUNumber,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      insetPadding: EdgeInsets.symmetric(
        horizontal: AppDimensions.getResponsiveWidth(context) * 0.02,
        vertical: MediaQuery.orientationOf(context) == Orientation.portrait
            ? AppDimensions.getResponsiveHeight(context) * 0.1
            : AppDimensions.getResponsiveHeight(context) * 0.01,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      child: ScaffoldMessenger(
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: BlocConsumer<EstimationBloc, EstimationState>(
                listener: (context, state) {},
                buildWhen: (previous, current) =>
                    current.apiDialogStatus != previous.apiDialogStatus,
                builder: (context, state) {
                  if (data <= 1 && state.apiDialogStatus == ApiStatus.success && state.skuDetails != null) {
                    final sku = state.skuDetails!;
                    final productForm = state.productListFormModel;

                    // --- Basic Field Assignments ---
                    productIdController.text = sku.sKUNumber ?? "";
                    rateController.text = sku.rate?.toString() ?? "";
                    pieceController.text = sku.pcs?.toString() ?? "";
                    quantityController.text = sku.qty?.toStringAsFixed(3) ?? "0.000";
                    netController.text = sku.nett?.toStringAsFixed(3) ?? "0.000";
                    makingRateController.text = sku.makingRate?.toString() ?? "";
                    calculationValue.text = sku.cvalue?.toString() ?? "";
                    makingValueController.text = sku.mkValue?.toStringAsFixed(2) ?? "0.00";
                    stoneQtyController.text = sku.totalStoneQty?.toStringAsFixed(3) ?? "0.000";
                    // stoneValueController.text = sku.stoneValue?.toStringAsFixed(2) ?? "0.00";
                    stoneValueController.text = AppWidgets.formatIndianNumber(sku.stoneValue ?? 0.00);
                    diamondQtyController.text = sku.totalDiamondQty?.toStringAsFixed(3) ?? "0.000";
                    //diamondValueController.text = sku.diamondValue?.toStringAsFixed(2) ?? "0.00";
                    diamondValueController.text = AppWidgets.formatIndianNumber(sku.diamondValue ?? 0.00);
                    // metalValueController.text = sku.cvalue?.toStringAsFixed(2) ?? "0.00";
                    metalValueController.text = AppWidgets.formatIndianNumber(sku.cvalue ?? 0.00);

                    // --- Discount Percentage ---
                    discPercentageController.text = widget.fromView!
                        ? widget.discountPercentage?.toStringAsFixed(2) ?? "0.00"
                        : productForm?.skuDiscount?.rate?.toStringAsFixed(2) ?? "0.00";

                    // --- Tax Calculation ---
                    if (productForm?.skuTax != null && productForm!.skuTax!.isNotEmpty) {
                      final isDifferentState =
                          SharedPreferencesHelper.getString(AppConstants.WAREHOUSE_STATE_CODE) != state.stateCode;

                      if (isDifferentState) {
                        final igst = productForm.skuTax!.firstWhere(
                              (t) => t.taxCode?.toUpperCase() == "IGST",
                          orElse: () => productForm.skuTax!.first,
                        );
                        taxPercentage = igst.percentage ?? 0.0;
                        taxCode = igst.taxCode ?? "";
                      } else {
                        final gst = productForm.skuTax!.where((t) {
                          final code = t.taxCode?.toUpperCase();
                          return code == "CGST" || code == "SGST";
                        }).toList();

                        if (gst.isNotEmpty) {
                          taxPercentage = (gst.first.percentage ?? 0.0) * 2.0;
                          taxCode = "GST";
                        }
                      }
                    }

                    // --- Discount Amount Calculation ---
                    discAmountController.text = "0.00";
                    final discount = productForm?.skuDiscount;
                    double originalMakingValue = sku.mkValue ?? 0.0;
                    double newMakingValue = 0.0;//originalMakingValue;
                    discountAmount = 0.0;


                    debugPrint("widget.discountAmount--->${widget.discountAmount}");

                    if (discount?.desc?.toLowerCase().contains("making") ?? false) {
                      newMakingValue = (originalMakingValue * (100 - (discount?.rate ?? 0.0))) / 100;
                      discountAmount = widget.fromView!
                          ? widget.discountAmount ?? 0.0
                          : (originalMakingValue - newMakingValue);
                    } else if (discount?.desc?.toLowerCase().contains("line") ?? false) {
                      discountAmount = widget.fromView!
                          ? widget.discountAmount ?? 0.0
                          : (double.tryParse(taxableAmtController.text) ?? 0.0) * ((discount?.rate ?? 0.0) / 100);
                    } else if (discount != null) {
                      newMakingValue = (originalMakingValue * (100 - (discount.rate ?? 0.0))) / 100;
                      discountAmount = widget.fromView!
                          ? widget.discountAmount ?? 0.0
                          : (originalMakingValue - newMakingValue);
                    }

                    discAmountController.text = AppWidgets.formatIndianNumber(discountAmount);

                    // --- Taxable Amount ---
                    taxableAmount = calculatedTaxableAmount(
                      skuDetails: sku,
                      discountAmount: discAmountController.text.replaceAll(",", ''),
                    ) -
                        (widget.fromView! ? (widget.discountAmount ?? 0.0) : discountAmount);

                    taxableAmtController.text = AppWidgets.formatIndianNumber(taxableAmount);

                    // --- Tax Amount ---
                    taxAmount = calculateTaxAmount();
                    taxAmountController.text = AppWidgets.formatIndianNumber(taxAmount);

                    // --- Line Amount ---
                    lineAmount = calculateFirstTimeLineAmount(discountAmount);
                    lineAmountController.text = AppWidgets.formatIndianNumber(lineAmount);

                    // --- Original Values ---
                    originalLineAmount = lineAmount;
                    originalTaxableValue = taxableAmount;
                    originalTaxAmount = taxAmount;

                    data++;
                  }

                  switch (state.apiDialogStatus) {
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
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Gap(
                            AppDimensions.getResponsiveHeight(context) * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "${state.skuDetails?.prodName} ${state.skuDetails?.purity ?? ""}",
                                    style: const TextStyle(
                                      color:
                                          AppColors.LOGO_BACKGROUND_RED_COLOR,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                    ),
                                  ),
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
                          Gap(
                            AppDimensions.getResponsiveHeight(context) * 0.015,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              controller: _scrollController,
                              child: Column(
                                children: [
                                  /*state.skuDetails?.imageUrl != null
                                      ? SizedBox(
                                    height: size.height * 0.2,
                                    width: size.width * 0.5,
                                    child: Image.network(
                                      state.skuDetails!.imageUrl!,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                      : Container(),*/
                                  Gap(
                                    AppDimensions.getResponsiveHeight(context) *
                                        0.01,
                                  ),
                                  AppWidgets().buildTextFormField(
                                    enabled: false,
                                    size,
                                    controller: productIdController,
                                    hintText: "Product Id",
                                    labelText: 'Product Id',
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AppWidgets().buildTextFormField(
                                          enabled: false,
                                          size,
                                          controller: pieceController,
                                          hintText: "Piece",
                                          labelText: 'Piece',
                                        ),
                                      ),
                                      Expanded(
                                        child: AppWidgets().buildTextFormField(
                                          enabled: false,
                                          size,
                                          controller: quantityController,
                                          hintText: "Qty",
                                          labelText: 'Qty',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AppWidgets().buildTextFormField(
                                          enabled: false,
                                          size,
                                          controller: netController,
                                          hintText: "Net",
                                          labelText: 'Net',
                                        ),
                                      ),
                                      Expanded(
                                        child: AppWidgets().buildTextFormField(
                                          enabled: false,
                                          size,
                                          controller: makingValueController,
                                          hintText: "Making Value",
                                          labelText: 'Making Value',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AppWidgets().buildTextFormField(
                                          size,
                                          controller: diamondQtyController,
                                          hintText: "Dia. Wt.",
                                          enabled: false,
                                          labelText: 'Dia. Wt.',
                                        ),
                                      ),
                                      Expanded(
                                        child: AppWidgets().buildTextFormField(
                                          size,
                                          controller: diamondValueController,
                                          enabled: false,
                                          hintText: "Dia. Value",
                                          labelText: 'Dia. Value',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AppWidgets().buildTextFormField(
                                          size,
                                          controller: stoneQtyController,
                                          hintText: "St. Wt.",
                                          enabled: false,
                                          labelText: 'St. Wt.',
                                        ),
                                      ),
                                      Expanded(
                                        child: AppWidgets().buildTextFormField(
                                          size,
                                          controller: stoneValueController,
                                          enabled: false,
                                          hintText: "St. Value",
                                          labelText: 'St. Value',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AppWidgets().buildTextFormField(
                                          size,
                                          controller: metalValueController,
                                          hintText: "Metal Value",
                                          enabled: false,
                                          labelText: 'Metal Value',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AppWidgets().buildTextFormField(
                                          size,
                                          controller: discPercentageController,
                                          hintText: "Disc %",
                                          labelText: 'Disc %',
                                          onTap: () {
                                            _scrollToFocusedTextField(
                                              discountPercentageFocusNode,
                                            );
                                          },
                                          textInputType:
                                              const TextInputType.numberWithOptions(
                                                decimal: true,
                                              ),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*'),
                                            ),
                                          ],
                                          onChange: (value) {
                                            setState(() {
                                              if (value!.isEmpty) {
                                                discAmountController.text =
                                                    '0.00';
                                                taxableAmtController.text =
                                                    originalTaxableValue
                                                        .toStringAsFixed(2);

                                                taxAmount = originalTaxAmount;
                                                taxAmountController.text =
                                                    AppWidgets.formatIndianNumber(
                                                      taxAmount,
                                                    );

                                                lineAmount = originalLineAmount;
                                                lineAmountController.text =
                                                    AppWidgets.formatIndianNumber(
                                                      lineAmount,
                                                    );
                                                return;
                                              }

                                              double discountPercentage =
                                                  double.tryParse(value) ?? 0.0;

                                              double makingValue =
                                                  state.skuDetails?.mkValue ??
                                                  0.0;
                                              double stoneValue =
                                                  state
                                                      .skuDetails
                                                      ?.stoneValue ??
                                                  0.0;
                                              double diamondValue =
                                                  state
                                                      .skuDetails
                                                      ?.diamondValue ??
                                                  0.0;
                                              double cValue =
                                                  state.skuDetails?.cvalue ??
                                                  0.0;
                                              double taxValue =
                                                  state.skuDetails?.taxAmount ??
                                                  0.0;

                                              double totalValue =
                                                  makingValue +
                                                  stoneValue +
                                                  diamondValue +
                                                  cValue;
                                              double fullLineAmount =
                                                  totalValue + taxValue;

                                              String discountDesc =
                                                  state
                                                      .productListFormModel
                                                      ?.skuDiscount
                                                      ?.desc
                                                      ?.toLowerCase() ??
                                                  "";

                                              double discountAmount = 0.0;
                                              double taxableAmount = 0.0;
                                              double taxAmountLocal = 0.0;
                                              double updatedLineAmount = 0.0;

                                              if (discountDesc.contains(
                                                "line",
                                              )) {
                                                // Apply discount on total line amount
                                                discountAmount =
                                                    (fullLineAmount *
                                                        discountPercentage) /
                                                    100;
                                                discountAmount = discountAmount;
                                                taxableAmount =
                                                    totalValue; // full taxable base stays same
                                                taxAmountLocal =
                                                    (taxableAmount *
                                                        taxPercentage) /
                                                    100;
                                                updatedLineAmount =
                                                    taxableAmount +
                                                    taxAmountLocal;
                                              } else {
                                                // Apply discount on making value (for both "making" and others)
                                                discountAmount =
                                                    (makingValue *
                                                        discountPercentage) /
                                                    100;
                                                double newMakingValue =
                                                    makingValue -
                                                    discountAmount;

                                                double newTotalValue =
                                                    newMakingValue +
                                                    stoneValue +
                                                    diamondValue +
                                                    cValue;
                                                taxableAmount = newTotalValue;
                                                taxAmountLocal =
                                                    (taxableAmount *
                                                        taxPercentage) /
                                                    100;
                                                updatedLineAmount =
                                                    taxableAmount +
                                                    taxAmountLocal;
                                              }

                                              discAmountController.text =
                                                  AppWidgets.formatIndianNumber(
                                                    discountAmount,
                                                  );
                                              taxableAmtController.text =
                                                  taxableAmount.toStringAsFixed(
                                                    2,
                                                  );
                                              taxAmountController.text =
                                                  AppWidgets.formatIndianNumber(
                                                    taxAmountLocal,
                                                  );
                                              lineAmountController.text =
                                                  AppWidgets.formatIndianNumber(
                                                    updatedLineAmount,
                                                  );
                                            });
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: AppWidgets().buildTextFormField(
                                          size,
                                          controller: discAmountController,
                                          hintText: "Disc Amt",
                                          focusNode: discountAmountFocusNode,
                                          onTap: () {
                                            _scrollToFocusedTextField(
                                              discountAmountFocusNode,
                                            );
                                          },
                                          labelText: 'Disc Amt',
                                          textInputType:
                                              const TextInputType.numberWithOptions(
                                                decimal: true,
                                              ),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*'),
                                            ),
                                          ],
                                          onChange: (value) {
                                            setState(() {
                                              if (value!.isEmpty) {
                                                discPercentageController.text =
                                                    '0.00';
                                                taxableAmtController.text =
                                                    originalTaxableValue
                                                        .toStringAsFixed(2);
                                                // taxAmount = originalTaxAmount;
                                                taxAmountController.text =
                                                    AppWidgets.formatIndianNumber(
                                                      originalTaxAmount,
                                                    );
                                                // lineAmount = originalLineAmount;
                                                lineAmountController.text =
                                                    AppWidgets.formatIndianNumber(
                                                      originalLineAmount,
                                                    );
                                                return;
                                              }

                                              double discountAmount =
                                                  double.tryParse(value) ?? 0.0;

                                              final discountDesc =
                                                  ""; //state.productListFormModel?.skuDiscount?.desc?.toLowerCase() ?? "";
                                              double totalValue =
                                                  (state.skuDetails?.mkValue ??
                                                      0.0) +
                                                  (state
                                                          .skuDetails
                                                          ?.stoneValue ??
                                                      0.0) +
                                                  (state
                                                          .skuDetails
                                                          ?.diamondValue ??
                                                      0.0) +
                                                  (state.skuDetails?.cvalue ??
                                                      0.0);

                                              double taxableAmount = 0.0;
                                              double discountBaseValue = 0.0;

                                              if (discountDesc.contains(
                                                "line",
                                              )) {
                                                // Discount is off from lineAmount
                                                discountBaseValue =
                                                    totalValue +
                                                    (state
                                                            .skuDetails
                                                            ?.taxAmount ??
                                                        0.0); // original line amount
                                                taxableAmount =
                                                    totalValue; // tax will be on full components
                                              } else {
                                                // Discount is off from making value
                                                discountBaseValue =
                                                    state.skuDetails?.mkValue ??
                                                    0.0;
                                                taxableAmount =
                                                    totalValue - discountAmount;
                                              }

                                              double discountPercentage =
                                                  discountBaseValue > 0
                                                  ? (discountAmount * 100) /
                                                        discountBaseValue
                                                  : 0.0;

                                              double taxAmount =
                                                  (taxableAmount *
                                                      taxPercentage) /
                                                  100;
                                              double lineAmount =
                                                  taxableAmount + taxAmount;

                                              discPercentageController.text =
                                                  discountPercentage
                                                      .toStringAsFixed(2);
                                              taxableAmtController.text =
                                                  taxableAmount.toStringAsFixed(
                                                    2,
                                                  );
                                              taxAmountController.text =
                                                  AppWidgets.formatIndianNumber(
                                                    taxAmount,
                                                  );
                                              lineAmountController.text =
                                                  AppWidgets.formatIndianNumber(
                                                    lineAmount,
                                                  );
                                            });
                                          },
                                        ),
                                      ),
                                      /*IconButton(onPressed: () {

                                      }, icon: Icon(Icons.add_box_sharp,color: AppColors.LOGO_BACKGROUND_BLUE_COLOR,))*/
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AppWidgets().buildTextFormField(
                                          size,
                                          controller: taxableAmtController,
                                          enabled: false,
                                          hintText: "Taxable Amt",
                                          labelText: 'Taxable Amt',
                                        ),
                                      ),
                                      Expanded(
                                        child: AppWidgets().buildTextFormField(
                                          size,
                                          controller: taxAmountController,
                                          enabled: false,
                                          hintText: "Tax Amt",
                                          labelText: 'Tax Amt',
                                        ),
                                      ),
                                    ],
                                  ),
                                  AppWidgets().buildTextFormField(
                                    size,
                                    controller: lineAmountController,
                                    enabled: false,
                                    hintText: "Total Value",
                                    labelText: 'Total Value',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Gap(size.height * 0.01),
                          BlocConsumer<EstimationBloc, EstimationState>(
                            listener: (context, state) {
                              switch (state.apiStatus) {
                                case ApiStatus.success:
                                  Navigator.pop(context);
                                  context.go(AppPages.SEARCH_PRODUCT);
                                default:
                                  return;
                              }
                            },
                            builder: (context, state) {


                              return AppWidgets.customMobileButton(
                                size: size,
                                isLoading: state.apiStatus == ApiStatus.loading
                                    ? true
                                    : false,
                                btnName: "Submit",
                                color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                                func: () {
                                  SharedPreferencesHelper.saveString(
                                    AppConstants.DiscountAmount,
                                    discAmountController.text,
                                  );
                                  context.read<EstimationBloc>().add(
                                    SkuSaveForListEvent(
                                      double.parse(lineAmountController.text.replaceAll(
                                        ",",
                                        '',
                                      )),
                                      // lineAmount,
                                      // double.parse(taxAmountController.text),
                                      //taxAmount,
                                      double.tryParse(
                                            taxAmountController.text.replaceAll(
                                              ",",
                                              '',
                                            ),
                                          ) ??
                                          0.0,
                                      double.parse(
                                            discAmountController.text.replaceAll(
                                              ",",
                                              '',
                                            ),
                                          ) ,
                                      // discountAmount,
                                      double.parse(quantityController.text),
                                      double.parse(
                                            discPercentageController.text,
                                          ) ,
                                    ),
                                  );
                                  Navigator.pop(context);
                                },
                              );
                            },
                          ),
                          Gap(size.height * 0.01),
                        ],
                      );
                    default:
                      return const SizedBox();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  double calculateTaxAmount() {
    // double taxAmount = ((double.parse(taxableAmtController.text.toString())) *
    // double taxAmount = (taxableAmount * (taxPercentage / 100));
    debugPrint("TAX_PERCENTAGE@@_-->$taxPercentage");
    double taxAmount =
        (double.parse(taxableAmtController.text.replaceAll(",", "")) *
        (taxPercentage / 100));
    // double taxAmount = (taxableAmount * (taxPercentage / 100));

    return taxAmount;
  }

  double calculateFirstTimeLineAmount(double discountAmount) {
    if (kDebugMode) {
      print("TAXABLE_AMOUNT-->$taxableAmount");
      print("TAX_AMOUNT-->$taxAmount");
      print("DISCOUNT-->$discountAmount");
    }
    // double total = double.parse(taxableAmtController.text) +
    // double total = taxableAmount + double.parse(taxAmountController.text);
    // double total = (taxableAmount + taxAmount) - discountAmount;
    double total =
        (double.parse(taxableAmtController.text.replaceAll(",", "")) +
        taxAmount);
    // double total = (taxableAmount + taxAmount);

    return total;
  }

  double calculateLineAmount(double discountAmount) {
    if (kDebugMode) {
      print("TAXABLE_AMOUNT-->$taxableAmount");
      print("TAX_AMOUNT-->$taxAmount");
      print("DISCOUNT-->$discountAmount");
    }
    // double total = double.parse(taxableAmtController.text) +
    // double total = taxableAmount + double.parse(taxAmountController.text);
    // double total = (taxableAmount + taxAmount) - discountAmount;
    double total =
        (double.parse(taxableAmtController.text.replaceAll(",", "")) +
            taxAmount) -
        discountAmount;

    return total;
  }

  double calculatedTaxableAmount({
    required SkuDetails skuDetails,
    required String discountAmount,
  }) {

    double total =
        ((skuDetails.mkValue ?? 0.0) +
        (skuDetails.stoneValue ?? 0.0) +
        (skuDetails.diamondValue ?? 0.0) +
        (skuDetails.cvalue ?? 0.0));
    // - discountedAmount;

    debugPrint("TOTAL-->$total");

    return total;
  }

  void _scrollToFocusedTextField(FocusNode focusNode) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 550), () {
        _scrollController.animateTo(
          _scrollController.position.pixels +
              AppDimensions.getResponsiveHeight(navigatorKey.currentContext!) * 0.3,
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 300),
        );
      });
    });
  }
}
