import 'package:flutter/material.dart';

import 'mobile_ui/mobile_estimation.dart';

class EstimationScreen extends StatelessWidget {
  const EstimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          debugPrint("MAX_WIDTH--->${constraints.maxWidth}");
          if(constraints.maxWidth <= 800){
            return const MobileEstimation();
          }else{
            //return const TabEstimation();
            return MobileEstimation();
          }
        },),
      ),
    );
  }
}
