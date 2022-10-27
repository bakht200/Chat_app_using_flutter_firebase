import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maahey_flutter_task/constants/app_theme.dart';
import 'package:maahey_flutter_task/view/login_screen.dart';
import 'package:maahey_flutter_task/view/widget/text_field_widget.dart';

import '../constants/app_assets.dart';
import '../controller/auth_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formGlobalKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          return currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppTheme.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(12.0.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      ImageAssets.logoImage,
                      height: 200.h,
                      width: 220.w,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LoginStrings.appTitle,
                        style: AppTheme.loginTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Form(
                    key: formGlobalKey,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              LoginStrings.signupButtonText,
                              style: AppTheme.loginTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        TextFormFieldWidget(
                            obsecure: false,
                            iconData: Icon(
                              Icons.person_outline,
                              color: AppTheme.primaryColor,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textFieldController: _emailController,
                            labelText: LoginStrings.emailHint,
                            validator: (val) {
                              if (val.isEmpty) {
                                return LoginStrings.emailEmptyValidationText;
                              } else if (LoginStrings.regexEmailValidation
                                      .hasMatch(val) ==
                                  false) {
                                return LoginStrings.emailValidationText;
                              } else if (!EmailValidator.validate(val)) {
                                return LoginStrings.emailValidationText;
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 30.h,
                        ),
                        TextFormFieldWidget(
                            obsecure: true,
                            iconData: Icon(
                              Icons.lock_outline,
                              color: AppTheme.primaryColor,
                            ),
                            keyboardType: TextInputType.text,
                            textFieldController: _passwordController,
                            labelText: LoginStrings.passwordHint,
                            validator: (val) {
                              if (val.isEmpty) {
                                return LoginStrings.passwordEmptyValidationText;
                              } else if (val.length < 8) {
                                return LoginStrings.passwordValidationText;
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 30.h,
                        ),
                        TextFormFieldWidget(
                            obsecure: false,
                            iconData: Icon(
                              Icons.person,
                              color: AppTheme.primaryColor,
                            ),
                            keyboardType: TextInputType.text,
                            textFieldController: _confirmPasswordController,
                            labelText: 'Enter unique username',
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Please enter userName';
                              }

                              return null;
                            }),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              LoginStrings.forgetPasswordText,
                              style: AppTheme.forgetPasswordTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SizedBox(
                          height: 50.h,
                          width: width,
                          child: ElevatedButton(
                            style: AppTheme.themeFilledButtonStyle,
                            onPressed: () {
                              if (formGlobalKey.currentState!.validate()) {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (_) {
                                      return Dialog(
                                        backgroundColor: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: const [
                                              CircularProgressIndicator(),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text('Loading...')
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                                authController.signUp(
                                    _emailController.text.trim(),
                                    _passwordController.text.trim(),
                                    _confirmPasswordController.text.trim(),
                                    context);
                              } else {
                                print("Invalidation");
                              }
                            },
                            child: Text(LoginStrings.signupButtonText,
                                style: AppTheme.themeFilledButtonTextStyle),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (builder) => LoginScreen()));
                          },
                          child: Text(
                            LoginStrings.alreadyHaveAnAccount,
                            style: AppTheme.forgetPasswordTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
