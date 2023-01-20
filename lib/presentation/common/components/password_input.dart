import 'package:carrier_boost/presentation/common/components/input_decoration.dart';
import 'package:carrier_boost/presentation/common/components/input_description.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final String title;
  final String label;
  final bool hiddenValue;
  const PasswordInput({Key? key, required this.title, required this.label, required this.hiddenValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputDescription(title),
        TextFormField(decoration: customInputDecoration(
            label: label),obscureText: hiddenValue)
      ],
    );
  }
}
