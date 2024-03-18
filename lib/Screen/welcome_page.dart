import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: ScreenUtilInit(
        designSize: const Size(393, 852),
        child: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 10),
          child: Column(
            children: [
              ///Lottieアニメーション
              Lottie.asset(
                  'assets/welcom2.json',
                  errorBuilder: (context, error, stackTrace) {
                      return const Padding(
                        padding: EdgeInsets.all(10),
                        child: CircularProgressIndicator(),
                      );
                  }
              ),

              Expanded(
                child: SizedBox(
                  child: Column(
                    children: [

                      ///Pluschへようこそ
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text('Pluschへようこそ!!',style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.w900,
                          ),),
                        ),
                      ),

                      ///Plusch説明文
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: GoogleFonts.yuseiMagic(),
                              children: const [
                                TextSpan(
                                    text: 'プラスクは',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    )),
                                TextSpan(
                                    text: '様々な人の学歴・就職先',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    )),
                                TextSpan(
                                    text: 'を\n',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    )),
                                TextSpan(
                                    text: '閲覧できる',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    )),
                                TextSpan(
                                    text: '経歴参照アプリ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    )),
                                TextSpan(
                                    text: 'で\n',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    )),
                                TextSpan(
                                    text: '最適な',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    )),
                                TextSpan(
                                    text: 'モデルパーソン',
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    )),
                                TextSpan(
                                    text: 'を見つけられます',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ]),
                        ),
                      ),

                      SizedBox(
                        height: screenSize.height*0.10,
                      ),

                      ///利用規約
                      RichText(
                        text: TextSpan(
                            style: GoogleFonts.yuseiMagic(),
                            children: [
                              TextSpan(
                                text: '利用規約',
                                style: const TextStyle(
                                  color: Colors.redAccent,
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, '/TermsOfServicePage');
                                  }),
                              const TextSpan (
                                text: 'に同意して次へお進みください',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black
                                ),
                            ),
                          ]
                        ),
                      ),

                      ///会員登録ボタン
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0,bottom: 5.0),
                        child: SizedBox(
                          height: screenSize.height*0.05,
                          width: screenSize.width*0.8,
                          child: ElevatedButton(
                            onPressed: (){},
                            child: const Text(
                              '同意して会員登録',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900
                              ),
                            ),
                          ),
                        ),
                      ),

                      ///ログインボタン
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0,bottom: 5.0),
                        child: SizedBox(
                          height: screenSize.height*0.05,
                          width: screenSize.width*0.8,
                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.pushNamed(context, '/LoginPage');
                            },
                            child: const Text(
                              'ログイン',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
