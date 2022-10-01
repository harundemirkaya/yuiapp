import 'package:flutter/material.dart';
import 'package:yuiapp/utils/constant.dart';

import '../themes/color.dart';

class accountLine extends StatelessWidget {
  final String title;
  final Widget newScreen;
  final IconData textIcon;
  const accountLine({
    Key? key,
    required this.title,
    required this.newScreen,
    required this.textIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => newScreen),
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  width: 1.0,
                  color: grey,
                )),
              ),
              width: MediaQuery.of(context).size.width - (defaultPadding * 2),
              height: 35,
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Icon(textIcon),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Text(
                          title,
                          style: titleStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
