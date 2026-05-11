import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/api_status.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../estimation_screen/presentation/bloc/estimation_bloc.dart';
import '../data/model/salesman_model.dart';

class SalesmanListDialog extends StatefulWidget {
  final List<EmployeeList>? employeeList;
  final VoidCallback? onCallback;

  const SalesmanListDialog({super.key, this.employeeList, this.onCallback});

  @override
  State<SalesmanListDialog> createState() => _SalesmanListDialogState();
}

class _SalesmanListDialogState extends State<SalesmanListDialog> {
  final _searchTextController = TextEditingController();

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // SystemChannels.textInput.invokeMethod('TextInput.hide');
    context.read<EstimationBloc>().add(FetchSalesmanListEvent(search: ""));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      insetPadding: EdgeInsets.symmetric(
        horizontal: size.width * 0.02,
        vertical: size.height * 0.1,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      child: PopScope(
        canPop: false,
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
                        const Text(
                          "Salesman search",
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
                            height: 25,
                            width: 25,
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
                    AppWidgets.buildSearchableField(
                      size,
                      change: (text, qty) {
                        debugPrint("SEARCHABLE_TEXT==>$text");
                        context.read<EstimationBloc>().add(
                          SearchEmployeeEvent(search: text),
                        );
                      },
                      "Search by name",
                      _searchTextController,
                      isEnabled: true,
                      isProductList: false
                    ),
                    //Gap(size.height * 0.05),
                    BlocConsumer<EstimationBloc, EstimationState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        switch (state.apiDialogStatus) {
                          case ApiStatus.loading:
                            return Expanded(
                              child: Center(
                                child: SizedBox(
                                  height: size.height * 0.03,
                                  width: size.width * 0.06,
                                  child:
                                      Platform.isAndroid
                                          ? const CircularProgressIndicator(
                                            color:
                                                AppColors
                                                    .LOGO_BACKGROUND_RED_COLOR,
                                          )
                                          : const CupertinoActivityIndicator(),
                                ),
                              ),
                            );
                          case ApiStatus.success:
                            return Expanded(
                              child:
                                  state.filteredEmployeeList!.isNotEmpty
                                      ? ListView.builder(
                                        itemBuilder: (context, index) {
                                          return _buildSalesmanContainer(
                                            index,
                                            size,
                                            state.filteredEmployeeList,
                                          );
                                        },
                                        // itemCount: state.employeeList!.length,
                                        itemCount:
                                            state.filteredEmployeeList!.length,
                                      )
                                      : Center(
                                        child: Text(
                                          "No salesman found",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
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
      ),
    );
  }

  Widget _buildSalesmanContainer(
    int index,
    Size size,
    List<EmployeeList>? employeeList,
  ) {
    return GestureDetector(
      onTap: () {
        debugPrint("SALESMAN_INDEX-->$index");
        context.read<EstimationBloc>().add(SelectSalesmanEvent(index));
        widget.onCallback?.call();
        Navigator.pop(context);
      },
      child: Container(
        /*margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.01, vertical: size.height * 0.02),*/
        margin: EdgeInsets.symmetric(vertical: size.height * .005),
        padding: const EdgeInsets.symmetric(vertical: 2,), //,vertical: 2
        // padding: const EdgeInsets.only(left: 6), //,vertical: 2
        height: size.height * 0.09,
        decoration: BoxDecoration(
          color: index % 2 == 0
              ? AppColors.APP_BACKGROUND_COLOR//AppColors.CONTAINER_BACKGROUND_COLOR_01
              : AppColors.APP_WHITE_COLOR,//AppColors.CONTAINER_BACKGROUND_COLOR_02,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // height: size.height * 0.02,
                    // margin: EdgeInsets.symmetric(vertical: size.height * .005, horizontal: size.width * .01),
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * .008,
                      vertical: size.height * .003,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                      // index % 2 == 0
                      //     ? AppColors.LOGO_BACKGROUND_RED_COLOR//STEPPER_DONE_COLOR
                      //     : AppColors.APP_WHITE_COLOR,//CONTAINER_BACKGROUND_COLOR_03,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Center(
                      child: Text(
                        "${employeeList![index].emplId}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: size.height * .005,
                      horizontal: size.width * .01,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * .002,
                      vertical: size.height * .002,
                    ),
                    child: Text(
                      "${employeeList[index].eName}",
                      style: const TextStyle(
                        color: AppColors.LOGO_BACKGROUND_RED_COLOR,//STEPPER_DONE_COLOR,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 35,
                width: 35,
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: SvgPicture.asset("assets/images/arrow_right_circle.svg"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
