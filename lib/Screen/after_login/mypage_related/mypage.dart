import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plusch/Components/schoolselectbutton.dart';
import 'package:plusch/Constants/colors.dart';
import 'package:plusch/Firebase/graduated_school_firestore.dart';
import 'package:plusch/Models/account.dart';
import 'package:plusch/Models/school.dart';
import 'package:plusch/Screen/after_login/mypage_related/settings.dart';
import 'package:plusch/utils/authentication.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  Account myAccount = Authentication.myAccount!;

  Future<Map> getGraduatedSchools() async {
    Map graduatedSchools = {};
    await GraduatedSchoolFireStore.getGraduatedSchool(myAccount, 'Kindergarten')
        .then((value) => graduatedSchools['Kindergarten'] = value);
    await GraduatedSchoolFireStore.getGraduatedSchool(myAccount, 'PrimarySchool')
        .then((value) => graduatedSchools['PrimarySchool'] = value);
    await GraduatedSchoolFireStore.getGraduatedSchool(myAccount, 'JuniorHighSchool')
        .then((value) => graduatedSchools['JuniorHighSchool'] = value);
    await GraduatedSchoolFireStore.getGraduatedSchool(myAccount, 'HighSchool')
        .then((value) => graduatedSchools['HighSchool'] = value);
    await GraduatedSchoolFireStore.getGraduatedSchool(myAccount, 'University')
        .then((value) => graduatedSchools['University'] = value);

    return graduatedSchools;
  }

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
            child: FutureBuilder(
              future: getGraduatedSchools(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done) {
                  return Column(
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
                                              setState(() {
                                                print(snapshot.data!['PrimarySchool']);
                                              });
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

                      ///自分の履歴
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 15.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('自分の履歴',style: TextStyle(
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
                                  SchoolSelectButton(screenSize: screenSize, kindOfSchool: '幼稚園', kindOfSchoolEng: 'Kindergarten', graduatedSchoolName: (snapshot.data!['Kindergarten'] != null) ? snapshot.data!['Kindergarten'].name : ''),
                                  SchoolSelectButton(screenSize: screenSize, kindOfSchool: '小学校', kindOfSchoolEng: 'PrimarySchool', graduatedSchoolName: (snapshot.data!['PrimarySchool'] != null) ? snapshot.data!['PrimarySchool'].name : '',),
                                  SchoolSelectButton(screenSize: screenSize, kindOfSchool: '中学校', kindOfSchoolEng: 'JuniorHighSchool', graduatedSchoolName: (snapshot.data!['JuniorHighSchool'] != null) ? snapshot.data!['JuniorHighSchool'].name : '',),
                                  SchoolSelectButton(screenSize: screenSize, kindOfSchool: '高等学校', kindOfSchoolEng: 'HighSchool', graduatedSchoolName: (snapshot.data!['HighSchool'] != null) ? snapshot.data!['HighSchool'].name : '',),
                                  SchoolSelectButton(screenSize: screenSize, kindOfSchool: '大学', kindOfSchoolEng: 'University', graduatedSchoolName: (snapshot.data!['University'] != null) ? snapshot.data!['University'].name : '',),
                                  SchoolSelectButton(screenSize: screenSize, kindOfSchool: '大学院', kindOfSchoolEng: 'GraduateSchool', graduatedSchoolName: (snapshot.data!['GraduateSchool'] != null) ? snapshot.data!['GraduateSchool'].name : '',),
                                  SchoolSelectButton(screenSize: screenSize, kindOfSchool: '就職先', kindOfSchoolEng: 'Employment', graduatedSchoolName: ''),
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
                              width: screenSize.width*0.93,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [

                                  ///設定
                                  SizedBox(
                                    height: screenSize.height*0.06,
                                    width: screenSize.width*0.93,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Settings(test)));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16),
                                            )
                                        ),
                                        backgroundColor: Colors.white,
                                      ),
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.settings,
                                            color: Colors.green,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10.0),
                                            child: Text('設定',style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                color: Colors.black
                                            ),),
                                          ),
                                          Spacer(),
                                          Text('>',style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Colors.black
                                          ),),
                                        ],
                                      ),
                                    ),
                                  ),

                                  ///機能改善
                                  SizedBox(
                                    height: screenSize.height*0.06,
                                    width: screenSize.width*0.93,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                        backgroundColor: Colors.white,
                                      ),
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.article,
                                            color: Colors.purple,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10.0),
                                            child: Text('機能改善リクエスト',style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                color: Colors.black
                                            ),),
                                          ),
                                          Spacer(),
                                          Text('>',style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Colors.black
                                          ),),
                                        ],
                                      ),
                                    ),
                                  ),

                                  ///お気に入り
                                  SizedBox(
                                    height: screenSize.height*0.06,
                                    width: screenSize.width*0.93,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                        backgroundColor: Colors.white,
                                      ),
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.favorite,
                                            color: Colors.redAccent,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10.0),
                                            child: Text('お気に入り',style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                color: Colors.black
                                            ),),
                                          ),
                                          Spacer(),
                                          Text('>',style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Colors.black
                                          ),),
                                        ],
                                      ),
                                    ),
                                  ),

                                  ///アカウント連携
                                  SizedBox(
                                    height: screenSize.height*0.06,
                                    width: screenSize.width*0.93,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                        backgroundColor: Colors.white,
                                      ),
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.people_alt,
                                            color: Colors.blue,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10.0),
                                            child: Text('アカウント連携',style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                color: Colors.black
                                            ),),
                                          ),
                                          Spacer(),
                                          Text('>',style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Colors.black
                                          ),),
                                        ],
                                      ),
                                    ),
                                  ),

                                  ///ログアウト
                                  SizedBox(
                                    height: screenSize.height*0.06,
                                    width: screenSize.width*0.93,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(16),
                                              bottomRight: Radius.circular(16),
                                            )
                                        ),
                                        backgroundColor: Colors.white,
                                      ),
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.logout,
                                            color: mainColor,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10.0),
                                            child: Text('ログアウト',style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                color: Colors.black
                                            ),),
                                          ),
                                          Spacer(),
                                          Text('>',style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Colors.black
                                          ),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}