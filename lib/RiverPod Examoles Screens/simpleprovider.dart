import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//y sb humny aik provider ka function bna lia hy jo k hum next call kringy
final StringProvider = Provider<String>(
  (ref) {
    return "My Name Is RiverPod";
  },
);

class Simpleprovider extends ConsumerWidget {
  const Simpleprovider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String mydata = ref.read<String>(StringProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Provider Read"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              mydata,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.green),
            ),
            Text(
              mydata,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
