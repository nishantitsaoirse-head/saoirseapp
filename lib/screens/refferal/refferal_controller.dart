import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:saoirse_app/models/dashboard_model.dart';
import 'package:saoirse_app/services/refferal_service.dart';
import 'package:saoirse_app/widgets/app_snackbar.dart';

class ReferralController extends GetxController {
  final ReferralService _referralService = ReferralService();
  

  final referralCode = ''.obs;
  final isLoading = false.obs;
  final isDashboardLoading = false.obs;

  final referrals = <Referral>[].obs;
  final filteredReferrals = <Referral>[].obs;

  final walletBalance = 0.0.obs;
  final totalEarnings = 0.0.obs;
  final totalReferrals = 0.obs;
  final activeReferrals = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getReferralCode();
    fetchReferralDashboard();
  }

  //  Fetch referral code
  Future<void> getReferralCode() async {
    try {
      isLoading.value = true;

      final response = await _referralService.fetchReferralCode();
      if (response != null && response.success) {
        referralCode.value = response.referralCode;
      } else {
        appSnackbar(
          error: true,
          content: response?.message ?? 'Failed to fetch referral code',
        );
      }
    } catch (e) {
      appSnackbar(error: true, content: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch Dashboard Data
  Future<void> fetchReferralDashboard() async {
    try {
      isDashboardLoading.value = true;

      final dashboard = await _referralService.fetchReferralDashboard();
      if (dashboard != null && dashboard.success) {
        final data = dashboard.dashboardData;

        // Basic Stats
        walletBalance.value = data?.stats?.walletBalance.toDouble() ?? 0.0;
        totalEarnings.value = data?.stats?.totalEarnings.toDouble() ?? 0.0;
        activeReferrals.value = data?.stats?.activeReferrals ?? 0;
        totalReferrals.value = data?.stats?.totalReferrals ?? 0;

        // Referrals
        referrals.assignAll(data?.referrals ?? []);
        filteredReferrals.assignAll(referrals);
      } else {
        appSnackbar(error: true, content: "Failed to fetch referral dashboard");
      }
    } catch (e) {
      appSnackbar(error: true, content: e.toString());
    } finally {
      isDashboardLoading.value = false;
    }
  }

  // Filter
  void filterReferrals(String query) {
    if (query.isEmpty) {
      filteredReferrals.assignAll(referrals);
    } else {
      filteredReferrals.assignAll(
        referrals
            .where((r) => r.name.toLowerCase().contains(query.toLowerCase()))
            .toList(),
      );
    }
  }

  // Copy referral code
  void copyReferralCode() {
    if (referralCode.value.isEmpty) return;
    Clipboard.setData(ClipboardData(text: referralCode.value));
    Get.snackbar(
      'Copied!',
      'Referral code copied to clipboard',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
    );
  }

  // Social share mocks
  void shareToWhatsApp() => Get.snackbar('Share', 'Opening WhatsApp...');
  void shareToFacebook() => Get.snackbar('Share', 'Opening Facebook...');
  void shareToTelegram() => Get.snackbar('Share', 'Opening Telegram...');
  void shareToTwitter() => Get.snackbar('Share', 'Opening Twitter...');
  void shareToGmail() => Get.snackbar('Share', 'Opening Gmail...');
  void shareMore() => Get.snackbar('Share', 'Opening more options...');
}



// // Controller
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:saoirse_app/models/refferal_model.dart';

// class ReferralController extends GetxController {
//   final referralCode = '874126'.obs;
//   final referralUsers = <ReferralUser>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     loadReferralData();
//   }

//   void loadReferralData() {
//     // Simulated data - replace with actual API call
//     referralUsers.value = [
//       ReferralUser(
//         no: 1,
//         name: 'Rajive Kumar',
//         purchaseItems: 2,
//         commission: 840,
//       ),
//       ReferralUser(
//         no: 2,
//         name: 'Afsal',
//         purchaseItems: 4,
//         commission: 1256,
//       ),
//     ];
//   }

//   void copyReferralCode() {
//     Clipboard.setData(ClipboardData(text: referralCode.value));
//     Get.snackbar(
//       'Copied!',
//       'Referral code copied to clipboard',
//       snackPosition: SnackPosition.BOTTOM,
//       duration: const Duration(seconds: 2),
//       backgroundColor: Colors.green,
//       colorText: Colors.white,
//       margin: const EdgeInsets.all(16),
//     );
//   }

//   void shareToWhatsApp() {
//     // Implement WhatsApp sharing
//     Get.snackbar('Share', 'Opening WhatsApp...');
//   }

//   void shareToFacebook() {
//     // Implement Facebook sharing
//     Get.snackbar('Share', 'Opening Facebook...');
//   }

//   void shareToTelegram() {
//     // Implement Telegram sharing
//     Get.snackbar('Share', 'Opening Telegram...');
//   }

//   void shareToTwitter() {
//     // Implement Twitter sharing
//     Get.snackbar('Share', 'Opening Twitter...');
//   }

//   void shareToGmail() {
//     // Implement Gmail sharing
//     Get.snackbar('Share', 'Opening Gmail...');
//   }

//   void shareMore() {
//     // Implement more sharing options
//     Get.snackbar('Share', 'Opening more options...');
//   }
// }