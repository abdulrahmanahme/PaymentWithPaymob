import 'package:flutter/material.dart';
import 'package:payment/core/extension.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard(
      {super.key, required this.title, required this.image, this.onTap});
  final String title;
  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Colors.black87, width: 2.0),
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: NetworkImage(image),
              ),
             15.hs,
              Text(
               title,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}