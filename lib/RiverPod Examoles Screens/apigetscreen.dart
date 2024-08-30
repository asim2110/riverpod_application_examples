// y aik API type function hy jis ko alg define krdia hy jo hum
//next screen min call krny waly hin

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future APIprovider() async {
  return await Future.delayed(Duration(seconds: 3), () async {
    final dio = Dio();
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/posts/1/comments');
    return response.data;
  });
}

final GetapiProvider = FutureProvider((ref) => APIprovider());

class ApiGet extends ConsumerWidget {
  const ApiGet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Get Screen"),
      ),
      body: ref.watch(GetapiProvider).when(
            data: (data) {
              // Set the response from the API call
              return Center(
                  child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text('API Response: ${data.toString()}'),
              ));
            },
            error: (err, stack) => Center(child: Text('Error: $err')),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
    );
  }
}
