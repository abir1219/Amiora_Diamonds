import 'package:flutter/material.dart';
import '../../login_screen/data/model/login_model.dart';
import 'mobile_ui/mobile_legal_entity.dart';

class LegalEntityScreen extends StatelessWidget {
  final LoginModel? loginModel;
  const LegalEntityScreen({super.key, this.loginModel});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        if(constraints.maxWidth <= 600){
          return MobileLegalEntity(loginModel: loginModel,);
        }else{
          return Container();//TabLegalEntity(loginModel: loginModel,);
        }
      },),
    );
  }
}
