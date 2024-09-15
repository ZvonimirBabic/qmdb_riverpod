import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qmdb/services/connectivity_service.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController tabController;
  final ConnectivityService _connectivityService =
      Get.find<ConnectivityService>();

  bool get isConnected => _connectivityService.isConnected.value;

  @override
  Future<void> onInit() async {
    tabController = TabController(length: 2, vsync: this);
    tabController.animation?.addListener(
      () {
        update(
          ['tabBarBuilder'],
        );
      },
    );
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
