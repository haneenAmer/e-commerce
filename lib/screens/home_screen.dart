import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hala_sat_task/constance/constance.dart';
import 'package:hala_sat_task/core/models/detail_product.dart';
import 'package:hala_sat_task/core/models/product_list_models.dart';
import 'package:hala_sat_task/riveropd/product_list_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../widgets/widgets.dart';
import 'details_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  // static const _pageSize = 20;

  // final PagingController<int, Product> pagingController =
  //     PagingController(firstPageKey: 0);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
//     final PagingController<int, Product> _pagingController =
//       PagingController(firstPageKey: 0);

  Products? products;

  @override
  //  void initState() {
  //   super.initState();
  //   _pagingController.addPageRequestListener((pageKey) {
  //     _fetchPage(pageKey);
  //   });
  // }
  // Future<void> _fetchPage(int pageKey) async {
  //   try {
  //     final nextPage = pageKey + 1;
  //     final newItems = await  ref.read(productListFutureProvider).products(page: nextPage);
  //     final isLastPage = newItems.data.isEmpty;
  //     if (isLastPage) {
  //       _pagingController.appendLastPage(newItems.data);
  //     } else {
  //       _pagingController.appendPage(newItems.data, nextPage);
  //     }
  //   } catch (error) {
  //     _pagingController.error = error;
  //   }
  // }

  bool isError = false;
  bool isLoading = false;
  Widget build(BuildContext context) {
    ref.watch(productListFutureProvider).when(
      data: (data) {
        products = data;
        loading:
        ();
        // for (int i = 0; i < products!.data.length; i++)
        //   print("hfffffff${products?.data[i].images}");
      },
      error: (_, __) {
        isError = true;
        loading:
        ();
      },
      loading: () {
        isLoading = true;

        return const CircularProgressIndicator();
      },
    );

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.purpleMain,
            //elevation: 0,
            title: const Text('home page'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                      //height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      child: ScrollConfiguration(
                        behavior: MyBehavior(),
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            itemCount: products?.data.length ?? 10,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              print("leeeeeee${products?.data.length ?? 10}");
                              return Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      // margin: const EdgeInsets.all(5),
                                      height: 190,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 202, 200, 200),
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(8)),
                                      ),

                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext) =>
                                                      DetailsScreen(
                                                        id: products
                                                                ?.data[index]
                                                                .id ??
                                                            '',
                                                      )));
                                        },
                                        child: MyCashedNetworkImage(
                                            image: products
                                                    ?.data[index].images[0] ??
                                                ''),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),

                                      /// price and titile
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              products?.data[index].title ?? '',
                                              style: headerTextStyle,
                                              softWrap: true,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          ////${meals?.data.length}"
                                          Text(
                                              " \$ ${products?.data[index].price.toString() ?? ''}",
                                              style: headerTextStyle),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),

                                    /// raiting
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Text(
                                              products?.data[index].rating
                                                      .toString() ??
                                                  '',
                                              style: headerTextStyle),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
