import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constants/api_status.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_widgets.dart';
import '../../../estimation_screen/presentation/bloc/estimation_bloc.dart';
import '../add_address/add_address_dialog.dart';

class AddressList extends StatefulWidget {
  const AddressList({super.key});

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  @override
  void initState() {
    super.initState();
    context.read<EstimationBloc>().add(const FetchAddressListEvent());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        if (context.mounted) {
          context.read<EstimationBloc>().add(ApiStatusChangeEvent());
          Navigator.pop(context);
        }
      },
      child: Dialog(
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
                                "Address Information",
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
                              context
                                  .read<EstimationBloc>()
                                  .add(ApiStatusChangeEvent());
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
                      AppWidgets.buildSearchableField(
                        size,
                        "Search address id,state1,street2,phone,email",
                        null,
                        isEnabled: true,
                      ),
                      Gap(size.height * 0.05),
                      BlocConsumer<EstimationBloc, EstimationState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            debugPrint("STATUS-------->${state.apiDialogStatus}");
                            switch (state.apiDialogStatus) {
                              case ApiStatus.loading:
                                return Expanded(
                                  child: Center(
                                    child: SizedBox(
                                      height: size.height * 0.03,
                                      width: size.width * 0.06,
                                      child: Platform.isAndroid
                                          ? const CircularProgressIndicator(
                                              color:
                                                  AppColors.LOGO_BACKGROUND_RED_COLOR,
                                            )
                                          : const CupertinoActivityIndicator(),
                                    ),
                                  ),
                                );
                              case ApiStatus.loaded:
                                return state.addressList!.isNotEmpty
                                    ? Expanded(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return _buildCustomerContainer(
                                                index, size, state);
                                          },
                                          itemCount: state.addressList!.length,
                                        ),
                                      )
                                    : const Expanded(
                                        child: Center(
                                          child: Text("No Address Found"),
                                        ),
                                      );
                              default:
                                return Container();
                            }
                          }),
                      Gap(size.height * 0.01),
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
                                      context
                                          .read<EstimationBloc>()
                                          .add(ApiStatusChangeEvent());
                                      Navigator.pop(context);
                                    },
                                    btnName: 'Cancel',
                                    color: AppColors.LOGO_BACKGROUND_RED_COLOR),
                              ),
                              Expanded(
                                child: AppWidgets.customMobileButton(
                                    size: size,
                                    func: () => showDialog(
                                          barrierDismissible: true,
                                          builder: (context) {
                                            return const AddAddressDialog();
                                          },
                                          context: context,
                                        ),
                                    btnName: 'Add New Address',
                                    color: AppColors.LOGO_BACKGROUND_RED_COLOR),
                              ),
                            ]),
                      ),
                      Gap(size.height * 0.01),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomerContainer(int index, Size size, EstimationState state) {
    return GestureDetector(
      onTap: () {
        context.read<EstimationBloc>().add(SelectAddressEvent(index));
        context.read<EstimationBloc>().add(ApiStatusChangeEvent());
        Navigator.pop(context);
      },
      child: Container(
        /*margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.01, vertical: size.height * 0.02),*/
        margin: EdgeInsets.symmetric(vertical: size.height * .005),
        // padding: const EdgeInsets.symmetric(horizontal: 6), //,vertical: 2
        // padding: const EdgeInsets.only(left: 6), //,vertical: 2
        height: size.height * 0.08,
        decoration: BoxDecoration(
          color: index % 2 == 0
              ? AppColors.CONTAINER_BACKGROUND_COLOR_01
              : AppColors.CONTAINER_BACKGROUND_COLOR_02,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        // height: size.height * 0.02,
                        margin: EdgeInsets.symmetric(
                            vertical: size.height * .005,
                            horizontal: size.width * .01),
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * .02,
                            vertical: size.height * .003),
                        decoration: BoxDecoration(
                          color: index % 2 == 0
                              ? AppColors.STEPPER_DONE_COLOR
                              : AppColors.CONTAINER_BACKGROUND_COLOR_03,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Center(
                          child: Text(
                            "${state.addressList![index].country}",
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
                      // "${state.addressList![index].city},${state.addressList![index].stateCode!.description}",
                      "${state.addressList![index].city},${state.addressList![index].stateCode!}",
                      // overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          color: AppColors.STEPPER_DONE_COLOR,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                /*showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        insetPadding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.05,
                            vertical: size.height * 0.1),
                        // clipBehavior: Clip.antiAliasWithSaveLayer,
                        // backgroundColor: Colors.white,
                        child: const MobileViewCustomer()
                      //const CustomerDetailsDialog(),
                    );
                  },
                );*/
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: size.height * .005, horizontal: size.width * .02),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * .002,
                    vertical: size.height * .002),
                child: const Text(
                  "View Details",
                  style: TextStyle(
                      color: AppColors.STEPPER_DONE_COLOR,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
