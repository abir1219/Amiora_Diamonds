import '../../../../features/customer_screen/presentation/add_customer/tab_ui/tab_add_customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../estimation_screen/presentation/bloc/estimation_bloc.dart';
import 'mobile_ui/mobile_add_customer.dart';

class AddCustomerDialog extends StatelessWidget {
  const AddCustomerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return PopScope(
      // onPopInvokedWithResult: (didPop, result) {
      //   context.read<EstimationBloc>().add(ApiStatusChangeEvent());
      // },
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        context.read<EstimationBloc>().add(ApiStatusChangeEvent());
      },
      canPop: false,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        insetPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.02, vertical: size.height * 0.1),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: Colors.white,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 600) {
              return const MobileAddCustomer();
            } else {
              return const TabAddCustomer();
            }
          },
        ),
      ),
    );
  }
}
