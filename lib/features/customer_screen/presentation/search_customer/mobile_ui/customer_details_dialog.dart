import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constants/app_colors.dart';

class CustomerDetailsDialog extends StatefulWidget {
  const CustomerDetailsDialog({super.key});

  @override
  State<CustomerDetailsDialog> createState() => _CustomerDetailsDialogState();
}

class _CustomerDetailsDialogState extends State<CustomerDetailsDialog> {
  
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
                  /*GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.STEPPER_DONE_COLOR,
                      ),
                    ),*/
                  const Expanded(child: Center(child: Text("Customer Details",style: TextStyle(color: AppColors.LOGO_BACKGROUND_RED_COLOR,fontWeight: FontWeight.w600,fontSize: 18),),),),
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
              Gap(size.height * 0.02),
            ],
          ),
          ),
        ),
      ),
    );
  }
}
