import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:payment/modules/screens/register_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../shared/components/componets_screen.dart';
import '../../shared/components/constant.dart';

class VisaScreen extends StatefulWidget {
  const VisaScreen({super.key});

  @override
  State<VisaScreen> createState() => _VisaScreenState();
}

class _VisaScreenState extends State<VisaScreen> {
  final WebViewController controller = WebViewController()
    ..loadRequest(Uri.parse(AppConst.frameUrl));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () {
            paymentExitApp(context);
          },
          icon: const Icon(
            Icons.exit_to_app,
            
          ),
        )
      ]),
      body: WebViewWidget(controller: controller),
    );
  }
}
