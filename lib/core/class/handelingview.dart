import 'package:flutter/material.dart';
import 'package:unslash/core/class/statusrequest.dart';
import 'package:unslash/view/widget/apperror404widget.dart';

class HandelingView extends StatelessWidget {
  HandelingView({Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  final StatusRequest statusRequest;
  Widget widget;

  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (statusRequest == StatusRequest.success) {
      return widget;
    } else if (statusRequest == StatusRequest.failure) {
      return Center(child: const Text('no data'));
    } else {
      return AppEroor404Widget();
    }
  }
}

class HandelingRequest extends StatelessWidget {
  HandelingRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  final StatusRequest statusRequest;
  Widget widget;

  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    // else if (statusRequest == StatusRequest.failure) {
    //   return const Text('no data');
    // }
    else if (statusRequest == StatusRequest.serverExp ||
        statusRequest == StatusRequest.offline) {
      return AppEroor404Widget();
    } else {
      return widget;
    }
  }
}
