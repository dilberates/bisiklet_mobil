import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MaskPhone{
  static MaskTextInputFormatter maskFormatter = new MaskTextInputFormatter(
      mask: '(###)-###-##-##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy,
  );
}