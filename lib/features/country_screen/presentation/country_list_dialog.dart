import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/api_status.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../estimation_screen/presentation/bloc/estimation_bloc.dart';
import '../data/model/country_model.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<EstimationBloc>().add(FetchCountryList());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);


    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      insetPadding: EdgeInsets.symmetric(
          horizontal: size.width * 0.02, vertical: size.height * 0.1),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      child: PopScope(
        canPop: true,
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
                        /*GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.arrow_back,
                            color: AppColors.STEPPER_DONE_COLOR,
                          ),
                        ),*/
                        const Text(
                          "Country Search",
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
                          ),
                        ),
                      ],
                    ),
                    Gap(size.height * 0.02),
                    AppWidgets.buildSearchableField(
                        size,
                        "Search Country",
                        _searchTextController,
                        isEnabled: true),
                    Gap(size.height * 0.05),
                    BlocConsumer<EstimationBloc, EstimationState>(
                      listener: (context, state) {
                      },
                      builder: (context, state) {
                        switch(state.apiDialogStatus){
                          case ApiStatus.loading:
                            return Expanded(
                              child: Center(
                                child: SizedBox(
                                  height: size.height * 0.03,
                                  width: size.width * 0.06,
                                  child: Platform.isAndroid
                                      ? const CircularProgressIndicator(
                                    color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                                  )
                                      : const CupertinoActivityIndicator(),
                                ),
                              ),
                            );
                          case ApiStatus.success:
                            return Expanded(
                              child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return _buildCountryContainer(
                                        index, size, state.countryList);
                                  },
                                  itemCount: state.countryList!.length //10,
                              ),
                            );
                          default:
                            return const SizedBox();
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCountryContainer(int index, Size size,
      List<CountryList>? countryList,) {
    return GestureDetector(
      onTap: () {
        debugPrint("STATE_CLICK");
        // context.go(AppPages.ESTIMATION);
        context.read<EstimationBloc>().add(SelectCountryEvent(index));
        context.read<EstimationBloc>().add(ApiStatusChangeEvent());
        Navigator.pop(context);
      },
      child: Container(
        height: size.height * 0.065,
        margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
        decoration: BoxDecoration(
          color: AppColors.CONTAINER_BACKGROUND_COLOR_01,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(right: size.width * 0.02),
              height: size.height * 0.065,
              width: size.width * 0.01,
              decoration: const BoxDecoration(
                  color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    topLeft: Radius.circular(4),
                  )
                //BorderRadius.circular(4),
              ),
              /*child: Center(
                child: Text(
                  "${stateList![index].stateCode}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),*/
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${countryList![index].countryName}",
                    style: const TextStyle(
                      color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  /*Text(
                    "${stateList[index].country}",
                    style: TextStyle(
                      color: AppColors.HINT_TEXT_COLOR,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),*/
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              child: SvgPicture.asset("assets/images/arrow_right_circle.svg"),
            ),
          ],
        ),
      ),
    );
  }

}
