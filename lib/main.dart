import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hala_sat_task/screens/home_screen.dart';
import 'package:hala_sat_task/screens/login_screen.dart';

final nameProvider = StateProvider<String?>((ref) => 'null');

/// ref allow to communicate from this provider to other providers
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}
