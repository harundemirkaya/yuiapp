import 'package:flutter/material.dart';
import 'package:yuiapp/components/account_line.dart';
import 'package:yuiapp/screens/account_details.dart';
import 'package:yuiapp/screens/address_page.dart';
import 'package:yuiapp/screens/main_page.dart';
import 'package:yuiapp/screens/orders.dart';
import 'package:yuiapp/utils/constant.dart';

import '../components/title_appbar.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Hesap"),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding * 2),
        child: Column(
          children: const [
            accountLine(
              textIcon: Icons.account_box,
              title: "Hesap Detayları",
              newScreen: AccountDetails(),
            ),
            accountLine(
              textIcon: Icons.production_quantity_limits,
              title: "Siparişler",
              newScreen: Orders(),
            ),
            accountLine(
              textIcon: Icons.gps_fixed,
              title: "Adresler",
              newScreen: AddressPage(),
            ),
            accountLine(
              textIcon: Icons.logout,
              title: "Çıkış",
              newScreen: MainPage(),
            ),
          ],
        ),
      ),
    );
  }
}
