import 'package:flutter/material.dart';
import 'package:yuiapp/themes/color.dart';

class banner extends StatelessWidget {
  final imageUrl;
  const banner({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 250,
        height: 150,
        decoration: BoxDecoration(
            color: grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(width: 0.02),
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover)),
      ),
    );
  }
}
