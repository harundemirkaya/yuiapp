// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import
import 'package:flutter/material.dart';
import 'package:yuiapp/themes/color.dart';
import 'package:yuiapp/utils/constant.dart';
import 'package:yuiapp/utils/fakeData.dart';
import '../components/banner.dart';
import '../components/cut.dart';
import '../components/defaultSizedBox.dart';
import '../components/logo_appbar.dart';
import '../components/popular_products.dart';
import '../components/slide.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      appBar: logoAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding * 2),
        child: ListView(
          children: [
            slide(),
            defaultSizedBox(
              heightOrWidth: 1,
            ),
            cut(
              leftText: "Popüler",
              rightText: "Tümünü Gör",
            ),
            defaultSizedBox(
              heightOrWidth: 1,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  banner(
                      imageUrl:
                          "https://www.yui.com.tr/storage/2022/06/kucuk-ev-aletleri-2.jpg"),
                  defaultSizedBox(
                    heightOrWidth: 0,
                  ),
                  banner(
                    imageUrl:
                        "https://www.yui.com.tr/storage/2022/06/kisisel-bakim-saglik-4.jpg",
                  ),
                  defaultSizedBox(
                    heightOrWidth: 0,
                  ),
                ],
              ),
            ),
            defaultSizedBox(
              heightOrWidth: 1,
            ),
            cut(
              leftText: "Çok Satanlar",
              rightText: "Tümünü Gör",
            ),
            defaultSizedBox(
              heightOrWidth: 1,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: popularProducts(),
            ),
            defaultSizedBox(
              heightOrWidth: 1,
            ),
            cut(
              leftText: "Yeni Gelenler",
              rightText: "Tümünü Gör",
            ),
            defaultSizedBox(
              heightOrWidth: 1,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: popularProducts(),
            ),
          ],
        ),
      ),
    );
  }
}
