import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                child: const Text('Home'),
                onPressed: () {
                  Get.rawSnackbar(message: 'Thanks for clicked');
                }),
          ],
        ),
      ),
    );
  }
}
