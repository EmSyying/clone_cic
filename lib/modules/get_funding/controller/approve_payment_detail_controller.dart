import 'dart:convert';
import 'package:cicgreenloan/modules/get_funding/models/payment_model/payment.dart';
import 'package:cicgreenloan/modules/get_funding/models/payment_model/payment_schedule.dart';
import 'package:cicgreenloan/widgets/get_funding/payment/payment_info.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../../../Utils/helper/store_utils.dart';

class ApprovePaymentController extends GetxController {
  final isLoading = true.obs;
  final token = ''.obs;
  final payment = Payment().obs;
  final paymentSchedule = PaymentSchedules().obs;

  Future<PaymentSchedules> fetchApprovePayment(int scheduleId) async {
    try {
      const Center(
        child: CircularProgressIndicator(),
      );
      String url =
          '${GlobalConfiguration().getValue('api_base_url')}payment-detail?schedule_id=$scheduleId';
      await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
      ).then((respone) {
        if (respone.statusCode == 200) {
          var responeData = json.decode(respone.body)['data'];
          final paySchedule = PaymentSchedules.fromjson(responeData);
          paymentSchedule.value = paySchedule;

          isLoading(false);

          Get.to(PaymentInfo(
            paymentSchedule: paymentSchedule.value,
          ));
        } else {
          return null;
        }
      });
    } finally {}
    return paymentSchedule.value;
  }

  Future<Payment> payAnnouncement(int disbursementId) async {
    try {
      const Center(
        child: CircularProgressIndicator(),
      );
      String url =
          '${GlobalConfiguration().getValue('api_base_url')}disbursement-detail?disbursement_id=$disbursementId';
      await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
      ).then((respone) {
        if (respone.statusCode == 200) {
          var responeData = json.decode(respone.body)['data'];
          final pay = Payment.fromJson(responeData);
          payment.value = pay;

          isLoading.value = false;
        }
      });
    } finally {
      isLoading.value = false;
      // isLoading.value
      //     ? Center(child: CircularProgressIndicator())
      //     : Get.to(PaymentDetail(payment: payment.value));
    }
    return payment.value;
  }

//verify disbursement
  Future<Payment> verifyDisbursment(
      int disbursementId, String status, String notificationId) async {
    try {
      const Center(
        child: CircularProgressIndicator(),
      );
      String url =
          '${GlobalConfiguration().getValue('api_base_url')}verify-disbursement?disbursement_id=$disbursementId&status=$status&notification_id=$notificationId';
      await http
          .post(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode({
          'disbursement_id': '$disbursementId',
          'status': status,
        }),
      )
          .then((respone) {
        if (respone.statusCode == 200) {
          var responeData = json.decode(respone.body);
          var message = responeData['message'];

          payAnnouncement(disbursementId);
          Get.snackbar(
            'Verify',
            message,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2),
            margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
          );
        }
      });
    } finally {}
    return payment.value;
  }

  getCurrentUser() async {
    token.value = StorageUtil.getString('current_user');
  }

  @override
  void onInit() {
    getCurrentUser();
    super.onInit();
  }
}
