import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plusch/Components/schoolselectbutton.dart';
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
        backgroundColor: mainBackColor,
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
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('マイアカウント',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Container(
                      width: screenSize.width*0.93,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 70.w,
                                  height: 70.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                  child: const Center(
                                    child: Text(
                                        'No Image'
                                    ),
                                  ),
                                ),
                                
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(myAccount.name,style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                      Text(myAccount.emailAddress,style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0,bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: '編集する＞',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45,
                                    ),
                                    recognizer: TapGestureRecognizer() ..onTap = () {
                                      print('編集タップド');
                                    }
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                ///自分の教育履歴
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('自分の教育履歴',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Container(
                      height: screenSize.height*0.6,
                      width: screenSize.width*0.93,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SchoolSelectButton(screenSize: screenSize, kindOfSchool: '幼稚園', kindOfSchoolEng: 'Kindergarten',),
                          SchoolSelectButton(screenSize: screenSize, kindOfSchool: '小学校', kindOfSchoolEng: 'PrimarySchool',),
                          SchoolSelectButton(screenSize: screenSize, kindOfSchool: '中学校', kindOfSchoolEng: 'JuniorHighSchool',),
                          SchoolSelectButton(screenSize: screenSize, kindOfSchool: '高等学校', kindOfSchoolEng: 'HighSchool',),
                          SchoolSelectButton(screenSize: screenSize, kindOfSchool: '大学', kindOfSchoolEng: 'University',),
                          SchoolSelectButton(screenSize: screenSize, kindOfSchool: '大学院', kindOfSchoolEng: 'GraduateSchool',),
                          SchoolSelectButton(screenSize: screenSize, kindOfSchool: '習い事', kindOfSchoolEng: 'Kindergarten',),
                        ],
                      )
                    ),
                  ),
                ),

                ///アカウントメニュー
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('メニュー',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Container(
                      height: screenSize.height*0.5,
                      width: screenSize.width*0.93,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
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