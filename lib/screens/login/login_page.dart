import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../services/login_service.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text.dart';
import '../../widgets/app_text_field.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    color: AppColors.primaryColor,
                    onPressed: () {
                      // BACK BUTTON FUNCTION
                    },
                  ),
                  SizedBox(height: 12.h),
                  appText(
                    AppStrings.login_title,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                    fontSize: 28.sp,
                    fontFamily: "Poppins",
                  ),

                  SizedBox(height: 6.h),
                  appText(
                    AppStrings.login_note,

                    color: AppColors.textBlack,
                    fontSize: 14.sp,
                  ),

                  SizedBox(height: 28.h),

                  appTextField(
                    controller: loginController.passController,

                    hintText: "eg. Admin@1234",
                    hintColor: AppColors.black,
                    hintSize: 12.sp,
                    validator: (value) {
                      return LoginService.emailValidation(email: value!);
                    },
                  ),

                  SizedBox(height: 15.h),

                  appTextField(
                    controller: loginController.passController,
                    suffixWidget: Icon(
                      Icons.visibility_rounded,
                      color: AppColors.black,
                    ),

                    hintText: "eg. Admin82200",
                    hintColor: AppColors.black,
                    hintSize: 12.sp,
                    validator: (value) {
                      return LoginService.passValidation(pass: value!);
                    },
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: appText(
                        AppStrings.Forgot_password,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),

                  appButton(
                    onTap: () {
                      log("loginbutton");
                      //  LOGIN BUTTON FUNCTION
                    },
                    buttonColor: AppColors.primaryColor,
                    buttonText: AppStrings.login,
                    textColor: AppColors.white,
                    height: 40.h,
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
