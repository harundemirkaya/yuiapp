// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yuiapp/components/defaultSizedBox.dart';
import 'package:yuiapp/screens/category_page.dart';
import 'package:yuiapp/themes/color.dart';
import 'package:yuiapp/utils/fakeData.dart';

import '../bloc/product_cubit.dart';
import '../bloc/services/getData.dart';
import '../components/title_appbar.dart';
import '../utils/constant.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(YuiRepository())..getCategories(),
      child: buildPage(),
    );
  }
}

class buildPage extends StatelessWidget {
  const buildPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Kategoriler"),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding * 2),
        child: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoriesGet) {
              final categories = state.response;
              return ListView(
                children: List.generate(categories.length, (index) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryPage(
                                    categoryName:
                                        categories[index].name as String),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                width: 1.0,
                                color: grey,
                              )),
                            ),
                            width: MediaQuery.of(context).size.width -
                                (defaultPadding * 2),
                            height: 35,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.keyboard_arrow_right,
                                    ),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      categories[index].name as String,
                                      style: titleStyle,
                                      textAlign: TextAlign.center,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              );
            } else {
              return ListView();
            }
          },
        ),
      ),
    );
  }
}
