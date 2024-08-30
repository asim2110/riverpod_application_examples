import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Stream<int> FetchNumber() {
  return Stream<int>.periodic(
    Duration(seconds: 1),
    (number) => number,
  ).take(60);
}

final StreamNumper = StreamProvider<int>(
  (ref) => FetchNumber(),
);

class StreemScreen extends ConsumerWidget {
  const StreemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(StreamNumper);
    return Scaffold(
        appBar: AppBar(
          title: Text("Streem Provider"),
        ),
        body: value.when(
          data: (data) {
            return Center(
              child: Text(
                data.toString(),
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 22, 9, 171),
                ),
              ),
            );
          },
          error: (error, StackTrace) {
            return Center(
              child: Text(error.toString()),
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
        ));
  }
}
