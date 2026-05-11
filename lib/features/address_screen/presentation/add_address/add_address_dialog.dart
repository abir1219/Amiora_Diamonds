import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constants/api_status.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_widgets.dart';
import '../../../country_screen/presentation/country_list_dialog.dart';
import '../../../estimation_screen/presentation/bloc/estimation_bloc.dart';
import '../../../state_screen/presentation/state_list_dialog.dart';

class AddAddressDialog extends StatefulWidget {
  const AddAddressDialog({super.key});

  @override
  State<AddAddressDialog> createState() => _AddAddressDialogState();
}

class _AddAddressDialogState extends State<AddAddressDialog> {
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _countryController = TextEditingController();
  final _street1Controller = TextEditingController();
  final _street2Controller = TextEditingController();
  final _doorNoController = TextEditingController();
  final _houseNoController = TextEditingController();
  final _phoneNo1Controller = TextEditingController();
  final _phoneNo2Controller = TextEditingController();
  final _mobile1Controller = TextEditingController();
  final _mobile2Controller = TextEditingController();
  final _faxController = TextEditingController();
  final _emailController = TextEditingController();
  final _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      insetPadding: EdgeInsets.symmetric(
          horizontal: size.width * 0.03, vertical: size.height * 0.1),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      child: ScaffoldMessenger(
        child: Scaffold(
          body: SafeArea(
            child: BlocConsumer<EstimationBloc, EstimationState>(
              listener: (context, state) {},
              builder: (context, state) {
                _stateController.text = state.stateName?.toString() ?? "";
                _countryController.text = state.countryName?.toString() ?? "";
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Column(
                    children: [
                      Gap(size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Center(
                              child: Text(
                                "Add Address",
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
                              //context.read<EstimationBloc>().add(ResetDataEvent());
                              // context.read<EstimationBloc>().add(ApiStatusChangeEvent());
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
                      Gap(size.height * 0.04),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              AppWidgets.buildField(
                                  size, "City", _cityController),

                              AppWidgets.buildSearchableField(
                                  func: () => showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const CountryScreen(
                                      );
                                    },
                                  ),
                                  size,
                                  "Country",
                                  _countryController),
                              AppWidgets.buildSearchableField(
                                  func: () => _countryController.text.isNotEmpty?showDialog(
                                        context: context,
                                        builder: (context) {
                                          return StateListDialog(
                                            country: state.countryName,
                                          );
                                        },
                                      ):ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Please select country.")),
                                  ),
                                  size,
                                  "State",
                                  _stateController),
                              /*AppWidgets.buildField(
                                size,
                                "India",
                                null,
                                enabled: false,
                              ),*/
                              AppWidgets.buildField(
                                  size, "Street 1", _street1Controller),
                              AppWidgets.buildField(
                                  size, "Street 2", _street2Controller),
                              AppWidgets.buildField(
                                  size, "Door No", _doorNoController),
                              AppWidgets.buildField(
                                  size, "House No", _houseNoController),
                              AppWidgets.buildField(
                                  size, "Phone 1", _phoneNo1Controller,
                                  textInputType: TextInputType.phone,
                                  maxLength: 10,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ]),
                              AppWidgets.buildField(
                                  size, "Phone 2", _phoneNo2Controller,
                                  textInputType: TextInputType.phone,
                                  maxLength: 10,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ]),
                              AppWidgets.buildField(
                                  size, "Mobile 1", _mobile1Controller,
                                  textInputType: TextInputType.phone,
                                  maxLength: 10,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ]),
                              AppWidgets.buildField(
                                size,
                                "Mobile 2",
                                _mobile2Controller,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                textInputType: TextInputType.phone,
                                maxLength: 10,
                              ),
                              AppWidgets.buildField(size, "Fax", _faxController,
                                  textInputType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ]),
                              AppWidgets.buildField(
                                  size, "Email id", _emailController,
                                  textInputType: TextInputType.emailAddress),
                              AppWidgets.buildField(
                                  size, "Pincode", _pinController,
                                  textInputType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ]),
                            ],//_pinController
                          ),
                        ),
                      ),
                      Gap(size.height * 0.01),
                      BlocConsumer<EstimationBloc, EstimationState>(
                        listenWhen: (previous, current) =>
                            current.apiDialogStatus == ApiStatus.loaded ||
                            current.apiDialogStatus == ApiStatus.error,
                        listener: (context, state) {
                          if (state.apiDialogStatus == ApiStatus.loaded) {
                            Navigator.pop(context);
                          } else if (state.apiDialogStatus == ApiStatus.error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.message!)));
                          }
                        },
                        builder: (context, state) {
                          return AppWidgets.customMobileButton(
                              size: size,
                              func: () {
                                if (_cityController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Enter city")));
                                } else if (_stateController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Choose state")));
                                } else if (_street1Controller.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Enter street 1")));
                                } else {
                                  context.read<EstimationBloc>().add(
                                      AddAddressEvent(
                                          _cityController.text.trim(),
                                          state.posId,
                                          _street1Controller.text.trim(),
                                          _street2Controller.text.trim(),
                                          _doorNoController.text.trim(),
                                          _houseNoController.text.trim(),
                                          _mobile1Controller.text.trim(),
                                          _mobile2Controller.text.trim(),
                                          _phoneNo1Controller.text.trim(),
                                          _phoneNo2Controller.text.trim(),
                                          _faxController.text.trim(),
                                          _emailController.text.trim(),
                                        _pinController.text.trim(),
                                      ));
                                }
                              },
                              isLoading: state.apiDialogStatus == ApiStatus.loading
                                  ? true
                                  : false,
                              btnName: 'Save Address',
                              color: AppColors.LOGO_BACKGROUND_RED_COLOR);
                        },
                      ),
                      Gap(size.height * 0.01),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
