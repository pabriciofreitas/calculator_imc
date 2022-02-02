import 'package:flutter/material.dart';

class CurrencyTextfield extends StatelessWidget {
  final String label;
  final String prefix;
  final Size size;
  final TextEditingController controller;
  final void Function(String)? onChange;
  const CurrencyTextfield({
    Key? key,
    required this.label,
    required this.prefix,
    required this.size,
    required this.controller,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.08,
      child: TextField(
        onChanged: onChange,
        controller: controller,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.5)),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: label,
          prefixStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.5)),
          prefix: Text(prefix),
        ),
      ),
    );
  }
}
