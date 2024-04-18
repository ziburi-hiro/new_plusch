import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plusch/Constants/colors.dart';
import 'package:plusch/Firebase/graduated_school_firestore.dart';
import 'package:plusch/Models/account.dart';
import 'package:plusch/Screen/after_login/mypage_related/register_history/edit_history_page.dart';
import 'package:plusch/utils/authentication.dart';

class CheckInfoPage extends StatefulWidget {
  CheckInfoPage(this.schoolInfo,{super.key});

  Map schoolInfo;

  @override
  State<CheckInfoPage> createState() => _CheckInfoPageState();
}

class _CheckInfoPageState extends State<CheckInfoPage> {
  Account myAccount = Authentication.myAccount!;

  Future<Map> getGraduatedSchools() async {
    Map graduatedSchools = {};
    await GraduatedSchoolFireStore.getGraduatedSchoolDetail(myAccount, 'Kindergarten')
        .then((value) => graduatedSchools['Kindergarten'] = value);
    await GraduatedSchoolFireStore.getGraduatedSchoolDetail(myAccount, 'PrimarySchool')
        .then((value) => graduatedSchools['PrimarySchool'] = value);
    await GraduatedSchoolFireStore.getGraduatedSchoolDetail(myAccount, 'JuniorHighSchool')
        .then((value) => graduatedSchools['JuniorHighSchool'] = value);
    await GraduatedSchoolFireStore.getGraduatedSchoolDetail(myAccount, 'HighSchool')
        .then((value) => graduatedSchools['HighSchool'] = value);
    await GraduatedSchoolFireStore.getGraduatedSchoolDetail(myAccount, 'University')
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
          title: Text('${widget.schoolInfo['school']}の登録データ',style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context,widget.schoolInfo['schoolName']);
            },
            icon: const Icon(Icons.close),
            color: Colors.white,
          ),
          backgroundColor: appbarColor,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: ScreenUtilInit(
            designSize: const Size(393, 852),
            child: FutureBuilder(
              future: getGraduatedSchools(),
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  return Column(
                    children: [

                      ///学校名
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 15.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('通っていた学校',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            ///登録されている学校名を表示
                            Container(
                              width: screenSize.width*0.9,
                              height: screenSize.height*0.05,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: FittedBox(
                                  child: Text(widget.schoolInfo['schoolName'],style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),),
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),

                      ///在学期間
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 15.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('通っていた期間を選択',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: screenSize.width*0.43,
                              child: Column(
                                children: [
                                  const Text('入学年',style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),),
                                  Container(
                                    width: screenSize.width*0.30,
                                    height: screenSize.height*0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(snapshot.data![widget.schoolInfo['schoolEng']]['enrollment_year'],style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),),
                                    ),
                                  )
                                ],
                              ),
                            ),

                            const Text('\n〜',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),),

                            SizedBox(
                              width: screenSize.width*0.43,
                              child: Column(
                                children: [
                                  const Text('卒業年',style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),),
                                  Container(
                                    width: screenSize.width*0.30,
                                    height: screenSize.height*0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(snapshot.data![widget.schoolInfo['schoolEng']]['graduation_year'],style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      ///評価
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 15.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('学校の評価',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            RatingBar.builder(
                              initialRating: snapshot.data![widget.schoolInfo['schoolEng']]['rate'] as double,
                              minRating: 1,
                              allowHalfRating: true,
                              itemCount: 5,
                              updateOnDrag: true,
                              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              ignoreGestures: true,
                              onRatingUpdate: (rating) {},
                            ),

                            Text('Rating: ${snapshot.data![widget.schoolInfo['schoolEng']]['rate']}',style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),),
                          ],
                        ),
                      ),

                      ///評価理由
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 15.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('評価理由',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        ),
                      ),

                      ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: screenSize.height*0.1
                        ),
                        child: Container(
                          width: screenSize.width*0.90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(snapshot.data![widget.schoolInfo['schoolEng']]['reason'],style: const TextStyle(
                              fontSize: 16,
                            ),),
                          ),
                        ),
                      ),

                      ///編集・削除ボタン
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ///編集ボタン
                            SizedBox(
                              width: screenSize.width*0.4,
                              height: screenSize.height*0.05,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  backgroundColor: buttonColor,
                                ),
                                onPressed: () {
                                  Map schoolInfo = {
                                    'schoolType' : widget.schoolInfo['school'],
                                    'schoolTypeEng' : widget.schoolInfo['schoolEng'],
                                    'schoolName' : widget.schoolInfo['schoolName'],
                                    'schoolId': snapshot.data![widget.schoolInfo['schoolEng']]['school_id'],
                                    'enrollment_year' : snapshot.data![widget.schoolInfo['schoolEng']]['enrollment_year'],
                                    'graduation_year' : snapshot.data![widget.schoolInfo['schoolEng']]['graduation_year'],
                                    'rate' : snapshot.data![widget.schoolInfo['schoolEng']]['rate'],
                                    'reason' : snapshot.data![widget.schoolInfo['schoolEng']]['reason'],
                                  };

                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => EditHistoryPage(schoolInfo))
                                  );
                                },
                                child: const Text('編集',style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),),
                              ),
                            ),

                            const SizedBox(
                              width: 20,
                            ),

                            ///削除ボタン
                            SizedBox(
                              width: screenSize.width*0.4,
                              height: screenSize.height*0.05,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  backgroundColor: buttonColor,
                                ),
                                onPressed: () {
                                  GraduatedSchoolFireStore.deleteSchool(myAccount, widget.schoolInfo['schoolEng']);
                                  Navigator.pop(context,'');
                                },
                                child: const Text('削除',style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }
            ),
          ),
        ),
      ),
    );
  }
}
