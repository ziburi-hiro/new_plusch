import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plusch/Components/TabBar.dart';
import 'package:plusch/Screen/after_login/home_related/home_page.dart';
import 'package:plusch/Screen/after_login/mypage_related/enter_info_page.dart';
import 'package:plusch/Screen/after_login/mypage_related/mypage.dart';
import 'package:plusch/Screen/after_login/mypage_related/settings.dart';
import 'package:plusch/Screen/after_login/search_history_related/search_history_page.dart';
import 'package:plusch/Screen/before_login/login_page.dart';
import 'package:plusch/Screen/before_login/member_register_page.dart';
import 'package:plusch/Screen/before_login/welcome_page.dart';
import 'package:plusch/firebase_options.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const WelcomePage(),
    );
  }
}
