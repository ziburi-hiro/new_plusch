import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plusch/Constants/colors.dart';
import 'package:plusch/Firebase/user_firestore.dart';
import 'package:plusch/Models/account.dart';
import 'package:plusch/utils/authentication.dart';

class MemberRegisterPage extends StatefulWidget {
  const MemberRegisterPage({super.key});

  @override
  State<MemberRegisterPage> createState() => _MemberRegisterPageState();
}

class _MemberRegisterPageState extends State<MemberRegisterPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController repassController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();
  bool hidePassword = true;
  final userNameFormKey = GlobalKey<FormState>();
  final emailFormKey = GlobalKey<FormState>();
  final passFormKey = GlobalKey<FormState>();
  final repassFormKey = GlobalKey<FormState>();
  final postCodeFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('会員登録',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: appbarColor,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            children: [
              ///userName
              Form(
                key: userNameFormKey,
                child: TextFormField(
                  controller: userNameController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'ユーザ名',
                    labelText: 'User Name',
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'ユーザネームを入力してください';
                    }
                    return null;
                  },
                ),
              ),

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
                    helperText: '大文字小文字数字いずれかを含む8文字以上',
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
                    }else if(value.length < 8){
                      return '8文字以上で入力してください';
                    }
                    return null;
                  },
                ),
              ),

              ///repassword
              Form(
                key: repassFormKey,
                child: TextFormField(
                  controller: repassController,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.lock),
                    hintText: 'パスワードを再入力してください',
                    labelText: 'Re-Enter Password',
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
                      return '再度パスワードを入力してください';
                    }else if(value != passController.text){
                      return '入力されたパスワードと一致しません';
                    }
                    return null;
                  },
                ),
              ),

              ///PostCode
              Form(
                key: postCodeFormKey,
                child: TextFormField(
                  controller: postCodeController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_pin),
                    hintText: '郵便番号を入力（ハイフン無し）',
                    labelText: 'Post Code',
                  ),
                  maxLength: 7,
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return '郵便番号を入力してください';
                    }else if(value.length != 7){
                      return '正しく郵便番号を入力してください';
                    }
                    return null;
                  },
                ),
              ),

              ///登録ボタン
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  height: screenSize.height*0.05,
                  width: screenSize.width*0.5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                    ),
                    onPressed: () async {
                      if(userNameFormKey.currentState!.validate() &&
                          emailFormKey.currentState!.validate() &&
                          passFormKey.currentState!.validate() &&
                          repassFormKey.currentState!.validate() &&
                          postCodeFormKey.currentState!.validate()
                      ) {
                        var result = await Authentication.signUp(email: emailController.text, pass: passController.text);
                        if(result is UserCredential){
                          Account newAccount = Account(
                            id: result.user!.uid,
                            name: userNameController.text,
                            postCode: postCodeController.text,
                          );
                          var _result = await UserFireStore.setUser(newAccount);
                          if(_result == true){
                            if(!mounted) return;
                            print('登録完了');
                          }else {
                            Authentication.deleteUser();
                            // TODO エラーハンドリング実装
                          }
                        }else {
                          // TODO エラーハンドリング実装
                        }
                      }
                    },
                    child: const Text('登録',style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
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
