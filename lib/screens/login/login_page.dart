import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:saoirse_app/constants/app_colors.dart';
import 'package:saoirse_app/constants/app_strings.dart';
import 'package:saoirse_app/screens/login/login_controller.dart';
import 'package:saoirse_app/services/login_service.dart';
import 'package:saoirse_app/widgets/app_button.dart';
import 'package:saoirse_app/widgets/app_text.dart';
import 'package:saoirse_app/widgets/app_text_field.dart';

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
                  appText(
                    "Referrel code",
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                    fontSize: 15.sp,
                    fontFamily: "Poppins",
                  ),

                  appTextField(
                    controller: loginController.passController,
                    prefixWidth: 20.w,
                    hintText: "Referrel code",
                    hintColor: AppColors.black,
                    hintSize: 15.sp,
                    validator: (value) {
                      return LoginService.emailValidation(email: value!);
                    },
                  ),

                  SizedBox(height: 15.h),
                  appText(
                    "Username",
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                    fontSize: 15.sp,
                    fontFamily: "Poppins",
                  ),

                  appTextField(
                    controller: loginController.passController,
                    suffixWidget: Icon(
                      Icons.visibility_rounded,
                      color: AppColors.black,
                    ),
                    prefixWidth: 20.w,

                    hintText: "Username",

                    hintColor: AppColors.black,
                    hintSize: 15.sp,
                    validator: (value) {
                      return LoginService.passValidation(pass: value!);
                    },
                  ),
                  SizedBox(height: 15.h),
                  appText(
                    "Phone Number",
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                    fontSize: 15.sp,
                    fontFamily: "Poppins",
                  ),
                  appTextField(
                    controller: loginController.passController,
                    prefixWidth: 20.w,
                    hintText: "Phone Number",
                    hintColor: AppColors.black,
                    hintSize: 15.sp,
                    validator: (value) {
                      return LoginService.emailValidation(email: value!);
                    },
                  ),

                  SizedBox(height: 15.h),

                  Center(
                    child: appButton(
                      onTap: () {
                        log("loginbutton");
                        // SENT OTP BUTTON FUNCTION
                      },
                      buttonColor: AppColors.primaryColor,
                      buttonText: AppStrings.send_otp,
                      textColor: AppColors.white,
                      height: 40.h,
                      width: 150.w,
                    ),
                  ),
                  SizedBox(height: 15.h),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1.h,
                          width: 20.w,
                          color: AppColors.grey,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      appText(
                        "or",

                        color: AppColors.black,
                        fontSize: 15.sp,
                        fontFamily: "Poppins",
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Container(
                          height: 1.h,
                          width: 20.w,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),

                  Center(
                    child: appButton(
                      onTap: () {
                        log("loginbutton");
                        // SENT OTP BUTTON FUNCTION
                      },

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/google_icon.webp",
                            height: 20.h,
                            width: 20.w,
                          ),
                          SizedBox(width: 10.w),
                          appText(
                            "Login with Google",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                      buttonColor: AppColors.white,
                      // buttonText: "Login with Google",
                      // textColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                      borderWidth: 2,
                      width: 200.w,
                      height: 40.h,
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
