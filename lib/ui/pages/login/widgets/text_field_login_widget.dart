import 'package:flutter/material.dart';

class TextFieldLoginWidget extends StatelessWidget {
  final bool isObscureText;
  final String text;
  const TextFieldLoginWidget({
    Key? key,
    this.isObscureText = false,
    required this.text,
    required this.size,
  }) : super(key: key);
  const TextFieldLoginWidget.senha({
    Key? key,
    required this.text,
    required this.size,
    this.isObscureText = true,
  }) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.075,
      width: size.width * 0.80,
      child: TextField(
        obscureText: isObscureText,
        scrollPadding: const EdgeInsets.all(20.0),
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onBackground.withAlpha(80),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onBackground.withAlpha(200),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onBackground.withAlpha(40),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          prefix: const SizedBox(
            width: 20,
            height: 20,
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.background,
          hintText: text,
          hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.56),
              ),
        ),
      ),
    );
  }
}
