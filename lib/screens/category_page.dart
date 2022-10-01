import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:yuiapp/components/defaultSizedBox.dart';

import '../components/title_appbar.dart';
import '../utils/constant.dart';
import '../utils/fakeData.dart';

class CategoryPage extends StatefulWidget {
  final String categoryName;
  const CategoryPage({super.key, required this.categoryName});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(widget.categoryName),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding * 2),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: StaggeredGrid.count(
                  crossAxisCount: 2,
                  children: List.generate(products.length, (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Image.network(
                              products[index]['productImage'] as String,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                products[index]['productName'] as String,
                                overflow: TextOverflow.ellipsis,
                                style: subTitleStyle,
                                maxLines: 2,
                              )),
                        ),
                        const defaultSizedBox(
                          heightOrWidth: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                products[index]['price'] as String,
                                style: titleStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    );
                  }),
                )),
          ],
        ),
      ),
    );
  }
}
