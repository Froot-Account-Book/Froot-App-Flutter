import 'package:flutter/material.dart';
import 'package:froot_app/main_navigation/main_navigation.dart';
import 'package:froot_app/auth_pages/signin_page/signin_page.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isFormValid = false.obs;
  bool _isObscure = true;
  bool _isAutoLoginChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black.withOpacity(0.7),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/user.png'),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  '로그인',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.fingerprint,
                    color: Colors.black.withOpacity(0.5),
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 80,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (!GetUtils.isEmail(value!))
                            return '올바른 이메일을 입력해 주세요.';
                          else
                            return null;
                        },
                        controller: emailController,
                        onChanged: (value) {
                          isFormValid.value = emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty &&
                              GetUtils.isEmail(value!);
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(
                            fontSize: 10,
                          ),
                          border: UnderlineInputBorder(),
                          labelText: '이메일',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0XFF6A93BF),
                            ),
                          ),
                          floatingLabelStyle: TextStyle(
                            fontSize: 12,
                            color: Color(0XFF6A93BF),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.black.withOpacity(0.5),
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      child: TextFormField(
                        controller: passwordController,
                        onChanged: (value) {
                          isFormValid.value = emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty;
                        },
                        obscureText: _isObscure,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: '비밀번호',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0XFF6A93BF)),
                          ),
                          floatingLabelStyle: TextStyle(
                            fontSize: 12,
                            color: Color(0XFF6A93BF),
                          ),
                          suffixIcon: IconButton(
                            icon: _isObscure
                                ? Icon(
                                    Icons.visibility,
                                    color: Colors.black26,
                                    size: 18,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: Colors.black26,
                                    size: 18,
                                  ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            splashRadius: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Checkbox(
                  value: _isAutoLoginChecked,
                  onChanged: (value) {
                    setState(() {
                      _isAutoLoginChecked = value!;
                    });
                  },
                  activeColor: Colors.black38,
                  splashRadius: 0,
                ),
                Text(
                  '자동 로그인',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
            Container(
              height: 100,
              padding: const EdgeInsets.all(30),
              child: Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Color(0XFF6A93BF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: const Text('로그인'),
                  onPressed: isFormValid.value
                      ? () {
                          Get.to(MainNavigation());
                        }
                      : null,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(SignInPage());
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.transparent,
                  ),
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                      color: Color(0XFF6A93BF),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.transparent,
                  ),
                  child: Text(
                    '비밀번호 찾기',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
