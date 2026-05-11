import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constants/api_status.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../estimation_screen/presentation/bloc/estimation_bloc.dart';

class CustomerGroupDialog extends StatefulWidget {
  const CustomerGroupDialog({super.key});

  @override
  State<CustomerGroupDialog> createState() => _CustomerGroupDialogState();
}

class _CustomerGroupDialogState extends State<CustomerGroupDialog> {

  @override
  void initState() {
    context.read<EstimationBloc>().add(const FetchCustomerGroupEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      insetPadding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.height * 0.2),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      child: ScaffoldMessenger(
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
                      const Expanded(
                        child: Center(
                          child: Text(
                            "Customer Group",
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
                          Navigator.of(context).pop();
                          // context.read<EstimationBloc>().add(ApiStatusChangeEvent());
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white),
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
                  BlocConsumer<EstimationBloc, EstimationState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      //debugPrint("Size--->${state.selectedProductList!.length}");
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
                          return Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return _buildContainer(
                                  index,
                                  size,
                                  state,
                                      () {
                                    context.read<EstimationBloc>().add(SelectCustomerGroupEvent(index,));
                                    context.read<EstimationBloc>().add(ApiStatusChangeEvent());
                                    Navigator.pop(context);
                                  },
                                );
                              },
                              itemCount: state.customerGroupList!.length,
                            ),
                          );
                        default:
                          return const SizedBox();
                      }
                    },
                  ),
                  Gap(size.height * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(
      int index, Size size, EstimationState state, void Function() func) {
    return GestureDetector(
      onTap: () => func(),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // height: size.height * 0.02,
                  margin: EdgeInsets.symmetric(
                      vertical: size.height * .006,
                      horizontal: size.width * .02),
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .02,
                      vertical: size.height * .005),
                  decoration: BoxDecoration(
                    color: index % 2 == 0
                        ? AppColors.STEPPER_DONE_COLOR
                        : AppColors.CONTAINER_BACKGROUND_COLOR_03,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Center(
                    child: Text(
                      "${state.customerGroupList![index].groupCode}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: size.height * .005,
                      horizontal: size.width * .01),
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .002,
                      vertical: size.height * .002),
                  child: Text(
                    "${state.customerGroupList![index].groupDesc}",
                    style: const TextStyle(
                        color: AppColors.STEPPER_DONE_COLOR,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
