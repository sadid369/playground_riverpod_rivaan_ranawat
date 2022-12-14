import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground/main.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  String userNo = '1';
  @override
  Widget build(BuildContext context) {
    return ref.watch(fetchUserProvider(userNo)).when(
        data: (data) {
          return Scaffold(
              appBar: AppBar(
                title: Text(data.name),
              ),
              body: Column(
                children: [
                  TextField(
                    onChanged: (value) => setState(() {
                      userNo = value;
                    }),
                  ),
                  Center(
                    child: Text(data.email),
                  )
                ],
              ));
        },
        error: (error, stackTrace) {
          return Scaffold(
              body: Center(
            child: Text(error.toString()),
          ));
        },
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
