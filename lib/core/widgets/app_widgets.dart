import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:intl/intl.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../../main.dart';

class AppWidgets {
  static Widget customMobileButton({
    required Size size,
    required String btnName,
    Color color = AppColors.LOGO_BACKGROUND_RED_COLOR,
    bool isLoading = false,
    void Function()? func,
    Color textColor = Colors.white,
  }) {
    return GestureDetector(
      onTap: () => func!(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        height:
            // AppDimensions.getResponsiveHeight(navigatorKey.currentContext!) * .04,
            AppDimensions.getResponsiveHeight(navigatorKey.currentContext!) *
            .05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: color,
        ),
        child: Center(
          child: isLoading
              ? LoadingAnimationWidget.staggeredDotsWave(
                  color: textColor,
                  size: 22,
                )
              : Text(
                  btnName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
        ),
      ),
    );
  }

  Widget buildTopEstimationContainer(
    Size size, {
    bool isShown = false,
    bool isLoggedIn = false,
  }) {
    return Container(
      height:
          AppDimensions.getResponsiveHeight(navigatorKey.currentContext!) * .24,
      //.18//.22
      width: size.width,
      //AppDimensions.getResponsiveWidth(navigatorKey.currentContext!),
      padding: EdgeInsets.symmetric(
        horizontal:
            AppDimensions.getResponsiveWidth(navigatorKey.currentContext!) *
            0.03, //0.04,
      ),
      color: AppColors.LOGO_BACKGROUND_RED_COLOR,
      /*decoration: const BoxDecoration(
        color: Colors.white, //AppColors.LOGO_BACKGROUND_BLUE_COLOR,
        image: DecorationImage(
          image: AssetImage("assets/images/doodle.png"),
          fit: BoxFit.cover,
        ),
      ),*/
      child: Stack(
        //mainAxisAlignment: isShown?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(navigatorKey.currentContext!).width * 0.3,
            height: MediaQuery.sizeOf(navigatorKey.currentContext!).width * 0.2,
            child: Image.asset("assets/images/logo.png"),
          ),
          /*SvgPicture.asset(
            "assets/images/logo.svg",
            height: AppDimensions.getResponsiveHeight(
                navigatorKey.currentContext!) *
                0.06, //.1,
            width:
            AppDimensions.getResponsiveWidth(navigatorKey.currentContext!) *
                0.06, //.1,
          ),*/
          /*Positioned(
            right: 0,
            bottom: 0,
            child: Row(
              children: [
                isLoggedIn?GestureDetector(
                  onTap: () {
                    // RenderBox renderBox = navigatorKey.currentContext!.findRenderObject() as RenderBox;
                    //renderBox.localToGlobal(Offset.zero);
                    showMenu(
                      context: navigatorKey.currentContext!,
                      position: RelativeRect.fromLTRB(
                        AppDimensions.getResponsiveWidth(
                            navigatorKey.currentContext!) *
                            0.04,
                        AppDimensions.getResponsiveHeight(
                            navigatorKey.currentContext!) *
                            0.1,
                        0,
                        0,
                      ),
                      items: [
                        const PopupMenuItem(
                          value: 1,
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout,
                                color: Colors.black,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Logout",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ).then((value) {
                      if (value == 1) {
                        // Handle the logout action here
                        //_logout();
                      }
                    });
                  },
                  child: Container(
                    height: AppDimensions.getResponsiveHeight(
                        navigatorKey.currentContext!) *
                        0.075,
                    width: AppDimensions.getResponsiveWidth(
                        navigatorKey.currentContext!) *
                        0.075,
                    margin: EdgeInsets.only(
                      left: AppDimensions.getResponsiveWidth(
                          navigatorKey.currentContext!) *
                          0.04,
                    ),
                    padding: EdgeInsets.all(AppDimensions.getResponsiveWidth(
                        navigatorKey.currentContext!) *
                        0.01,),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.LOGO_BACKGROUND_GREEN_COLOR,//Color(0xFFF0EEEE),
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/images/user.svg",),
                    ),
                  ),
                ):Container()
              ],
            ),
          ),*/
        ],
      ),
    );
  }

  Widget buildTopContainer(
    Size size, {
    bool isShown = false,
    bool isLoggedIn = false,
  }) {
    return Container(
      color: AppColors.LOGO_BACKGROUND_RED_COLOR,
      height:
          AppDimensions.getResponsiveHeight(navigatorKey.currentContext!) * .4,
      //.18//.22//size.height * .18
      width: size.width,
      //AppDimensions.getResponsiveWidth(navigatorKey.currentContext!),
      padding: EdgeInsets.symmetric(
        horizontal:
            AppDimensions.getResponsiveWidth(navigatorKey.currentContext!) *
            0.03, //0.04,
      ),
      /*decoration: const BoxDecoration(
        color: Colors.white, //AppColors.LOGO_BACKGROUND_BLUE_COLOR,
        image: DecorationImage(
          image: AssetImage("assets/images/doodle.png"),
          fit: BoxFit.cover,
        ),
      ),*/
      child: Stack(
        //mainAxisAlignment: isShown?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(navigatorKey.currentContext!).width * 0.3,//0.5,
            height: MediaQuery.sizeOf(navigatorKey.currentContext!).width * 0.5,//0.5,
            child: Image.asset("assets/images/logo.png"),
          ),
          /*SvgPicture.asset(
            "assets/images/logo.svg",
            height: AppDimensions.getResponsiveHeight(
                navigatorKey.currentContext!) *
                0.06, //.1,
            width:
            AppDimensions.getResponsiveWidth(navigatorKey.currentContext!) *
                0.06, //.1,
          ),*/
          Positioned(
            right: 0,
            child: Row(
              children: [
                isLoggedIn
                    ? GestureDetector(
                        onTap: () {
                          // RenderBox renderBox = navigatorKey.currentContext!.findRenderObject() as RenderBox;
                          //renderBox.localToGlobal(Offset.zero);
                          showMenu(
                            context: navigatorKey.currentContext!,
                            position: RelativeRect.fromLTRB(
                              AppDimensions.getResponsiveWidth(
                                    navigatorKey.currentContext!,
                                  ) *
                                  0.04,
                              AppDimensions.getResponsiveHeight(
                                    navigatorKey.currentContext!,
                                  ) *
                                  0.1,
                              0,
                              0,
                            ),
                            items: [
                              const PopupMenuItem(
                                value: 1,
                                child: Row(
                                  children: [
                                    Icon(Icons.logout, color: Colors.black),
                                    SizedBox(width: 10),
                                    Text(
                                      "Logout",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ).then((value) {
                            if (value == 1) {
                              // Handle the logout action here
                              //_logout();
                            }
                          });
                        },
                        child: Container(
                          height:
                              AppDimensions.getResponsiveHeight(
                                navigatorKey.currentContext!,
                              ) *
                              0.075,
                          width:
                              AppDimensions.getResponsiveWidth(
                                navigatorKey.currentContext!,
                              ) *
                              0.075,
                          margin: EdgeInsets.only(
                            left:
                                AppDimensions.getResponsiveWidth(
                                  navigatorKey.currentContext!,
                                ) *
                                0.04,
                          ),
                          padding: EdgeInsets.all(
                            AppDimensions.getResponsiveWidth(
                                  navigatorKey.currentContext!,
                                ) *
                                0.01,
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFF0EEEE),
                          ),
                          child: Center(
                            child: SvgPicture.asset("assets/images/user.svg"),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildField(
      Size size,
      String hint,
      TextEditingController? controller, {
        TextInputType textInputType = TextInputType.text,
        VoidCallback? onChange,
        VoidCallback? onTap,
        VoidCallback? onSubmit,
        FocusNode? focusNode,
        bool enabled = true,
        int? maxLength,
        List<TextInputFormatter>? inputFormatters,
      }) {
    final bool isTablet = size.shortestSide >= 600; // basic check for iPad/tablet

    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.008),
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 16 : 8,
        vertical: isTablet ? 10 : 4,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isTablet ? 10 : 6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: isTablet ? 6 : 3,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: textInputType,
        inputFormatters: inputFormatters,
        maxLength: maxLength,
        enabled: enabled,
        style: TextStyle(
          color: Colors.black,
          fontSize: isTablet ? 18 : 14,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: hint,
          counterText: "",
          hintStyle: TextStyle(
            color: AppColors.HINT_TEXT_COLOR,
            fontSize: isTablet ? 16 : 14,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: isTablet ? 14 : 8,
          ),
        ),
        onChanged: (_) => onChange?.call(),
        onTap: onTap,
        onSubmitted: (_) => onSubmit?.call(),
      ),
    );
  }

  /*static Widget buildField(
    Size size,
    String hint,
    TextEditingController? controller, {
    TextInputType? textInputType = TextInputType.text,
    Function()? onChange,
    Function()? onTap,
    Function()? onSubmit,
    FocusNode? focusNode,
    bool enabled = true,
    var maxLength,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * .0055),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      //,vertical: 2
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        *//*border: Border.all(
            color: AppColors.STEPPER_DONE_COLOR,
            width: 1,
          ),*//*
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            spreadRadius: 1.2,
            blurRadius: 0.5,
            offset: const Offset(1.0, 1.0),
          ),
        ],
      ),
      child: TextField(
        keyboardType: textInputType,
        maxLength: maxLength,
        onChanged: (value) => onChange!(),
        onTap: onTap,
        enabled: enabled,
        controller: controller,
        onSubmitted: (value) => onSubmit!(),
        focusNode: focusNode,
        inputFormatters: inputFormatters,
        style: const TextStyle(
          color: Colors.black, // Keep the text color black
        ),
        decoration: InputDecoration(
          hintText: hint,
          counterText: "",
          hintStyle: const TextStyle(
            color: AppColors.HINT_TEXT_COLOR,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }*/

  static Widget buildDateField(
    Size size,
    String hint,
    TextEditingController? controller, {
    TextInputType? textInputType = TextInputType.text,
    bool enabled = true,
    var maxLength,
    void Function()? func,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return GestureDetector(
      onTap: () => func!(),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: size.height * .0055),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
        //,vertical: 2
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          /*border: Border.all(
              color: AppColors.STEPPER_DONE_COLOR,
              width: 1,
            ),*/
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.3),
              spreadRadius: 1.2,
              blurRadius: 0.5,
              offset: const Offset(1.0, 1.0),
            ),
          ],
        ),
        child: TextField(
          keyboardType: textInputType,
          maxLength: maxLength,
          controller: controller,
          enabled: false,
          style: const TextStyle(
            color: Colors.black, // Keep the text color black
          ),
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: hint,
            counterText: "",
            suffixIcon: const Icon(
              Icons.date_range,
              color: AppColors.LOGO_BACKGROUND_RED_COLOR,
            ),
            hintStyle: const TextStyle(
              color: AppColors.HINT_TEXT_COLOR,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }


  static Widget buildSearchableField(
    Size size,
    String hint,
    TextEditingController? searchTextController, {
    bool isEnabled = false,
    bool isProductList = true,
    TextEditingController? qtyTextController,
    void Function()? func,
    Color color = AppColors.LOGO_BACKGROUND_RED_COLOR,
    void Function(String sku, String qty)? change, // 👈 changed here
    String? icons = "assets/images/search.svg",
  }) {
    return GestureDetector(
      onTap: () => func?.call(),
      child: Row(
        children: [
          // SKU ID - flex 3
          Expanded(
            flex: 4,
            child: Container(
              height: size.height * 0.05,
              margin: EdgeInsets.symmetric(
                vertical: size.height * .005,
                horizontal: size.width * 0.005,
              ),
              padding: EdgeInsets.only(left: size.width * 0.008),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.3),
                    spreadRadius: 1.2,
                    blurRadius: 0.5,
                    offset: const Offset(1.0, 1.0),
                  ),
                ],
              ),
              child: TextField(
                controller: searchTextController,
                onChanged: (value) {
                  debugPrint("SKU ID ---> $value");
                  change?.call(
                    value,
                    qtyTextController?.text ?? "", // pass both
                  );
                },
                enabled: isEnabled,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: const TextStyle(
                    color: AppColors.HINT_TEXT_COLOR,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          if (isProductList)
            Expanded(
              flex: 2,
              child: Container(
                height: size.height * 0.05,
                margin: EdgeInsets.symmetric(vertical: size.height * .005),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.3),
                      spreadRadius: 1.2,
                      blurRadius: 0.5,
                      offset: const Offset(1.0, 1.0),
                    ),
                  ],
                ),
                child: TextField(
                  controller: qtyTextController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    debugPrint("QTY ---> $value");
                    change?.call(
                      searchTextController?.text ?? "", // pass both
                      value,
                    );
                  },
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Qty.",
                    hintStyle: TextStyle(
                      color: AppColors.HINT_TEXT_COLOR,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

          // Action button
          Container(
            width: size.width * 0.14,
            height: size.height * 0.05,
            margin: EdgeInsets.only(left: 4,),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                icons!,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /*static Widget buildSearchableField(
      Size size, String hint, TextEditingController? searchTextController,
      {bool isEnabled = false,
        bool isProductList = true,
        TextEditingController? qtyTextController,
      void Function()? func,
      Color color = AppColors.LOGO_BACKGROUND_RED_COLOR,
      void Function(String text)? change,
      String? icons = "assets/images/search.svg"}) {
    return GestureDetector(
      onTap: () => func!(),
      child: Row(
        children: [
          // SKU ID - flex 3
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: size.height * .005,
                horizontal: size.width * 0.005,
              ),
              padding: EdgeInsets.only(
                left: size.width * 0.008,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.3),
                    spreadRadius: 1.2,
                    blurRadius: 0.5,
                    offset: const Offset(1.0, 1.0),
                  ),
                ],
              ),
              child: TextField(
                controller: searchTextController,
                onChanged: (value) {
                  debugPrint("SKU ID ---> $value");
                  change?.call(value);
                },
                enabled: isEnabled,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: const TextStyle(
                    color: AppColors.HINT_TEXT_COLOR,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          if (isProductList)
          // Qty - flex 2
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: size.height * .005,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.3),
                      spreadRadius: 1.2,
                      blurRadius: 0.5,
                      offset: const Offset(1.0, 1.0),
                    ),
                  ],
                ),
                child: TextField(
                  controller: qtyTextController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    debugPrint("QTY ---> $value");
                    //qtyChange?.call(value);
                  },
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Qty.",
                    hintStyle: TextStyle(
                      color: AppColors.HINT_TEXT_COLOR,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

          // Action button
          Container(
            width: size.width * 0.14,
            height: size.height * 0.065,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                icons!,
                colorFilter:
                const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),

      */
  /*Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: size.height * .005,
              horizontal: size.width * 0.005,
            ),
            padding: EdgeInsets.only(
              left: size.width * 0.008,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.3),
                  spreadRadius: 1.2,
                  blurRadius: 0.5,
                  offset: const Offset(1.0, 1.0),
                ),
              ],
            ),
            child: Expanded(
              child: TextField(
                controller: searchTextController,
                onChanged: (value) {
                  debugPrint("DATA ---> $value");
                  change?.call(value);
                },
                enabled: isEnabled,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: const TextStyle(
                    color: AppColors.HINT_TEXT_COLOR,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          if (isProductList)
            Container(
              // padding: EdgeInsets.only(left: size.width * 0.01),
              color: Colors.amber,
              margin: EdgeInsets.only(left: size.width * 0.01),
              child: Text(
                "Qty.", // or any label you want
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          Container(
            width: size.width * 0.14,
            height: size.height * 0.065,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                icons!,
                colorFilter:
                const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),*/ /*
      */ /*Container(
        margin: EdgeInsets.symmetric(
          vertical: size.height * .005,
          horizontal: size.width * 0.005,
        ),
        // padding: const EdgeInsets.symmetric(horizontal: 6), //,vertical: 2
        padding: EdgeInsets.only(
          left: size.width * 0.008,
        ), //,left: 6
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.3),
              spreadRadius: 1.2,
              blurRadius: 0.5,
              offset: const Offset(1.0, 1.0),
            ),
          ],
          */ /**/ /*border: Border.all(
              color: AppColors.STEPPER_DONE_COLOR,
              width: 1,
            ),*/ /**/ /*
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: searchTextController,
                onChanged: (value) {
                  debugPrint("DATA--->$value");
                  change!(searchTextController!.text);
                },
                enabled: isEnabled,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                    hintText: hint,
                    // enabled: isEnabled,
                    hintStyle: const TextStyle(
                      color: AppColors.HINT_TEXT_COLOR,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none),
              ),
            ),
            isProductList?TextField(
              controller: searchTextController,
              onChanged: (value) {
                debugPrint("DATA--->$value");
                change!(searchTextController!.text);
              },
              enabled: isEnabled,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                  hintText: hint,
                  // enabled: isEnabled,
                  hintStyle: const TextStyle(
                    color: AppColors.HINT_TEXT_COLOR,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none),
            ):Container(),
            Container(
              width: size.width * 0.14, //45,
              height: size.height * 0.065, //48,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  icons!,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
          ],
        ),
      ),*/ /*
    );
  }*/

  Widget buildStepperContainer(Size size, {required int pageNo}) {
    return Container(
      // color: Colors.green,
      // height: size.height * .06,//.034,
      margin: EdgeInsets.symmetric(horizontal: size.width * .02),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Divider(
                thickness: size.height * .005,
                color: AppColors.LOGO_BACKGROUND_RED_COLOR,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStepperBox(
                    label: "1",
                    text: "Product",
                    isActive: true,
                    color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                    size: size,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Divider(
                thickness: size.height * .005,
                color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                // pageNo == 2 || pageNo == 3
                //     ? AppColors.LOGO_BACKGROUND_RED_COLOR
                //     : AppColors.STEPPER_PENDING_COLOR,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStepperBox(
                  label: "2",
                  text: "Sales Advice",
                  //"New",
                  isActive: pageNo == 2 || pageNo == 3,
                  color: pageNo == 2 || pageNo == 3
                      ? AppColors.LOGO_BACKGROUND_RED_COLOR
                      : AppColors.STEPPER_PENDING_COLOR,
                  size: size,
                ),
              ],
            ),
            Expanded(
              child: Divider(
                thickness: size.height * .005,
                color: pageNo == 2 || pageNo == 3
                    ? AppColors.LOGO_BACKGROUND_RED_COLOR
                    : AppColors.STEPPER_PENDING_COLOR,
              ),
            ),
            /*Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStepperBox(
                    label: "3",
                    text: "Payment Info.",
                    isActive: pageNo == 3,
                    color: pageNo == 3
                        ? AppColors.LOGO_BACKGROUND_RED_COLOR
                        : AppColors.STEPPER_PENDING_COLOR,
                    size: size,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Divider(
                thickness: size.height * .005,
                color: pageNo == 3
                    ? AppColors.LOGO_BACKGROUND_RED_COLOR
                    : AppColors.STEPPER_PENDING_COLOR,
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  Widget buildCustomerTab(
    Size size,
    String icon,
    String title,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height:
            AppDimensions.getResponsiveHeight(navigatorKey.currentContext!) *
            0.12,
        //0.15
        width:
            AppDimensions.getResponsiveWidth(navigatorKey.currentContext!) *
            0.32,
        //0.35
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.3),
              offset: const Offset(0.5, 0.5),
              blurRadius: 1.2,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon Container
              Container(
                height:
                    AppDimensions.getResponsiveHeight(
                      navigatorKey.currentContext!,
                    ) *
                    0.06, //0.08
                width:
                    AppDimensions.getResponsiveWidth(
                      navigatorKey.currentContext!,
                    ) *
                    0.2,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.ICON_BACKGROUND_COLOR,
                ),
                child: Center(child: SvgPicture.asset("assets/images/$icon")),
              ),
              // Title Text
              Container(
                margin: EdgeInsets.only(
                  top:
                      AppDimensions.getResponsiveHeight(
                        navigatorKey.currentContext!,
                      ) *
                      0.01,
                ), //0.02
                child: Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepperBox({
    required String label,
    required String text,
    required bool isActive,
    required Color color,
    required Size size,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: size.height * .034,
          width: size.width * .085,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(color: color, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget buildTextField(
    Size size, {
    required String text,
    required String hintText,
    required String labelText,
    TextInputType? textInputType = TextInputType.text,
    bool enabled = true,
    var maxLength,
    List<TextInputFormatter>? inputFormatters,
    void Function(String? value)? onChange,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.005,
        horizontal: size.width * 0.005,
      ),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(4),
      //   border: Border.all(
      //     color: AppColors.LOGO_BACKGROUND_BLUE_COLOR, width: 1.0
      //   )
      // ),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: const TextStyle(
            fontSize: 14,
            color: AppColors.LOGO_BACKGROUND_RED_COLOR,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(
              color: AppColors.LOGO_BACKGROUND_RED_COLOR,
              width: 1.0,
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.LOGO_BACKGROUND_RED_COLOR,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );

    /*Container(
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.005,
        horizontal: size.width * 0.005,
      ),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          focusColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            // borderSide: BorderSide(
            //   color: AppColors.LOGO_BACKGROUND_BLUE_COLOR
            // )
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: AppColors.LOGO_BACKGROUND_BLUE_COLOR, width: 1.0),
            borderRadius: BorderRadius.circular(4.0),
          ),
          fillColor: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );*/
  }

  Widget buildDropdownField(
    Size size, {
    // required TextEditingController? controller,
    required String hintText,
    required List<String> dropdownItems,
    required String labelText,
    required String? selectedValue,
    required void Function(Object? value)? onChange,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.005,
        horizontal: size.width * 0.005,
      ),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(4),
      //
      //   color: Colors.white,
      //   border: Border.all(
      //     color: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
      //     width: 1.0,
      //   ),
      // ),
      child: Container(
        //padding: const EdgeInsets.symmetric(horizontal: 10),
        height: size.height * 0.06,
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.grey.withValues(alpha:0.5), width: .8),
          borderRadius: BorderRadius.circular(4),
        ),
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(
              color: AppColors.LOGO_BACKGROUND_RED_COLOR,
              fontSize: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: selectedValue, // ?? dropdownItems[0],
              hint: Text(
                dropdownItems[0],
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                ),
              ),
              items: dropdownItems.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  alignment: AlignmentDirectional.centerStart,
                  child: SizedBox(
                    height: size.height * 0.02,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (Object? value) {
                return onChange!(value);
              },
            ),
          ),
        ),
      ),
    );

    /*Container(
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.005,
        horizontal: size.width * 0.005,
      ),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          focusColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            // borderSide: BorderSide(
            //   color: AppColors.LOGO_BACKGROUND_BLUE_COLOR
            // )
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: AppColors.LOGO_BACKGROUND_BLUE_COLOR, width: 1.0),
            borderRadius: BorderRadius.circular(4.0),
          ),
          fillColor: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );*/
  }

  Widget buildTextFormField(
    Size size, {
    required TextEditingController? controller,
    required String hintText,
    required String labelText,
    TextInputType? textInputType = TextInputType.text,
    bool enabled = true,
    var maxLength,
    FocusNode? focusNode,
    List<TextInputFormatter>? inputFormatters,
    void Function(String? value)? onChange,
    void Function()? onTap,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.005,
        horizontal: size.width * 0.005,
      ),
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        onTap: () => onTap!(),
        focusNode: focusNode,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        keyboardType: textInputType,
        onChanged: (value) => onChange!(value),
        style: const TextStyle(
          fontSize: 18,
          color: AppColors.LOGO_BACKGROUND_RED_COLOR,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          focusColor: Colors.white,
          // filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.LOGO_BACKGROUND_RED_COLOR,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          fillColor: AppColors.LOGO_BACKGROUND_RED_COLOR,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.LOGO_BACKGROUND_RED_COLOR,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: AppColors.LOGO_BACKGROUND_RED_COLOR,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ), // Adjust vertical padding here
        ),
      ),
    );

    /*Container(
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.005,
        horizontal: size.width * 0.005,
      ),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          focusColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            // borderSide: BorderSide(
            //   color: AppColors.LOGO_BACKGROUND_BLUE_COLOR
            // )
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: AppColors.LOGO_BACKGROUND_BLUE_COLOR, width: 1.0),
            borderRadius: BorderRadius.circular(4.0),
          ),
          fillColor: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );*/
  }

  /*static String formatIndianNumber(double number) {
    final indianFormat = NumberFormat.decimalPattern('hi_IN'); // Uses Indian Number Format
    return indianFormat.format(number);
  }*/
  static String formatIndianNumber(double number) {
    final indianFormat = NumberFormat(
      "#,##,##0.00",
      "en_IN",
    ); // Uses Indian Number Format
    return indianFormat.format(number);
  }

  /*void _logout() async{
    await SharedPreferencesHelper.init();
    final logoutRepo = LogoutRepo();
    logoutRepo.logout().then((value) async {
      SharedPreferencesHelper.clear();
      Navigator.pushReplacement(navigatorKey.currentContext!, MaterialPageRoute(builder: (context) => const UrlVerificationScreen(),));
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        const SnackBar(
          content: Text("Logout Successful"),
        ),
      );
    }).onError((error, stackTrace) {
      debugPrint("Getting some errors : $error");
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        const SnackBar(
          content: Text("Getting some Error "),
        ),
      );
    });
  }*/
}
