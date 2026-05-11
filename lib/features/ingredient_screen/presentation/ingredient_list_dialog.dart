import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/api_status.dart';
import '../../../core/constants/app_colors.dart';
import '../../estimation_screen/presentation/bloc/estimation_bloc.dart';

class IngredientListDialog extends StatefulWidget {
  final int parentIndex;
  const IngredientListDialog({super.key, required this.parentIndex});

  @override
  State<IngredientListDialog> createState() => _IngredientListDialogState();
}

class _IngredientListDialogState extends State<IngredientListDialog> {

  @override
  void initState() {
    super.initState();
    // context.read<EstimationBloc>().add(ApiStatusChangeEvent());
    context.read<EstimationBloc>().add(const FetchIngredientEvent());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      insetPadding: EdgeInsets.symmetric(
          horizontal: size.width * 0.02, vertical: size.height * 0.1),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
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
                      const Expanded(
                        child: Center(
                          child: Text(
                            "Product Search",
                            style: TextStyle(
                              color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
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
                              color: Colors.white),
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
                  Gap(size.height * 0.04),
                  BlocConsumer<EstimationBloc, EstimationState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      //debugPrint("Size--->${state.selectedProductList!.length}");
                      switch (state.apiStatus) {
                        case ApiStatus.loading:
                          return Center(
                            child: SizedBox(
                              height: size.height * 0.03,
                              width: size.width * 0.06,
                              child: Platform.isAndroid
                                  ? const CircularProgressIndicator(
                                color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                              )
                                  : const CupertinoActivityIndicator(),
                            ),
                          );
                        case ApiStatus.success:
                          return Expanded(
                            child: ListView.builder(
                              // shrinkWrap:true,
                              itemBuilder: (context, index) {
                                return _buildContainer(
                                  index,
                                  size,
                                  state,
                                      () {
                                    context
                                        .read<EstimationBloc>()
                                        .add(SelectIngredientProdEvent(index,widget.parentIndex));
                                        Navigator.of(context).pop();
                                        /*if(state.ingredientList![index].inventdimCodeObj!.purity == true){
                                          showDialog(context: context, builder: (context) => PurityMasterDialog(index: index, parentIndex: widget.parentIndex,),);
                                        }else if(state.ingredientList![index].inventdimCodeObj!.size == true){
                                          showDialog(context: context, builder: (context) => SizeMasterDialog(index: index, parentIndex: widget.parentIndex,),);
                                        }else if(state.ingredientList![index].inventdimCodeObj!.style == true){
                                          showDialog(context: context, builder: (context) => StyleMasterDialog(index: index, parentIndex: widget.parentIndex,),);
                                        }else if(state.ingredientList![index].inventdimCodeObj!.cut == true){
                                          showDialog(context: context, builder: (context) => CutMasterDialog(index: index, parentIndex: widget.parentIndex,),);
                                        }else if(state.ingredientList![index].inventdimCodeObj!.colour == true){
                                          showDialog(context: context, builder: (context) => ColourMasterDialog(index: index, parentIndex: widget.parentIndex,),);
                                        }else if(state.ingredientList![index].inventdimCodeObj!.batchNo == true){
                                          showDialog(context: context, builder: (context) => BatchMasterDialog(index: index, parentIndex: widget.parentIndex,),);
                                        }*/
                                        //showDialog(context: context, builder: (context) => const BatchMasterDialog(),);
                                        //Navigator.pop(context);;
                                  },
                                );
                              },
                              itemCount: state.ingredientList!.length,
                            ),
                          );
                        default:
                          return const SizedBox();
                      }
                    },
                  ),
                  Gap(size.height * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(
      int index, Size size, EstimationState state, void Function() func) {
    return GestureDetector(
      onTap: () => func(),
      child: Container(
        height: size.height * 0.08,
        margin: EdgeInsets.symmetric(vertical: size.height * 0.005),
        decoration: BoxDecoration(
          color: index % 2 == 0
              ? AppColors.CONTAINER_BACKGROUND_COLOR_01
              : AppColors.ICON_BACKGROUND_COLOR,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: Text(
                      "${state.ingredientList![index].prodCode}",
                      style: const TextStyle(
                          color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: Text(
                      "${state.ingredientList![index].prodName}",
                      style: const TextStyle(
                          color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
