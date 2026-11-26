import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:share_prompt/common/networks/dio_provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'common/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  timeago.setLocaleMessages('ko', timeago.KoMessages());
  await dotenv.load(fileName: ".env");
  setupDio();
  runApp(const ProviderScope(child: MyApp()));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white,
      ),
      routerConfig: router,
    );
  }
}
