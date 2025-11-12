import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/constants/app_colors.dart';
import '/widgets/app_button.dart';
import '/widgets/app_text.dart';

class Pendingtrancation extends StatefulWidget {
  const Pendingtrancation({super.key});

  @override
  State<Pendingtrancation> createState() => _PendingtrancationState();
}

class _PendingtrancationState extends State<Pendingtrancation> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    final List<Map<String, dynamic>> transactions = [
      {
        "title": "Mitzie organic",
        "subtitle": "Red | 1TB",
        "price": 999,
        "image":
            "https://images.unsplash.com/photo-1549049950-48d5887197a0?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHByb2R1Y3R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=600",
      },
      {
        "title": "Boat wear",
        "subtitle": "Red | 1TB",
        "price": 100,
        "image":
            "https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=600",
      },
      {
        "title": "GUCCI",
        "subtitle": "Red | 1TB",
        "price": 566,
        "image":
            'https://plus.unsplash.com/premium_photo-1664392147011-2a720f214e01?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=600',
      },
      {
        "title": "Sony camera",
        "subtitle": "Gray | 512GB",
        "price": 15000,
        "image":
            'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=600',
      },
    ];
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.white,
            size: 30.sp,
          ),
          onTap: () {
            //BACK BUTTON FUNCTION
          },
        ),
        title: appText(
          "Pending Transaction",
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
          fontFamily: "poppins",
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 8.h),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final item = transactions[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8.h),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.grey,
                          blurRadius: 8.r,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 6.w),
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.r),
                            bottomLeft: Radius.circular(8.r),
                            bottomRight: Radius.circular(8.r),
                            topRight: Radius.circular(8.r),
                          ),
                          child: Image.network(
                            item["image"],
                            width: 80.w,
                            height: 70.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 10.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                appText(
                                  item["title"],
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                  fontFamily: "poppins",
                                ),
                                SizedBox(height: 2.h),
                                appText(
                                  item["subtitle"],
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.grey,
                                  fontFamily: "poppins",
                                ),
                                SizedBox(height: 6.h),
                                Row(
                                  children: [
                                    GestureDetector(
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10.w,
                                            vertical: 4.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(6.r),
                                          ),
                                          child: appText(
                                            "Pay Now",
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.white,
                                            fontFamily: "poppins",
                                          )),
                                      onTap: () {
                                        //
                                        // PAY NOW BUTTON FUNCTION

                                        //
                                      },
                                    ),
                                    SizedBox(width: 10.w),
                                    appText(
                                      "₹${item['price']}",
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                      fontFamily: "poppins",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: Icon(
                            selectedIndex == index
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey,
                  blurRadius: 6.r,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appText(
                      "Total Amount",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                      fontFamily: "poppins",
                    ),
                    appText(
                      "₹${transactions[selectedIndex]['price']}",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                      fontFamily: "poppins",
                    ),
                  ],
                ),
                appButton(
                  onTap: () {
                    //
                    // PAY NOW BUTTON FUNCTION
                    //
                  },
                  child: Center(
                    child: appText(
                      "Pay Now",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                      fontFamily: "poppins",
                    ),
                  ),
                  borderWidth: 1.w,
                  width: 120.w,
                  height: 40.h,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  borderColor: AppColors.primaryColor,
                  buttonColor: AppColors.mediumAmber,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
