import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constants/api_status.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_widgets.dart';
import '../../../../estimation_screen/presentation/bloc/estimation_bloc.dart';
import '../../view_customer/presentation/mobile_ui/mobile_view_customer.dart';

class MobileSearchCustomer extends StatefulWidget {
  const MobileSearchCustomer({super.key});

  @override
  State<MobileSearchCustomer> createState() => _MobileSearchCustomerState();
}

class _MobileSearchCustomerState extends State<MobileSearchCustomer> {
  @override
  void initState() {
    super.initState();
    context.read<EstimationBloc>().add(const FetchCustomerListEvent());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return ScaffoldMessenger(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            child: Column(
              children: [
                Gap(size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: const Icon(
                    //     Icons.arrow_back,
                    //     color: AppColors.STEPPER_DONE_COLOR,
                    //   ),
                    // ),
                    const Text(
                      "Search Customer",
                      style: TextStyle(
                          color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
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
                    debugPrint("STATUS-->${state.apiDialogStatus}");
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
                      case ApiStatus.success:
                        return Expanded(
                          child: Column(
                            children: [
                              AppWidgets.buildSearchableField(
                                  size, "Search name, mobile no", null,
                                  isEnabled: true),
                              Gap(size.height * 0.05),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return _buildCustomerContainer(
                                        index, size, state);
                                  },
                                  itemCount: state.customerList!.length,
                                ),
                              ),
                            ],
                          ),
                        );
                      case ApiStatus.error:
                        return Expanded(
                          child: Center(
                            child: Text(state.message!),
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
    );
  }

  Widget _buildCustomerContainer(int index, Size size, EstimationState state) {
    return GestureDetector(
      onTap: () {
        context.read<EstimationBloc>().add(SelectCustomerEvent(index));
        Navigator.pop(context);
      },
      child: Container(
        /*margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.01, vertical: size.height * 0.02),*/
        margin: EdgeInsets.symmetric(vertical: size.height * .005),
        // padding: const EdgeInsets.symmetric(horizontal: 6), //,vertical: 2
        // padding: const EdgeInsets.only(left: 6), //,vertical: 2
        height: size.height * 0.09,
        decoration: BoxDecoration(
          color: index % 2 == 0
              ? AppColors.CONTAINER_BACKGROUND_COLOR_01
              : AppColors.CONTAINER_BACKGROUND_COLOR_02,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.01,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // height: size.height * 0.02,
                    margin: EdgeInsets.symmetric(
                        vertical: size.height * .005,
                        horizontal: size.width * .01),
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * .01,
                        vertical: size.height * .002),
                    decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? AppColors.STEPPER_DONE_COLOR
                          : AppColors.CONTAINER_BACKGROUND_COLOR_03,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Center(
                      child: Text(
                        "${state.customerList![index].customerCode}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        /*margin: EdgeInsets.symmetric(
                            vertical: size.height * .005, horizontal: size.width * .01),,*/
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * .002,
                          vertical: size.height * .002,
                        ),
                        child: Text(
                          "${state.customerList![index].customerName}",
                          style: const TextStyle(
                            color: AppColors.STEPPER_DONE_COLOR,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.call,
                            size: 12,
                            color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                          ),
                          Text(
                            "${state.customerList![index].mobileNumber}",
                            style: const TextStyle(
                              color: AppColors.STEPPER_DONE_COLOR,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
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
                );
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
