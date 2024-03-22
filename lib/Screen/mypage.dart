import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    var screenSize = MediaQuery.of(context).size;
    
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
        body: SingleChildScrollView(
          child: ScreenUtilInit(
            designSize: const Size(393, 852),
            child: Column(
              children: [
                ///アカウント情報
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Container(
                      height: screenSize.height*0.2,
                      width: screenSize.width*0.93,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey.shade300,
                      ),
                      child: Text(myAccount.name),
                    ),
                  ),
                ),

                ///自分の教育履歴
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Container(
                      height: screenSize.height*0.6,
                      width: screenSize.width*0.93,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey.shade300,
                      ),
                      child: Text(myAccount.name),
                    ),
                  ),
                ),

                ///アカウントメニュー
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Container(
                      height: screenSize.height*0.5,
                      width: screenSize.width*0.93,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey.shade300,
                      ),
                      child: Text(myAccount.name),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
