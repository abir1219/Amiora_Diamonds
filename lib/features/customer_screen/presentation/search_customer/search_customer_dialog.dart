import 'package:flutter/material.dart';

import 'mobile_ui/mobile_search_customer.dart';

class SearchCustomerDialog extends StatefulWidget {
  const SearchCustomerDialog({super.key});

  @override
  State<SearchCustomerDialog> createState() => _SearchCustomerDialogState();
}

class _SearchCustomerDialogState extends State<SearchCustomerDialog> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.sizeOf(context);

    return PopScope(
      canPop: true,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: size.width * 0.02,vertical: size.height * 0.1),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: Colors.white,
        child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          if(constraints.maxWidth < 600){
            return const MobileSearchCustomer();
          }else{
            return Container();//const TabSearchCustomer();
          }
        },),
      ),
    );
  }
}
