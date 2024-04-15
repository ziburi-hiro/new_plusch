import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plusch/Constants/colors.dart';

class CheckInfoPage extends StatefulWidget {
  const CheckInfoPage({super.key});

  @override
  State<CheckInfoPage> createState() => _CheckInfoPageState();
}

class _CheckInfoPageState extends State<CheckInfoPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: mainBackColor,
      appBar: AppBar(
        title: const Text('checkinfo',style: TextStyle(
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
                          child: Text('a',style: const TextStyle(
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
                            child: Text('aaaa'),
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
                            child: Text('aaaa'),
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
                      initialRating: 3,
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

                        });
                      },
                    ),

                    Text('Rating: 3',style: const TextStyle(
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
                  child: Text('aaa'),
                ),
              ),

              ///編集・削除ボタン
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
                    onPressed: () {},
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
    );
  }
}
