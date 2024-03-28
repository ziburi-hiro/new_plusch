import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plusch/Components/searchistorybutton.dart';
import 'package:plusch/Constants/colors.dart';

class SearchHistoryPage extends StatefulWidget {
  const SearchHistoryPage({super.key});

  @override
  State<SearchHistoryPage> createState() => _SearchHistoryPageState();
}

class _SearchHistoryPageState extends State<SearchHistoryPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: mainBackColor,
        appBar: AppBar(
          title: const Text('履歴検索',style: TextStyle(
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

                ///通っていた学校・就職先から検索
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 15.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.blue,
                      ),
                      Text('通っていた学校・就職先から検索',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HistorySearchButton(screenSize: screenSize, name: '幼稚園',),
                      HistorySearchButton(screenSize: screenSize, name: '小学校',),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HistorySearchButton(screenSize: screenSize, name: '中学校',),
                      HistorySearchButton(screenSize: screenSize, name: '高等学校',),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HistorySearchButton(screenSize: screenSize, name: '大学\n大学院',),
                      HistorySearchButton(screenSize: screenSize, name: '就職先',),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                ///習い事から検索
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 15.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.blue,
                      ),
                      Text('習い事から検索',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HistorySearchButton(screenSize: screenSize, name: '勉強系',),
                      HistorySearchButton(screenSize: screenSize, name: 'スポーツ系',),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HistorySearchButton(screenSize: screenSize, name: '芸術\n文化系',),
                      HistorySearchButton(screenSize: screenSize, name: 'その他',),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                ///LINEに飛ぶ
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text('教育の悩みを抱える保護者に相談する',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                    height: screenSize.height*0.2,
                    width: screenSize.width*0.7,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: const Column(
                        children: [
                          Text('LINEオープンチャット',style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}