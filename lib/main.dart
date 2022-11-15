import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground/home_screen.dart';
import 'package:playground/user.dart';
import 'package:http/http.dart' as http;

// final nameProvider = Provider<String>(
//   (ref) => 'Rivan',
// );
// final nameProvider = StateProvider<String?>(
//   (ref) => null,
// );
final fetchUserProvider = FutureProvider.family((ref, String input) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData(input);
});
final streamProvider = StreamProvider(
  (ref) async* {
    yield [1, 2, 4, 5, 6, 7, 8, 9, 10];
  },
);
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
