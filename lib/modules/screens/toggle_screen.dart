import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/extension.dart';
import 'package:payment/modules/screens/ref__code_screen.dart';
import 'package:payment/modules/screens/visa_screen.dart';
import 'package:payment/modules/screens/widgets/payment_card.dart';
import 'package:payment/modules/screens/widgets/snack_bar.dart';
import 'package:payment/shared/components/componets_screen.dart';
import '../../shared/components/constant.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
            child: BlocConsumer<PaymentCubit, PaymentStates>(
                listener: (context, state) {
            
               if (state is SuccessKioskState) {
              showSnackBar(
                context: context,
                text: " Success Ref Code ",
                color: Colors.green,
              );
              navigateAndFinish(context, const RefCodeScreen());
            }
            if (state is ErrorKioskState) {
              showSnackBar(
                context: context,
                text: state.error,
                color: Colors.red,
              );
            }
            }, builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PaymentCard(
                    title: 'Payment with Ref code',
                    image: AppImages.refCodeImage,
                    onTap: (){
                      context.read<PaymentCubit>().getKiosk();
                    },
                  ),
                  20.hs,
                  PaymentCard(
                    title: 'Payment with visa',
                    image: AppImages.visaImage,
                    onTap: (){
                      navigateAndFinish(context,const VisaScreen());
                    },
                  ),
                 
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}


