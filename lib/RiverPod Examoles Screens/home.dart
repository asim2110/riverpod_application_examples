import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../RiverPod Examoles Screens/future_provider_example.dart';
import '../RiverPod Examoles Screens/simpleprovider.dart';
import '../RiverPod Examoles Screens/state_provider.dart';
import 'apigetscreen.dart';
import 'streem_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RiverPod Screens"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(Simpleprovider());
              },
              child: Text("Simple Provider"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(MyStateProvider());
              },
              child: Text("State Provider"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(FutureProviderExample());
              },
              child: Text("Future Provider"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(ApiGet());
              },
              child: Text("Future Provider In API call"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(StreemScreen());
              },
              child: Text("Streem Provider"),
            ),
          ],
        ),
      ),
    );
  }
}
