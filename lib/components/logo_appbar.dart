import 'package:flutter/material.dart';

import '../themes/color.dart';

AppBar logoAppBar(BuildContext context) {
  return AppBar(
    title: Image.network(
      'https://www.yui.com.tr/storage/2022/06/Varlik-3-1-290x93-1.png',
      width: MediaQuery.of(context).size.width * 0.2,
    ),
    centerTitle: true,
    backgroundColor: white,
    shadowColor: white,
  );
}
