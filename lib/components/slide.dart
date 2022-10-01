import 'package:flutter/material.dart';

import '../themes/color.dart';

class slide extends StatelessWidget {
  const slide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: grey.withOpacity(0.2),
          border: Border.all(width: 0.02),
          image: const DecorationImage(
              image: NetworkImage(
                  "https://www.yui.com.tr/storage/2022/08/yui_airfrayer_banner_1340_480.jpg"),
              fit: BoxFit.cover)),
    );
  }
}
