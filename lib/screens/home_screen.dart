import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hala_sat_task/core/models/product_list_models.dart';
import 'package:hala_sat_task/riveropd/detail_product.dart';
import 'package:hala_sat_task/riveropd/product_list_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';
import '../constance/constance.dart';
import '../widgets/widgets.dart';
import 'details_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  TextEditingController editingController = TextEditingController();
  List<Product> items = [];
  @override
  void initState() {
    super.initState();
    // اعتقد لازم شي ينكتب هنا
  }

  void filterSearchResults(editingController) {
    setState(() {
      items = items
          .where((product) =>
              product.title
                  ?.toLowerCase()
                  .contains(editingController.toLowerCase()) ??
              false)
          .toList();
    });
  }

  TextField searchTextField() {
    return TextField(
      onChanged: (value) {
        filterSearchResults(value);
      },
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      controller: editingController,
      decoration: const InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.purpleMain, title: searchTextField()
            // const Text('home page'),
            ),
        body: RiverPagedBuilder<int, Product>(
          // the first page we will ask
          firstPageKey: 1,
          // The [StateNotifierProvider] that holds the logic and the list of Posts
          provider: productsProvider,
          // a function that build a single Post
          itemBuilder: (context, item, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              height: 300,
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                        width: double.infinity,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                height: 190,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 202, 200, 200),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(8)),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    /// Navigat to the details screen by using riverpod statemanagment
                                    ref.read(idProvider.notifier).state =
                                        item.id;
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return const DetailsScreen();
                                    }));
                                  },

                                  /// image of card
                                  child: MyCashedNetworkImage(
                                      image: item.thumbnail ?? ''),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),

                                /// price and titile
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item.title ?? '',
                                        style: headerTextStyle,
                                        softWrap: true,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(" \$ ${item.price.toString()}",
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Text(item.rating.toString(),
                                        style: headerTextStyle),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),

          pagedBuilder: (controller, builder) => PagedListView(
              pagingController: controller, builderDelegate: builder),
        ),
        // The type of list we want to render
        // This can be any of the [infinite_scroll_pagination] widgets
      ),
    );
  }
}
