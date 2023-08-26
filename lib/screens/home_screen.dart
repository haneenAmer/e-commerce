import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hala_sat_task/constance/constance.dart';
import 'package:hala_sat_task/core/models/product_list_models.dart';
import 'package:hala_sat_task/riveropd/product_list_riverpod.dart';

import '../widgets/widgets.dart';
import 'details_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Products? products;
  @override
  bool isError = false;
  bool isLoading = false;
  Widget build(BuildContext context) {
    ref.watch(productListFutureProvider).when(
      data: (data) {
        products = data;
        for (int i = 0; i < products!.data.length; i++)
          print("hfffffff${products?.data[i].images}");
      },
      error: (_, __) {
        isError = true;
      },
      loading: () {
        isLoading = true;
        if (isLoading == true) {
          return CircularProgressIndicator();
        }
      },
    );
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.purpleMain,
            //elevation: 0,
            title: Text('home page'),
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
                            itemCount: products?.data.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext) =>
                                              DetailsScreen()));
                                },
                                child: Card(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        // margin: const EdgeInsets.all(5),
                                        height: 190,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 202, 200, 200),
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(8)),
                                        ),

                                        child: MyCashedNetworkImage(
                                            image:
                                                products?.data[index].images ??
                                                    ''),
                                      ),
                                      SizedBox(
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
                                            Text(
                                                products?.data[index].title ??
                                                    '',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                )),
                                            ////${meals?.data.length}"
                                            Text(
                                                "${products?.data[index].price ?? ''}",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),

                                      /// raiting
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            right: 12.0, bottom: 20),
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                      ),
                                    ],
                                  ),
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
