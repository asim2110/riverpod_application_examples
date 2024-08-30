import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<String> FetchWatherProvider() async {
  return await Future.delayed(Duration(seconds: 3), () => "43°©");
}

final FuterfetchProvider = FutureProvider.autoDispose(
  (ref) => FetchWatherProvider(),
);

class FutureProviderExample extends ConsumerWidget {
  const FutureProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Provider Example"),
        centerTitle: true,
      ),
      body: ref.watch(FuterfetchProvider).when(
        data: (data) {
          return Center(
            child: Text(
              data,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.deepOrangeAccent,
              ),
            ),
          );
        },
        error: (error, StackTrace) {
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
