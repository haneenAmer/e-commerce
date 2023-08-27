import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../constance/constance.dart';

/// remove blue light
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

ClipRRect MyCashedNetworkImage({required image}) {
  return ClipRRect(
    borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
    child: CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: image,
      placeholder: (context, url) => const SimpleCircularProgressBar(
        progressStrokeWidth: 5,
        backStrokeWidth: 5,
        size: 20,
        progressColors: [AppColors.purpleMain],
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    ),
  );
}

TextStyle headerTextStyle = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
TextStyle bodyTextStyle = const TextStyle(
  fontSize: 16,
  color: Colors.black,
);

TextField searchTextField() {
  return const TextField(
    style: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
    //controller: editingController,
    decoration: InputDecoration(
      border: InputBorder.none,
      prefixIcon: Icon(
        Icons.search,
        color: Colors.white,
      ),
    ),
  );
}
