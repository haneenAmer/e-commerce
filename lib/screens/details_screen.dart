import 'package:flutter/material.dart';
import 'package:hala_sat_task/core/models/product_list_models.dart';

import '../constance/constance.dart';
import '../core/models/detail_product.dart';
import '../widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, required this.id});
  final id;
  DetailProduct? detailProduct;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(backgroundColor: AppColors.purpleMain),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
                itemCount: 6,
                itemBuilder: (context, pagePosition) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: Image(
                        image: NetworkImage(detailProduct?.images[0] ?? '')),
                  );
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      detailProduct?.title ?? '',
                      style: headerTextStyle,
                    ),
                    Text(
                      '\$ price',
                      style: headerTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'details details detailsdetails detailsdetailsdetailsdetailsdetails details detailsdetails detailsdetailsdetailsdetails  ',
                  style: bodyTextStyle,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Sugestions',
                  style: headerTextStyle,
                ),
                // SizedBox(
                //     height: 150,
                //     width: double.infinity,
                //     child: ScrollConfiguration(
                //       behavior: MyBehavior(),
                //       child: ListView.builder(
                //           scrollDirection: Axis.horizontal,
                //           padding: const EdgeInsets.only(top: 8),
                //           itemCount: products?.data.length,
                //           itemBuilder: (BuildContext context, int index) {
                //             return Column(
                //               children: [
                //                 Container(
                //                   margin: const EdgeInsets.all(5),
                //                   height: 100,
                //                   width: 100,
                //                   decoration: BoxDecoration(
                //                     color: const Color.fromARGB(
                //                         255, 202, 200, 200),
                //                     // borderRadius: BorderRadius.circular(4),
                //                   ),
                //                   child: MyCashedNetworkImage(
                //                       image: products?.data[index].images[0] ??
                //                           []),
                //                 ),
                //                 Text('foodHomeList[index],'),
                //               ],
                //             );
                //           }),
                //     )),
              ],
            ),
          ),
        ]),
      )),
    );
  }
}
