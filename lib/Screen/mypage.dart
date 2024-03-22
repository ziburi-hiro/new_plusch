import 'package:flutter/material.dart';
import 'package:plusch/Constants/colors.dart';
import 'package:plusch/Models/account.dart';
import 'package:plusch/utils/authentication.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  Account myAccount = Authentication.myAccount!;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('マイページ',style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
          automaticallyImplyLeading: false,
          backgroundColor: appbarColor,
        ),
        body: Text(myAccount.name),
      ),
    );
  }
}
