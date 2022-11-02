import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:unslash/view/widget/search/searchfilter.dart';

class DataSearch extends SearchDelegate {
  @override


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query != '' ? query = '' : Get.back();
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchFilter(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchFilter(query: query);
  }
}
