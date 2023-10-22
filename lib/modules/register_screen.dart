import 'package:flutter/material.dart';
import 'package:payment/core/extension.dart';
import 'package:payment/shared/components/widgets/text_form_field.dart';
import 'package:payment/shared/styles/app_test.dart';
import '../shared/components/widgets/default_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailNameController = TextEditingController();
  final phoneNameController = TextEditingController();
  final priceNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          AppText.payMentIntegration,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormFieldWidget(
                  controller: firstNameController,
                  prefix: const Icon(Icons.person),
                  hintText: 'Enter first name',
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Please Enter first name';
                    }
                    return null;
                  },
                ),
                20.hs,
                TextFormFieldWidget(
                  controller: lastNameController,
                  prefix: const Icon(Icons.person),
                  hintText: 'Enter last name',
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Please Enter last name';
                    }

                    return null;
                  },
                ),
                20.hs,
                TextFormFieldWidget(
                  controller: emailNameController,
                  prefix: const Icon(Icons.email),
                  hintText: 'Enter email ',
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Please Enter email';
                    }

                    return null;
                  },
                ),
                20.hs,
                TextFormFieldWidget(
                  controller: phoneNameController,
                  prefix: const Icon(Icons.phone),
                  hintText: 'Enter phone number',
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Please Enter phone number';
                    }

                    return null;
                  },
                ),
                20.hs,
                TextFormFieldWidget(
                  controller: priceNameController,
                  prefix: const Icon(Icons.currency_pound),
                  hintText: 'Enter price ',
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Please Enter price';
                    }

                    return null;
                  },
                ),
                20.hs,
                DefaultButton(
                  buttonText: 'Pay Now',
                  function: () {
                    if (formKey.currentState!.validate()) {
                      debugPrint('Pay Now');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
