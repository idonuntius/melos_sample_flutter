import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository/repository.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Consumer(builder: ((context, ref, child) {
        final future = ref.watch(meRepositoryProvider);
        return future.when(
          data: (data) => Column(
            children: [
              Text(data.id.toString()),
              Text(data.name),
            ],
          ),
          error: (e, _) => const Center(child: Text('error')),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      })),
    );
  }
}
