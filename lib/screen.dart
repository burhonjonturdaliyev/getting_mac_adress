// ignore_for_file: camel_case_types, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

class gettingMacAdress extends StatefulWidget {
  const gettingMacAdress({super.key});

  @override
  State<gettingMacAdress> createState() => _gettingMacAdressState();
}

class _gettingMacAdressState extends State<gettingMacAdress> {
  late String macAddress;
  getMacAddress() async {
    print("Kirdi\n\n\n");
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      setState(() {
        macAddress = androidInfo.id;
      });
      print('Android MAC Address: $macAddress');
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      setState(() {
        macAddress = iosInfo.identifierForVendor!;
      });
      print('IOS MAC Address: $macAddress');
    }
  }

  @override
  void initState() {
    getMacAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getMacAddress();
        },
      ),
      appBar: AppBar(
        title: const Text("Mac Address"),
        centerTitle: true,
      ),
    );
  }
}
