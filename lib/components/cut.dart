import 'package:flutter/material.dart';
import 'package:yuiapp/screens/see_all.dart';

import '../utils/constant.dart';

class cut extends StatelessWidget {
  final leftText;
  final rightText;
  const cut({
    Key? key,
    this.leftText,
    this.rightText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              leftText,
              style: titleStyle.copyWith(fontSize: 20),
            ),
          ],
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeeAll(
                      titleText: leftText,
                    ),
                  ),
                );
              },
              child: Text(
                rightText,
                style: subTitleStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
