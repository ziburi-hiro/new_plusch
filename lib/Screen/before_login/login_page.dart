import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plusch/Constants/colors.dart';
import 'package:plusch/Firebase/user_firestore.dart';
import 'package:plusch/utils/authentication.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool hidePassword = true;
  final emailFormKey = GlobalKey<FormState>();
  final passFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: appbarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              ///email
              Form(
                key: emailFormKey,
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.mail),
                    hintText: 'hogehoge@qmail.com',
                    labelText: 'Email Address',
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'メールアドレスを入力してください';
                    }
                    return null;
                  },
                ),
              ),

              ///password
              Form(
                key: passFormKey,
                child: TextFormField(
                  controller: passController,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.lock),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        hidePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'パスワードを入力してください';
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                height: screenSize.height*0.05,
                width: screenSize.width*0.5,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                  ),
                  onPressed: () async {
                    if(emailFormKey.currentState!.validate() &&
                        passFormKey.currentState!.validate()) {
                      var result = await Authentication.emailSignIn(email: emailController.text, pass: passController.text);
                      if(result is UserCredential){
                        var _result = await UserFireStore.getUser(result.user!.uid);
                        if(_result == true){
                          Navigator.pushNamed(context, '/TabBarPage');
                        }else{
                          // TODO エラーハンドリング実装
                        }
                      }else{
                        // TODO エラーハンドリング実装
                      }
                      //Navigator.of(context).pop();
                    }
                  },
                  child: const Text('ログイン',style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
