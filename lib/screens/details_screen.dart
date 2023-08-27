import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hala_sat_task/riveropd/detail_product.dart';
import '../constance/constance.dart';
import '../widgets/widgets.dart';

class DetailsScreen extends ConsumerWidget {
  const DetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back)),
          backgroundColor: AppColors.purpleMain,
          title: const Text('details screen'),
        ),
        body: ref.watch(productFutureProvider).when(
            data: (data) {
              print('daaaaaaaaaaaata $data');
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                          itemCount: data.images.length,
                          itemBuilder: (context, pagePosition) {
                            return Container(
                              margin: const EdgeInsets.all(10),
                              child: Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(data.images[0])),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  data.title,
                                  style: headerTextStyle,
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                " \$ ${data.price.toString()}",
                                style: headerTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          Text(
                            data.description,
                            style: bodyTextStyle,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 20,
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
                  ]);
            },
            error: (error, _) => const Text('ERRORRR'),
            loading: () => const Center(child: CircularProgressIndicator())),
      )),
    );
  }
}
