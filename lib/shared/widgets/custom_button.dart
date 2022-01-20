import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Function()? onPressed;
  const CustomButton({
    Key? key,
    required this.text,
    this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.075,
      width: size.width * 0.80,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
