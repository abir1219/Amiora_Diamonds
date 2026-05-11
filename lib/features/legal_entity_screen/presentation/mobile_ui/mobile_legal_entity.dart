import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/api_status.dart';
import '../../../../core/local/shared_preferences_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../router/app_pages.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../../../login_screen/data/model/login_model.dart';
import '../../../product_screen/presentation/mobile_ui/product_list_dialog.dart';
import '../../data/model/warehouse_model.dart';
import '../bloc/legal_entity_bloc.dart';

class MobileLegalEntity extends StatefulWidget {
  final LoginModel? loginModel;

  const MobileLegalEntity({super.key, this.loginModel});

  @override
  State<MobileLegalEntity> createState() => _MobileLegalEntityState();
}

class _MobileLegalEntityState extends State<MobileLegalEntity> {
  String? _selectedLegalEntityValue;
  int selectedIndex = -1;
  WarehouseData? _selectedWarehouseValue;
  final ScrollController _scrollController = ScrollController();


  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    selectedIndex = -1;
    _selectedWarehouseValue = null;
    _selectedLegalEntityValue = null;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            color: AppColors.APP_BACKGROUND_COLOR, //Colors.red,
            height: size.height,
            child: Stack(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Text(loginModel!.schemaNames![1].toString())
                AppWidgets().buildTopContainer(size),
                // Spacer to push the rest of the content to the center
                //const Spacer(),
                Positioned(
                  top: AppDimensions.getResponsiveHeight(context) * 0.32,
                  //300,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                      AppDimensions.getResponsiveWidth(context) * 0.05,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical:
                        AppDimensions.getResponsiveHeight(context) * 0.05,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.3),
                            offset: const Offset(0.5, 0.5),
                            blurRadius: 1.3,
                            spreadRadius: 1.2,
                          ),
                        ],
                      ),
                      child: Column(
                        spacing:
                        AppDimensions.getResponsiveHeight(context) * 0.02,
                        children: [
                          /*Container(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                              AppDimensions.getResponsiveWidth(context) *
                                  0.05,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withValues(alpha: 0.5),
                                  width: .8),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: const Text(
                                  'Select Legal Entity',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                value: _selectedLegalEntityValue,
                                //widget.loginModel!.schemaNames![1],
                                // items: widget.loginModel!.schemaNames!
                                items: widget.loginModel!.leNames!.asMap().entries.map((entry) {//widget.loginModel!.leCode!.map((String item) {
                                  //int index = entry.key; // Get the index
                                  setState(() {
                                    selectedIndex = entry.key;
                                  });
                                  String item = entry.value;
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: SizedBox(
                                      width: size.width * .6, //200,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  // debugPrint("@@----->${widget.loginModel!.leCode![selectedIndex]}");
                                  // context.read<LegalEntityBloc>().add(ChangeLeCodeEvent(widget.loginModel!.leCode![selectedIndex]));
                                  // SharedPreferencesHelper.saveString(AppConstants.LEGAL_ENTITY, widget.loginModel!.leCode![selectedIndex]);
                                  setState(() {
                                    _selectedLegalEntityValue = newValue;
                                  });
                                },
                              ),
                            ),
                          ),*/
                          //_selectedLegalEntityValue != null ?
                          BlocConsumer<LegalEntityBloc, LegalEntityState>(
                            listener: (context, state) {},
                            buildWhen: (previous, current) =>
                            current.apiStatus == ApiStatus.success,
                            builder: (context, state) {
                              if(state.apiStatus == ApiStatus.success){
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppDimensions.getResponsiveWidth(context) * 0.05,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey.withValues(alpha: 0.5), width: 0.8),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<WarehouseData>(
                                      hint: const Text(
                                        'Select Warehouse',
                                        style: TextStyle(fontSize: 16, color: Colors.black),
                                      ),
                                      value: _selectedWarehouseValue,
                                      items: state.warehousesList?.map((warehouse) {
                                        return DropdownMenuItem<WarehouseData>(
                                          value: warehouse,
                                          child: SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.6,
                                            child: Text(
                                              warehouse.code, // Assuming userName is a property of WarehouseList
                                              style: const TextStyle(fontSize: 16, color: Colors.black),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (WarehouseData? newValue) {
                                        if (newValue != null) {
                                          SharedPreferencesHelper.saveString(
                                              AppConstants.WAREHOUSE, newValue.code); // Save warehouseCode
                                          SharedPreferencesHelper.saveString(AppConstants.WAREHOUSE_STATE_CODE, newValue.stateCode);
                                          setState(() {
                                            _selectedWarehouseValue = newValue;
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                );
                              }else{
                                return Container();
                              }
                            },
                          ),
                    // : Container(),
                          Container(
                            margin: EdgeInsets.only(
                                top:
                                AppDimensions.getResponsiveHeight(context) *
                                    .02),
                            width: size.width * .6,
                            child: AppWidgets.customMobileButton(
                              size: size,
                              btnName: "Choose",
                              color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                              textColor: Colors.white,
                              func: () {
                                debugPrint(
                                    "Selected value--->$_selectedLegalEntityValue");
                                if (_selectedLegalEntityValue != null || _selectedWarehouseValue != null) {
                                  SharedPreferencesHelper.init();
                                  debugPrint(
                                      "NEW_VALUE===>$_selectedLegalEntityValue");
                                  if (mounted) {
                                    // context.go(AppPages.ESTIMATION);
                                    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProductListDialog(isDialog: false,),));
                                    //context.go('/product-list');
                                    context.go(AppPages.SEARCH_PRODUCT);
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                          "Please choose legal entity and warehouse",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        )),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
