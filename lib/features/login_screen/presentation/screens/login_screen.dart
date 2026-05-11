import 'package:flutter/material.dart';

import 'mobile_ui/mobile_login_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        if(constraints.maxWidth <= 600){
          return const MobileLoginScreen();
        }else{
          return Container();//TabLoginScreen();
        }
      },),
    );
  }
}
