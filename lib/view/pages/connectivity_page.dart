import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myanmar_to_thai/controller/data_controller.dart';
import 'package:myanmar_to_thai/view/pages/connection_error_page.dart';

class ConnectivityPage extends GetView<DataController> {
  final Widget connected;
  final Widget? notConnected;

  const ConnectivityPage({
    super.key,
    required this.connected,
    this.notConnected,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final connectResult = controller.connectivityResult.value;
      if (connectResult == ConnectivityResult.mobile ||
          connectResult == ConnectivityResult.wifi ||
          connectResult == ConnectivityResult.ethernet ||
          connectResult == ConnectivityResult.vpn) {
        return connected;
      } else {
        return notConnected ?? const ConnectionErrorPage();
      }
    });
  }
}
