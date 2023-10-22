import 'package:flutter/material.dart';
import 'package:payment/shared/styles/app_test.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.purple,
        title: Text(
          AppText.payMentIntegration,
          style: const TextStyle(color: Colors.white,
          fontWeight: FontWeight.w500,
           ),
        ),
        centerTitle: true,
      ),
      body: ListView(children: [

      ],),
    );
  }
}
