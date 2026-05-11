import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/api_status.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../router/app_pages.dart';
import '../../../../../core/widgets/app_widgets.dart';
import '../../../../product_screen/presentation/mobile_ui/product_list_dialog.dart';
import '../../../bloc/login_bloc.dart';

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({super.key});

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _userNameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  final ScrollController _scrollController = ScrollController();

  // bool _isVisibility = false;



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<LoginBloc, LoginState>(
          listenWhen: (previous, current) =>
              /*current.apiStatus == ApiStatus.loading ||*/ current.apiStatus ==
                  ApiStatus.success ||
              current.apiStatus == ApiStatus.error,
          //current is UrlLoadedState || current is UrlErrorState,
          buildWhen: (previous, current) =>
              current.apiStatus != ApiStatus.error,
          listener: (context, state) {
            if (state.apiStatus == ApiStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message!)),
              );
            } else if (state.apiStatus == ApiStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message!)),
              );
              context.go(
                // AppPages.LEGAL_ENTITY,
                AppPages.SEARCH_PRODUCT,
                extra: state.loginModel,
              );
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
                                      0.05),
                          child: Container(
                            height: AppDimensions.getResponsiveHeight(context) *
                                0.42, //0.4,
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
                                      "WELCOME",
                                      style: TextStyle(
                                        color: AppColors
                                            .LOGO_BACKGROUND_RED_COLOR,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: AppDimensions.getResponsiveHeight(
                                              context) *
                                          0.01,
                                      bottom: AppDimensions.getResponsiveHeight(
                                              context) *
                                          0.05,
                                    ),
                                    child: Text(
                                      "Please login to continue...",
                                      style: TextStyle(
                                        color: AppColors
                                            .LOGO_BACKGROUND_RED_COLOR,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
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
                                  Gap(AppDimensions.getResponsiveHeight(
                                          context) *
                                      0.01),
                                  TextFormField(
                                    controller: _passwordController,
                                    focusNode: _passwordFocusNode,
                                    onTap: () {
                                      _scrollToFocusedTextField(
                                          _passwordFocusNode);
                                    },
                                    // keyboardType: TextInputType.visiblePassword,
                                    obscureText: state.isVisible,
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
                                          context.read<LoginBloc>().add(
                                              PasswordVisibilityChangeEvent());
                                        },
                                        icon: Icon(
                                          !state.isVisible
                                              ? Icons.visibility_off
                                              : Icons.visibility,
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
                                      btnName: "Login",
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
                                        } else {
                                          context.read<LoginBloc>().add(
                                              SubmitLogin(
                                                  username:
                                                      _usernameController
                                                          .text
                                                          .trim()
                                                          .toString(),
                                                  password: _passwordController
                                                      .text
                                                      .trim()
                                                      .toString(),),);
                                        }
                                      },
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: ()=> context.go(AppPages.UPDATE_PASSWORD),
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: size.height * 0.01,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Update password",
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
            /*Stack(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Positioned.fill(
                    child: AppWidgets().buildTopContainer(size)),
                // Spacer to push the rest of the content to the center
                //const Spacer(),
                // Main Content
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          AppDimensions.getResponsiveWidth(context) * 0.05),
                  child: Container(
                    height: AppDimensions.getResponsiveHeight(context) * 0.4,
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
                            AppDimensions.getResponsiveWidth(context) * 0.05,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Container(
                          //   margin: EdgeInsets.symmetric(
                          //     vertical: AppDimensions.getResponsiveHeight(context) * 0.005,
                          //     horizontal: AppDimensions.getResponsiveWidth(context) * 0.005,
                          //   ),
                          //   child:
                          TextFormField(
                            controller: _usernameController,
                            focusNode: _userNameFocusNode,
                            //keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.STEPPER_DONE_COLOR,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              focusColor: Colors.white,
                              prefixIcon: Icon(Icons.person,color: Colors.grey,),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  // Default border color
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  // Default border color when enabled
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  // Border color when focused
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              hintText: "Enter username",
                              hintStyle: const TextStyle(
                                color: AppColors.STEPPER_DONE_COLOR,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                              labelText: "Enter username",
                              labelStyle: const TextStyle(
                                color: Colors.grey,//AppColors.STEPPER_DONE_COLOR,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                            ),
                          ),
                          Gap(AppDimensions.getResponsiveHeight(context) *
                              0.01),
                          TextFormField(
                            controller: _passwordController,
                            focusNode: _passwordFocusNode,
                            // keyboardType: TextInputType.visiblePassword,
                            obscureText: !state.isVisible!,
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
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  // setState(() {
                                  //   _isVisibility = !_isVisibility;
                                  // });
                                  context
                                      .read<LoginBloc>()
                                      .add(PasswordVisibilityChangeEvent());
                                },
                                icon: Icon(
                                  !state.isVisible!
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
                                ),
                              ),
                              //const Icon(Icons.visibility),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  // Default border color when enabled
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  // Border color when focused
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              hintText: "Enter your password",
                              hintStyle: const TextStyle(
                                color: AppColors.STEPPER_DONE_COLOR,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                              labelText: "Enter your password",
                              labelStyle: const TextStyle(
                                color: AppColors.STEPPER_DONE_COLOR,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                            ),
                          ),
                          // ),
                          Container(
                            margin: EdgeInsets.only(
                                top: AppDimensions.getResponsiveHeight(
                                        context) *
                                    .02),
                            width: AppDimensions.getResponsiveWidth(context) *
                                .6,
                            child: AppWidgets.customMobileButton(
                              size: size,
                              isLoading: state.apiStatus == ApiStatus.loading
                                  ? true
                                  : false,
                              btnName: "Login",
                              color: AppColors.LOGO_BACKGROUND_GREEN_COLOR,
                              textColor: Colors.white,
                              func: () {
                                if (_usernameController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Enter Username")),
                                  );
                                } else if (_passwordController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Enter Password")),
                                  );
                                } else {
                                  */
            /*context.read<LoginBloc>().add(SubmitLogin(
                                      username: _usernameController.text
                                          .trim()
                                          .toString(),
                                      password: _passwordController.text
                                          .trim()
                                          .toString()));*/
            /*
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Spacer to center the content
                // const Spacer(),
              ],
            );*/
          },
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
    _userNameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
