import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  final Rx<bool> isConnected = true.obs;
  late StreamSubscription<List<ConnectivityResult>> _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    _streamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (result.contains(ConnectivityResult.ethernet) ||
          result.contains(ConnectivityResult.wifi) ||
          result.contains(ConnectivityResult.mobile)) {
        isConnected.value = true;
      } else {
        isConnected.value = false;
      }
    });
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}
