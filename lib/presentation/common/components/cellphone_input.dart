import 'package:carrier_boost/presentation/common/components/input_decoration.dart';
import 'package:carrier_boost/presentation/common/components/input_description.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CellphoneInput extends StatefulWidget {
  final String title;
  final String label;
  final TextEditingController controller;

  const CellphoneInput({Key? key, required this.title, required this.label, required this.controller})
      : super(key: key);

  @override
  State<CellphoneInput> createState() => _CellphoneInputState();
}
class _CellphoneInputState extends State<CellphoneInput> {
  var maskFormatter = MaskTextInputFormatter(
      mask: '(##) # ####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  String? _validatePhoneNumber(String? value) {
    final phoneExp = RegExp(r'^\([1-9]\d\) 9 \d\d\d\d\-\d\d\d\d$');
    if (value == null) {
      return '\u24d8 Insira um número de telefone';
    }

    if (!phoneExp.hasMatch(value)) {
      return '\u24d8  Insira um número de telefone válido';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputDescription(widget.title),
        TextFormField(
          decoration: customInputDecoration(label: widget.label),
          keyboardType: TextInputType.number,
          validator: _validatePhoneNumber,
          inputFormatters: [maskFormatter],
          controller: widget.controller,
        )
      ],
    );
  }
}
