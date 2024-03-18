import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plusch/Screen/login_page.dart';
import 'package:plusch/Screen/welcome_page.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plusch',
      debugShowCheckedModeBanner: false,
      navigatorObservers: [routeObserver],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.yuseiMagicTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      //home: const WelcomePage(),
      initialRoute: '/WelcomePage',
      routes: <String,WidgetBuilder> {
        ///オンボーディングのルート
        '/WelcomePage': (BuildContext context) => const WelcomePage(),
        '/LoginPage': (BuildContext context) => const LoginPage(),
      },
    );
  }
}
