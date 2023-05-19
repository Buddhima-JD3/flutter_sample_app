import 'package:beamer/beamer.dart';
import 'package:beamer_compo_app/pages/dashboard.dart';
import 'package:beamer_compo_app/pages/login/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) => LoginScreen(),
        '/dashboard': (context, state, data) => Dashboard(),
      },
    ),
  );

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
    );
  }
}


