import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constants/api_status.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_widgets.dart';
import '../../../../address_screen/presentation/view_address_list/address_list.dart';
import '../../../../estimation_screen/presentation/bloc/estimation_bloc.dart';
import '../../../../state_screen/data/model/state_model.dart';
import '../../customer_group/presentation/customer_group_dialog.dart';

class MobileAddCustomer extends StatefulWidget {
  final List<StateList>? stateList;

  const MobileAddCustomer({super.key, this.stateList});

  @override
  State<MobileAddCustomer> createState() => _MobileAddCustomerState();
}

class _MobileAddCustomerState extends State<MobileAddCustomer> {

  final _customerNameController = TextEditingController();
  final _spouseDobController = TextEditingController();
  final _dobController = TextEditingController();
  // final _customerCodeController = TextEditingController();
  final _marriageAnniversaryController = TextEditingController();
  final _customerGroupTextEditingController = TextEditingController();
  final _mobileNoTextEditingController = TextEditingController();
  final _emailTextEditingController = TextEditingController();
  final _panTextEditingController = TextEditingController();
  final _aadharTextEditingController = TextEditingController();
  final _creditLimitTextEditingController = TextEditingController();
  final _gstinTextEditingController = TextEditingController();
  final _spouseNameTextEditingController = TextEditingController();
  final _spouseMobileNoTextEditingController = TextEditingController();

  DateTime? _selectedDate;

  int? primaryAddressIndex;

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      // setState(() {
      //   _selectedDate = picked;
      // });
      //DateTime dateTime = DateTime("", 9, 4, 0, 0, 0);
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      debugPrint("Date-Time-->$formattedDate");
      controller.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return ScaffoldMessenger(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            child: BlocConsumer<EstimationBloc, EstimationState>(
              listenWhen: (previous, current) =>
                  current.apiStatus == ApiStatus.success || current.apiStatus == ApiStatus.error,
              listener: (context, state) {
                Navigator.pop(context);
                if(state.apiStatus == ApiStatus.success){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Customer added successfully"),
                    ),
                  );
                }else if(state.apiStatus == ApiStatus.error){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message!),
                    ),
                  );
                }
                // context
                //     .read<EstimationBloc>()
                //     .add(const ClearSelectedAddressEvent());
              },
              builder: (context, state) {
                _customerGroupTextEditingController.text =
                    state.selectedCustomerGroup?.groupCode! ?? "";

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /*GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.STEPPER_DONE_COLOR,
                      ),
                    ),*/
                        const Text(
                          "Add Customer",
                          style: TextStyle(
                            color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            // context
                            //     .read<EstimationBloc>()
                            //     .add(const ClearSelectedAddressEvent());
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
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(size.height * 0.02),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            /*AppWidgets.buildField(
                                size, "Customer Code", _customerCodeController),*/
                            AppWidgets.buildField(
                                size, "Customer Name", _customerNameController),
                            AppWidgets.buildSearchableField(
                              size,
                              "Customer Group",
                              _customerGroupTextEditingController,
                              func: () {
                                showGeneralDialog(
                                  context: context,
                                  // builder: (context) => const IngredientsFormDialog(),
                                  barrierDismissible: true,
                                  barrierLabel: MaterialLocalizations.of(context)
                                      .modalBarrierDismissLabel,
                                  barrierColor: Colors.black45,
                                  transitionDuration:
                                      const Duration(milliseconds: 300),
                                  transitionBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return SlideTransition(
                                      position: Tween<Offset>(
                                        begin: const Offset(0, 1),
                                        // Start from the bottom
                                        end: const Offset(
                                            0, 0), // End at the center
                                      ).animate(CurvedAnimation(
                                        parent: animation,
                                        curve: Curves
                                            .easeInOut, // Ease-in transformation
                                      )),
                                      child: child,
                                    );
                                  },
                                  pageBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Animation<double> secondaryAnimation) =>
                                      const CustomerGroupDialog(),
                                );
                              },
                            ),
                            AppWidgets.buildField(size, "Mobile Number",
                                _mobileNoTextEditingController,
                                textInputType: TextInputType.phone,
                                maxLength: 10,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ]),
                            AppWidgets.buildField(
                              size,
                              "Credit Limit",
                              _creditLimitTextEditingController,
                              textInputType: TextInputType.number,
                            ),
                            AppWidgets.buildField(
                                size, "GSTIN No", _gstinTextEditingController),
                            AppWidgets.buildDateField(
                              size,
                              "Date of Birth",
                              _dobController,
                              func: () => _selectDate(context, _dobController),
                            ),
                            AppWidgets.buildDateField(
                              size,
                              "Marriage Anniversary",
                              _marriageAnniversaryController,
                              func: () => _selectDate(
                                  context, _marriageAnniversaryController),
                            ),
                            AppWidgets.buildField(size, "Spouse Name",
                                _spouseNameTextEditingController),
                            AppWidgets.buildField(size, "Spouse Mobile Number",
                                _spouseMobileNoTextEditingController,
                                textInputType: TextInputType.phone,
                                maxLength: 10,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ]),
                            AppWidgets.buildDateField(
                              size,
                              "Spouse Date of Birth",
                              _dobController,
                              func: () =>
                                  _selectDate(context, _spouseDobController),
                            ),
                            /*Row(
                              children: [

                              ],
                            ),*/
                            /*Row(
                              children: [
                                Expanded(
                                  child: CheckboxListTile(
                                    title: const Text(
                                      "On Hold",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    controlAffinity:
                                        ListTileControlAffinity.platform,
                                    activeColor: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
                                    checkColor: Colors.white,
                                    value: state.checkboxText == "On Hold"
                                        ? true
                                        : false,
                                    onChanged: (value) {
                                      context
                                          .read<EstimationBloc>()
                                          .add(const ChangeCheckBox("On Hold"));
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: CheckboxListTile(
                                    title: const Text(
                                      "With Holding",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    controlAffinity:
                                        ListTileControlAffinity.platform,
                                    activeColor: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
                                    checkColor: Colors.white,
                                    value: state.checkboxText == "With Holding"
                                        ? true
                                        : false,
                                    onChanged: (value) {
                                      context.read<EstimationBloc>().add(
                                          const ChangeCheckBox("With Holding"));
                                    },
                                  ),
                                ),
                              ],
                            ),*/
                            AppWidgets.buildField(
                                maxLength: 20,
                                size,
                                "PAN No",
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$')),
                                ],
                                _panTextEditingController),
                            AppWidgets.buildField(size, "Aadhar Number",
                                _aadharTextEditingController,
                                maxLength: 16,
                                textInputType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ]),
                            //AppWidgets.buildField(size, "Pincode", null,textInputType: TextInputType.phone,maxLength: 6,inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
                            AppWidgets.buildSearchableField(
                              size,
                              "Select Address",
                              null,
                              func: () {
                                context
                                    .read<EstimationBloc>()
                                    .add(ApiStatusChangeEvent());
                                showGeneralDialog(
                                  context: context,
                                  // builder: (context) => const IngredientsFormDialog(),
                                  barrierDismissible: true,
                                  barrierLabel: MaterialLocalizations.of(context)
                                      .modalBarrierDismissLabel,
                                  barrierColor: Colors.black45,
                                  transitionDuration:
                                      const Duration(milliseconds: 300),
                                  transitionBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return SlideTransition(
                                      position: Tween<Offset>(
                                        begin: const Offset(0, 1),
                                        // Start from the bottom
                                        end: const Offset(
                                            0, 0), // End at the center
                                      ).animate(CurvedAnimation(
                                        parent: animation,
                                        curve: Curves
                                            .easeInOut, // Ease-in transformation
                                      )),
                                      child: child,
                                    );
                                  },
                                  pageBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Animation<double> secondaryAnimation) =>
                                      const AddressList(),
                                );
                              },
                              icons: "assets/images/plus_circle.svg",
                            ),
                            // AppWidgets.buildSearchableField(size, "Country", null),
                            // AppWidgets.buildSearchableField(size, "State", null,func: () {
                            //   showDialog(context: context, builder: (context) {
                            //     return StateListDialog(stateList: widget.stateList!,);
                            //   },);
                            // },),
                            state.apiDialogStatus == ApiStatus.initial &&
                                    state.selectedAddressList!.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return _buildContainer(index, size, state);
                                    },
                                    itemCount: state.selectedAddressList!.length,
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    Gap(size.height * .01),
                    Container(
                      color: Colors.transparent,
                      padding:
                          EdgeInsets.symmetric(horizontal: size.height * .02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: AppWidgets.customMobileButton(
                                size: size,
                                func: () {
                                  _customerNameController.text = "";
                                  _spouseDobController.text = "";
                                  _dobController.text = "";
                                  _marriageAnniversaryController.text = "";
                                  _customerGroupTextEditingController.text = "";
                                  _mobileNoTextEditingController.text = "";
                                  _emailTextEditingController.text = "";
                                  _panTextEditingController.text = "";
                                  _aadharTextEditingController.text = "";
                                  _creditLimitTextEditingController.text = "";
                                  _gstinTextEditingController.text = "";
                                  _spouseNameTextEditingController.text = "";
                                  _spouseMobileNoTextEditingController.text = "";
                                  context.read<EstimationBloc>().add(ResetDataEvent());
                                },
                                btnName: 'Reset',
                                color: AppColors.LOGO_BACKGROUND_RED_COLOR),
                          ),
                          Expanded(
                            child: AppWidgets.customMobileButton(
                                size: size,
                                func: () {
                                  context.read<EstimationBloc>().add(ResetDataEvent());
                                  context.read<EstimationBloc>().add(ApiStatusChangeEvent());
                                  Navigator.pop(context);
                                },
                                btnName: 'Cancel',
                                color: AppColors.LOGO_BACKGROUND_RED_COLOR),
                          ),
                          Expanded(
                            child: AppWidgets.customMobileButton(
                                size: size,
                                isLoading: state.apiStatus == ApiStatus.loading
                                    ? true
                                    : false,
                                func: () {
                                  if (kDebugMode) {
                                    for (var name in state.selectedAddressList!) {
                                      debugPrint(
                                          "SELECTED_ADDRESS--->${name.city},${name.isPrimary}");
                                    }
                                  }
                                  if (_customerNameController.text.isEmpty) {
                                    // Fluttertoast.showToast(
                                    //     msg: "Add customer name",
                                    //     backgroundColor:
                                    //         AppColors.LOGO_BACKGROUND_BLUE_COLOR,
                                    //     textColor: Colors.white);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Add customer name"),
                                      ),
                                    );
                                  } else if (_mobileNoTextEditingController
                                      .text.isEmpty) {
                                    // Fluttertoast.showToast(
                                    //     msg: "Add mobile no.",
                                    //     backgroundColor:
                                    //         AppColors.LOGO_BACKGROUND_BLUE_COLOR,
                                    //     textColor: Colors.white);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Add mobile no."),
                                      ),
                                    );
                                  } else if (_customerGroupTextEditingController
                                      .text.isEmpty) {
                                    // Fluttertoast.showToast(
                                    //     msg: "Add customer group.",
                                    //     backgroundColor:
                                    //         AppColors.LOGO_BACKGROUND_BLUE_COLOR,
                                    //     textColor: Colors.white);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Add customer group"),
                                      ),
                                    );
                                  }else if (state.selectedAddressList!.isEmpty) {
                                    // Fluttertoast.showToast(
                                    //     msg: "Select address",
                                    //     backgroundColor:
                                    //     AppColors.LOGO_BACKGROUND_BLUE_COLOR,
                                    //     textColor: Colors.white);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Add customer address"),
                                      ),
                                    );
                                  } else {
                                    context.read<EstimationBloc>().add(
                                          SaveCustomerDetailsEvent(
                                            //_customerCodeController.text.toString(),
                                            _customerNameController.text
                                                .toString(),
                                            // int.parse(_customerGroupTextEditingController.text),
                                            _mobileNoTextEditingController.text,
                                            _emailTextEditingController.text,
                                            _dobController.text,
                                            _panTextEditingController.text,
                                            _marriageAnniversaryController.text,
                                            _aadharTextEditingController.text,
                                            _creditLimitTextEditingController
                                                .text,
                                          ),
                                        );
                                  }
                                },
                                btnName: 'Save',
                                color: AppColors.LOGO_BACKGROUND_RED_COLOR),
                          ),
                        ],
                      ),
                    ),
                    Gap(size.height * 0.02),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(int index, Size size, EstimationState state) {
    return Container(
      /*margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.01, vertical: size.height * 0.02),*/
      margin: EdgeInsets.symmetric(vertical: size.height * .005),
      // padding: const EdgeInsets.symmetric(horizontal: 6), //,vertical: 2
      // padding: const EdgeInsets.only(left: 6), //,vertical: 2
      height: size.height * 0.08,
      decoration: BoxDecoration(
        color: //AppColors.CONTAINER_BACKGROUND_COLOR_01,
            index % 2 == 0
                ? AppColors.CONTAINER_BACKGROUND_COLOR_01
                : AppColors.CONTAINER_BACKGROUND_COLOR_02,
      ),
      child: ListTile(
        title: Text(
          "${state.addressList![index].country}",
          style: const TextStyle(
              color: AppColors.LOGO_BACKGROUND_RED_COLOR,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          // "${state.selectedAddressList![index].city},${state.selectedAddressList![index].stateCode!.description}",
          "${state.selectedAddressList![index].city},${state.selectedAddressList![index].stateCode!}",
          style: const TextStyle(
              color: AppColors.LOGO_BACKGROUND_RED_COLOR,
              fontSize: 12,
              fontWeight: FontWeight.w600),
        ),
        trailing: Radio<int>(
          value: index,
          activeColor: AppColors.LOGO_BACKGROUND_RED_COLOR,
          groupValue: state.selectAddressIndex,
          onChanged: (int? value) {
            context.read<EstimationBloc>().add(SelectAddressIndexEvent(index));
          },
        ),
      ),
    );
  }
}
