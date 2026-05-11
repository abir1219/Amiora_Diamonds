import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/widgets/app_widgets.dart';


class MobileViewCustomer extends StatefulWidget {
  const MobileViewCustomer({super.key});

  @override
  State<MobileViewCustomer> createState() => _MobileViewCustomerState();
}

class _MobileViewCustomerState extends State<MobileViewCustomer> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            child: Column(
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
                    const Text("View Customer",style: TextStyle(color: AppColors.LOGO_BACKGROUND_RED_COLOR,fontWeight: FontWeight.w600,fontSize: 16),),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white
                          ),
                          child: SvgPicture.asset("assets/images/circle_close.svg",colorFilter: const ColorFilter.mode(AppColors.LOGO_BACKGROUND_RED_COLOR, BlendMode.srcIn),),
                        )
                    ),
                  ],
                ),
                Gap(size.height * 0.05),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        AppWidgets.buildField(size, "Customer Name", null),
                        AppWidgets.buildSearchableField(size, "Customer Group", null,),
                        AppWidgets.buildField(size, "Mobile Number", null,textInputType: TextInputType.phone,maxLength: 10,inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
                        AppWidgets.buildField(size, "Email Id", null),
                        AppWidgets.buildField(size, "Date of Birth", null),
                        AppWidgets.buildField(size, "PAN No", null),
                        AppWidgets.buildField(size, "Marriage Anniversary", null),
                        AppWidgets.buildField(size, "Aadhar Number", null,maxLength: 16,inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
                        AppWidgets.buildField(size, "Pincode", null,textInputType: TextInputType.phone,maxLength: 6,inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
                        AppWidgets.buildSearchableField(size, "Address Id", null),
                        AppWidgets.buildSearchableField(size, "Country", null),
                        AppWidgets.buildSearchableField(size, "State", null),
                        AppWidgets.buildField(size, "Credit Limit", null),
                      ],
                    ),
                  ),
                ),
                Gap(size.height * .01),
                Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: size.height * .02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      /*AppWidgets.customButton(
                          size: size,
                          btnName: 'Reset',
                          color: AppColors.HINT_TEXT_COLOR),*/
                      Expanded(
                        child: AppWidgets.customMobileButton(
                            size: size,
                            btnName: 'Edit',
                            color: AppColors.LOGO_BACKGROUND_RED_COLOR,),
                      ),
                      Expanded(
                        child: AppWidgets.customMobileButton(
                            size: size,
                            btnName: 'Ok',
                            func: () => Navigator.pop(context),
                            color: AppColors.LOGO_BACKGROUND_RED_COLOR,),
                      ),
                    ],
                  ),
                ),
                Gap(size.height * 0.02)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
