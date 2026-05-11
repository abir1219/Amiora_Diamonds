import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/api_status.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../../../../router/app_pages.dart';
import '../bloc/update_password_bloc.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _userNameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _cnfrmPasswordFocusNode = FocusNode();

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if(didPop) {
          return;
        }
        context.go(AppPages.LOGIN);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocConsumer<UpdatePasswordBloc, UpdatePasswordState>(
            listenWhen: (previous, current) =>
                /*current.apiStatus == ApiStatus.loading ||*/ current.apiStatus ==
                    ApiStatus.success ||
                current.apiStatus == ApiStatus.error,
            //current is UrlLoadedState || current is UrlErrorState,
            // buildWhen: (previous, current) =>
            // current.apiStatus == ApiStatus.loading ||current.apiStatus == ApiStatus.initial || current.apiStatus == ApiStatus.error || current.apiStatus == ApiStatus.success,
            listener: (context, state) {
              if (state.apiStatus == ApiStatus.error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message!)),
                );
              } else if (state.apiStatus == ApiStatus.success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message!)),
                );
                context.go(AppPages.LOGIN);
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                controller: _scrollController,
                child: Container(
                  color: AppColors.APP_BACKGROUND_COLOR, //Colors.red,
                  height: size.height,
                  child: Stack(
                    children: [
                      AppWidgets().buildTopContainer(size),
                      Positioned(
                        top: AppDimensions.getResponsiveHeight(context) * 0.32,
                        //300,
                        left: 0,
                        // Add a position for clarity
                        child: SizedBox(
                          // color: Colors.green,
                          width: size.width, // Example width
                          // height: size.height,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  AppDimensions.getResponsiveWidth(context) *
                                      0.05,
                            ),
                            child: Container(
                              height: AppDimensions.getResponsiveHeight(context) *
                                  0.45, //0.4,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withValues(alpha: 0.3),
                                    offset: const Offset(0.5, 0.5),
                                    blurRadius: 1.3,
                                    spreadRadius: 1.2,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      AppDimensions.getResponsiveWidth(context) *
                                          0.05,
                                ),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Container(
                                    //   margin: EdgeInsets.symmetric(
                                    //     vertical: AppDimensions.getResponsiveHeight(context) * 0.005,
                                    //     horizontal: AppDimensions.getResponsiveWidth(context) * 0.005,
                                    //   ),
                                    //   child:
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: AppDimensions.getResponsiveHeight(
                                                context) *
                                            0.04,
                                        bottom: AppDimensions.getResponsiveHeight(
                                                context) *
                                            0.001,
                                      ),
                                      child: Text(
                                        "Update Password",
                                        style: TextStyle(
                                          color: AppColors
                                              .LOGO_BACKGROUND_RED_COLOR,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Gap(AppDimensions.getResponsiveHeight(
                                            context) *
                                        0.03),
                                    TextFormField(
                                      controller: _usernameController,
                                      textCapitalization: TextCapitalization.characters,
                                      focusNode: _userNameFocusNode,
                                      onTap: () {
                                        _scrollToFocusedTextField(
                                            _userNameFocusNode);
                                      },
                                      //keyboardType: TextInputType.emailAddress,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: AppColors.STEPPER_DONE_COLOR,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      decoration: InputDecoration(
                                        focusColor: Colors.white,
                                        /*prefixIcon: Icon(
                                          Icons.person,
                                          color: Colors.grey,
                                        ),*/
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            // Default border color
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            // Default border color when enabled
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            // Border color when focused
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        hintText: "Enter username",
                                        hintStyle: const TextStyle(
                                          color: AppColors.STEPPER_DONE_COLOR,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        labelText: "Enter username",
                                        labelStyle: const TextStyle(
                                          color: Colors.grey,
                                          //AppColors.STEPPER_DONE_COLOR,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10.0, horizontal: 10.0),
                                      ),
                                    ),
                                    Gap(
                                      AppDimensions.getResponsiveHeight(context) *
                                          0.01,
                                    ),
                                    TextFormField(
                                      controller: _passwordController,
                                      focusNode: _passwordFocusNode,
                                      onTap: () {
                                        _scrollToFocusedTextField(
                                            _passwordFocusNode);
                                      },
                                      // keyboardType: TextInputType.visiblePassword,
                                      obscureText: !state.isPwVisible!,
                                      //!_isVisibility,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: AppColors.STEPPER_DONE_COLOR,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      decoration: InputDecoration(
                                        focusColor: Colors.white,
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            // Default border color
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            context.read<UpdatePasswordBloc>().add(PasswordVisibilityChangeEvent());
                                          },
                                          icon: Icon(
                                            !state.isPwVisible!
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: AppColors
                                                .LOGO_BACKGROUND_RED_COLOR,
                                          ),
                                        ),
                                        //const Icon(Icons.visibility),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            // Default border color when enabled
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            // Border color when focused
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        hintText: "Enter your password",
                                        hintStyle: const TextStyle(
                                          color: AppColors.STEPPER_DONE_COLOR,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        labelText: "Enter your password",
                                        labelStyle: const TextStyle(
                                          color: Colors.grey,
                                          //AppColors.STEPPER_DONE_COLOR,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10.0, horizontal: 10.0),
                                      ),
                                    ),
                                    Gap(
                                      AppDimensions.getResponsiveHeight(context) *
                                          0.01,
                                    ),
                                    TextFormField(
                                      controller: _confirmPasswordController,
                                      focusNode: _cnfrmPasswordFocusNode,
                                      onTap: () {
                                        _scrollToFocusedTextField(
                                            _cnfrmPasswordFocusNode);
                                      },
                                      // keyboardType: TextInputType.visiblePassword,
                                      obscureText: !state.isCnPwVisible!,
                                      //!_isVisibility,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: AppColors.STEPPER_DONE_COLOR,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      decoration: InputDecoration(
                                        focusColor: Colors.white,
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            // Default border color
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            // setState(() {
                                            //   _isVisibility = !_isVisibility;
                                            // });
                                            context.read<UpdatePasswordBloc>().add(
                                                ConfirmPasswordVisibilityChangeEvent());
                                          },
                                          icon: Icon(
                                            !state.isCnPwVisible!
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: AppColors
                                                .LOGO_BACKGROUND_RED_COLOR,
                                          ),
                                        ),
                                        //const Icon(Icons.visibility),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            // Default border color when enabled
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            // Border color when focused
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        hintText: "Confirm password",
                                        hintStyle: const TextStyle(
                                          color: AppColors.STEPPER_DONE_COLOR,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        labelText: "Confirm password",
                                        labelStyle: const TextStyle(
                                          color: Colors.grey,
                                          //AppColors.STEPPER_DONE_COLOR,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10.0, horizontal: 10.0),
                                      ),
                                    ),
                                    // ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.getResponsiveHeight(
                                                  context) *
                                              .02),
                                      width: AppDimensions.getResponsiveWidth(
                                              context) *
                                          .6,
                                      child: AppWidgets.customMobileButton(
                                        size: size,
                                        isLoading:
                                            state.apiStatus == ApiStatus.loading
                                                ? true
                                                : false,
                                        btnName: "Update",
                                        color:
                                            AppColors.LOGO_BACKGROUND_RED_COLOR,
                                        textColor: Colors.white,
                                        func: () {
                                          if (_usernameController.text.isEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content:
                                                      Text("Enter Username")),
                                            );
                                          } else if (_passwordController
                                              .text.isEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content:
                                                      Text("Enter Password")),
                                            );
                                          } else if (_confirmPasswordController
                                              .text.isEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      "Enter Confirm Password")),
                                            );
                                          } else if (_passwordController.text
                                                  .trim() !=
                                              _confirmPasswordController.text
                                                  .trim()) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content:
                                                      Text("Password Mismatch")),
                                            );
                                          } else {
                                            context
                                                .read<UpdatePasswordBloc>()
                                                .add(UpdatePassword(
                                                    username: _usernameController
                                                        .text
                                                        .trim()
                                                        .toString(),
                                                    password: _passwordController
                                                        .text
                                                        .trim()
                                                        .toString()));
                                          }
                                        },
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: ()=> context.go(AppPages.LOGIN),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                          vertical: size.height * 0.01,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Back to login",
                                            style: TextStyle(
                                              color: AppColors
                                                  .LOGO_BACKGROUND_RED_COLOR,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              decoration: TextDecoration.underline,
                                              decorationColor: AppColors
                                                  .LOGO_BACKGROUND_RED_COLOR,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ), // Example height
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _scrollToFocusedTextField(FocusNode focusNode) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.pixels + 50,
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 300),
      );
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
