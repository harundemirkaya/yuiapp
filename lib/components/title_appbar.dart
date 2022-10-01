import 'package:flutter/material.dart';

import '../themes/color.dart';
import '../utils/constant.dart';

AppBar buildAppBar(titleText) {
  return AppBar(
    iconTheme: const IconThemeData(
      color: Colors.black, //change your color here
    ),
    title: Text(
      titleText,
      style: titleStyle,
    ),
    backgroundColor: white,
    shadowColor: white,
    centerTitle: true,
  );
}
