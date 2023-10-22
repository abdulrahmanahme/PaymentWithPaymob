import 'package:flutter/material.dart';
import 'package:payment/core/extension.dart';

class DefaultButton extends StatelessWidget {
  final String buttonText;

  final void Function() function;
  final Color? colors;
  final Color? borderColor;

  final TextStyle? buttonTextStyle;

  const DefaultButton(
      {Key? key,
      required this.buttonText,
      required this.function,
      this.colors,
      this.borderColor,
      this.buttonTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: function,
        child: Container(
          width: double.infinity,
          height: 52.h,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            color: colors ?? Colors.purple,
            borderRadius: BorderRadius.circular(7),
            border: borderColor != null
                ? Border.all(
                    color: borderColor!,
                  )
                : null,
          ),
          child: Center(
              child: Text(buttonText,
                  style: buttonTextStyle ??
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ))),
        ));
  }
}
