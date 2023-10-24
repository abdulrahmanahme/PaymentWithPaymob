import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/extension.dart';
import 'package:payment/modules/payment/cubit/states.dart';
import 'package:payment/shared/components/widgets/text_form_field.dart';
import 'package:payment/shared/styles/app_test.dart';
import '../../shared/components/constant.dart';
import '../../shared/components/widgets/default_button.dart';
import '../payment/cubit/cubit.dart';

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
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
          child: BlocConsumer<PaymentCubit, PaymentStates>(
              listener: (context, state) {
                // if(state is ErrorRequestTokenState){
                //   print('from sreen ${state.error}');
                // }
              },
              builder: (context, state) {
                return Form(
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
                        state is LoadingPaymentState
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: Colors.purple,
                              ))
                            : DefaultButton(
                                buttonText: 'Pay Now',
                                function: () {
                                  // if (formKey.currentState!.validate()) {
                                  //   context.read<PaymentCubit>().getFistToken(
                                  //       firstName: firstNameController.text,
                                  //       lastName: lastNameController.text,
                                  //       email: emailNameController.text,
                                  //       phone: phoneNameController.text,
                                  //       price: priceNameController.text);
                                  // }

                                  context.read<PaymentCubit>().getFistToken(
                                        firstName: 'ABDO',
                                        lastName: 'ahmed',
                                        email: 'abdoahmed@gmail.com',
                                        phone: '01010973536',
                                        price: '5952277');
                                },
                              ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
