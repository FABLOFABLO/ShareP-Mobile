import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'common/router/router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  timeago.setLocaleMessages('ko', timeago.KoMessages());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white,
      ),
      routerConfig: router,
    );
  }
}
