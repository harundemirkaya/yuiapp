import 'package:flutter/material.dart';

import '../utils/constant.dart';

class defaultSizedBox extends StatelessWidget {
  final heightOrWidth;
  const defaultSizedBox({
    Key? key,
    this.heightOrWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (heightOrWidth == 1) {
      return SizedBox(
        height: defaultPadding,
      );
    } else {
      return SizedBox(
        width: defaultPadding,
      );
    }
  }
}
