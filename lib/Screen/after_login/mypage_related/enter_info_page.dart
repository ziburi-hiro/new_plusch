import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plusch/Constants/colors.dart';
import 'package:plusch/Models/YearMonthModel.dart';
import 'package:plusch/Screen/after_login/mypage_related/prefectures_select_page.dart';

class EnterInfoPage extends StatefulWidget {
  EnterInfoPage(this.kindOfSchool , {super.key});

  Map kindOfSchool;

  @override
  State<EnterInfoPage> createState() => _EnterInfoPageState();
}

class _EnterInfoPageState extends State<EnterInfoPage> {
  String enrollmentYear = '入学年を選択';
  String graduationYear = '卒業年を選択';
  String schoolName = '';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: mainBackColor,
      appBar: AppBar(
        title: Text('${widget.kindOfSchool['school']}の情報を入力',style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: appbarColor,
      ),

      body: SingleChildScrollView(
        child: ScreenUtilInit(
          designSize: const Size(393, 852),
          child: Column(
            children: [

              ///学校名
              const Padding(
                padding: EdgeInsets.only(top: 10.0, left: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('通っていた学校を選択',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [

                    ///選択された学校名を表示
                    Visibility(
                      visible: (schoolName != ''),
                      child: Container(
                        width: screenSize.width*0.9,
                        height: screenSize.height*0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Text(schoolName.toString(),style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    ///学校選択ボタン
                    SizedBox(
                      width: screenSize.width*0.7,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          backgroundColor: buttonColor,
                        ),
                        onPressed: () async {
                          schoolName = await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PrefecturesSelectPage(widget.kindOfSchool['schoolEng']),
                                //fullscreenDialog: true,
                              )
                          ).then((value) {
                            setState(() {});
                            return value;
                          });
                        },
                        child: const Text('都道府県から学校を選択',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),),
                      ),
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor: buttonColor,
                            ),
                            onPressed: () {
                              DatePicker.showPicker(
                                context,
                                showTitleActions: true,
                                pickerModel: YearMonthModel(
                                    currentTime: DateTime.now(),
                                    minTime: DateTime(1980,1,1),
                                    maxTime: DateTime.now(),
                                    locale: LocaleType.jp
                                ),
                                onConfirm: (date) {
                                  setState(() {
                                    enrollmentYear = '${date.year}年${date.month}月';
                                  });
                                },
                                locale: LocaleType.jp,
                              );
                            },
                            child: Text(enrollmentYear,style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),),
                          ),
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor: buttonColor,
                            ),
                            onPressed: () {
                              DatePicker.showPicker(
                                context,
                                showTitleActions: true,
                                pickerModel: YearMonthModel(
                                    currentTime: DateTime.now(),
                                    minTime: DateTime(1980,1,1),
                                    maxTime: DateTime.now(),
                                    locale: LocaleType.jp
                                ),
                                onConfirm: (date) {
                                  setState(() {
                                    graduationYear = '${date.year}年${date.month}月';
                                  });
                                },
                                locale: LocaleType.jp,
                              );
                            },
                            child: Text(graduationYear,style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),),
                          ),
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
                child: Container(
                  height: screenSize.height*0.2,
                  width: screenSize.width*0.93,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: const Text('学校の評価'),
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

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: screenSize.height*0.2,
                  width: screenSize.width*0.93,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: const Text('学校の評価理由'),
                ),
              ),

              ///特記事項
              const Padding(
                padding: EdgeInsets.only(top: 10.0, left: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('自由記述',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: screenSize.height*0.2,
                  width: screenSize.width*0.93,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: const Text('自由記述'),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
