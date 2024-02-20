import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/db.dart';
import 'package:weather_app/mobile/router/auth_guard.dart';
import 'package:weather_app/mobile/router/router.dart';

//ignore_for_file: public_member_api_docs

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // hello word!!
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authService = AuthService();

  final _rootRouter = RootRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _rootRouter.config(),
      theme: ThemeData.dark().copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
      ),
      builder: (_, router) {
        return ChangeNotifierProvider<AuthService>(
          create: (_) => authService,
          child: BooksDBProvider(
            child: router!,
          ),
        );
      },
    );
  }
}
