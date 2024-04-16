import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plusch/Constants/colors.dart';
import 'package:plusch/Firebase/graduated_school_firestore.dart';
import 'package:plusch/Models/YearMonthModel.dart';
import 'package:plusch/Screen/after_login/mypage_related/register_history/prefectures_select_page.dart';
import 'package:plusch/utils/authentication.dart';

class EditHistoryPage extends StatefulWidget {
  EditHistoryPage(this.schoolInfo,{super.key});

  Map schoolInfo;

  @override
  State<EditHistoryPage> createState() => _EditHistoryPageState();
}

class _EditHistoryPageState extends State<EditHistoryPage> {

  TextEditingController reviewController = TextEditingController();
  final reviewFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      reviewController = TextEditingController(text: widget.schoolInfo['reason']);
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: mainBackColor,
        appBar: AppBar(
          title: Text('${widget.schoolInfo['schoolType']}データを編集',style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
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

                      ///選択していた学校名を表示
                      Container(
                        width: screenSize.width*0.9,
                        height: screenSize.height*0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: (widget.schoolInfo['schoolName'] != '') ?
                          FittedBox(
                            child: Text(widget.schoolInfo['schoolName'],style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),),
                          )
                              :
                          const Text('学校を選択してください',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),),
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
                            await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PrefecturesSelectPage(widget.schoolInfo['schoolTypeEng']),
                                )
                            ).then((value) {
                              setState(() {
                                widget.schoolInfo['schoolName'] = value[0];
                                widget.schoolInfo['schoolId'] = value[1];
                              });
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
                                      widget.schoolInfo['enrollment_year'] = '${date.year}年${date.month}月';
                                    });
                                  },
                                  locale: LocaleType.jp,
                                );
                              },
                              child: Text(widget.schoolInfo['enrollment_year'],style: const TextStyle(
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
                                      widget.schoolInfo['graduation_year'] = '${date.year}年${date.month}月';
                                    });
                                  },
                                  locale: LocaleType.jp,
                                );
                              },
                              child: Text(widget.schoolInfo['graduation_year'],style: const TextStyle(
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
                  child: Column(
                    children: [
                      RatingBar.builder(
                        initialRating: widget.schoolInfo['rate'],
                        minRating: 1,
                        allowHalfRating: true,
                        itemCount: 5,
                        updateOnDrag: true,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            widget.schoolInfo['rate'] = rating;
                          });
                        },
                      ),

                      Text('Rating : ${widget.schoolInfo['rate']}',style: const TextStyle(
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

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: reviewFormKey,
                    child: SizedBox(
                      width: screenSize.width*0.9,
                      height: screenSize.height*0.2,
                      child: TextFormField(
                        controller: reviewController,
                        maxLines: 10,
                        maxLength: 300,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          hintText: '評価理由を入力',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(5)),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return '評価理由を入力してください';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),

                ///登録ボタン
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: screenSize.width*0.6,
                    height: screenSize.height*0.05,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: buttonColor,
                      ),
                      onPressed: () {
                        if(widget.schoolInfo['schoolName'] != '' &&
                            reviewFormKey.currentState!.validate()
                        ){
                          Map school = {
                            'type': widget.schoolInfo['schoolTypeEng'],
                            'schoolId': widget.schoolInfo['schoolId'],
                            'enrollmentYear': widget.schoolInfo['enrollment_year'],
                            'graduationYear': widget.schoolInfo['graduation_year'],
                            'rate': widget.schoolInfo['rate'],
                            'reason': reviewController.text,
                          };
                          GraduatedSchoolFireStore.setSchool(Authentication.myAccount!, school);
                          Navigator.pop(context);
                          Navigator.pop(context,widget.schoolInfo['schoolName']);
                        }
                      },
                      child: const Text('情報登録',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),),
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
