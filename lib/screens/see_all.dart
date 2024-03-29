import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_cubit.dart';
import '../bloc/services/getData.dart';
import '../components/defaultSizedBox.dart';
import '../components/title_appbar.dart';
import '../utils/constant.dart';

class SeeAll extends StatefulWidget {
  final titleText;
  const SeeAll({super.key, @required this.titleText});

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(YuiRepository())..getProducts(),
      child: buildPage(context),
    );
  }

  Scaffold buildPage(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(widget.titleText),
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
            } else if (state is ProductsGet) {
              final products = state.response;

              return ListView(
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: Image.network(
                                    products[index].images?[0].src as String,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Text(
                                      products[index].name as String,
                                      overflow: TextOverflow.ellipsis,
                                      style: subTitleStyle,
                                      maxLines: 2,
                                    )),
                              ),
                              const defaultSizedBox(
                                heightOrWidth: 1,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Text(
                                      products[index].price as String,
                                      style: titleStyle.copyWith(
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          );
                        }),
                      )),
                ],
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
