import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:payment/shared/components/componets_screen.dart';

import '../../modules/screens/register_screen.dart';

class AppConst {
    static String paymobApikey =
      "PUT Here your ApiKey";
  

  static String paymobFirstToken = '';
  static String orderId = '';

  static String finalTokenCard = '';
  static String finalTokenKiosk = '';

  static String integrationIdCard = '4294042';
  static String integrationIdKiosk = '';

  static String refCode = '';
  static String frameUrl =
      '$baseUrl/acceptance/iframes/795540?payment_token==$finalTokenCard';

  static const String baseUrl = 'https://accept.paymob.com/api';
  static const String getAuthToken = '/auth/tokens';
  static const getOrderId = '/ecommerce/orders';
  static const getPaymentRequest = '/acceptance/payment_keys';
  static const getRefCode = '/acceptance/payments/pay';
}

class AppImages {
  static const String refCodeImage =
      "https://cdn-icons-png.flaticon.com/128/4090/4090458.png";
  static const String visaImage =
      "https://cdn-icons-png.flaticon.com/128/349/349221.png";
}

void paymentExitApp(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: const Text(
          'Are you sure completed the pay',
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              navigateAndFinish(
                context,
                RegisterScreen(),
              );
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
        ],
      );
    },
  );
}
