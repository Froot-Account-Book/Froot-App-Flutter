import 'package:flutter/material.dart';
import 'package:froot_app/main_navigation/main_navigation.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SignInPage2 extends StatefulWidget {
  SignInPage2({Key? key}) : super(key: key);

  @override
  State<SignInPage2> createState() => _SignInPage2State();
}

class _SignInPage2State extends State<SignInPage2> {
  @override
  final TextEditingController yearController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController dayController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordCheckController = TextEditingController();
  bool _isYearValid = false;
  bool _isMonthValid = false;
  bool _isDayValid = false;
  bool _isPasswdValid = false;
  bool _isPasswdCheckValid = false;
  int _gender = -1; //0:male,1:female
  bool _isObscure = true;
  String _firstPasswd = '';
  RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,20}$');
  bool isAllValid() {
    if (_isYearValid &&
        _isMonthValid &&
        _isDayValid &&
        _gender != -1 &&
        _isPasswdValid &&
        _isPasswdCheckValid)
      return true;
    else
      return false;
  }

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
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/heart.png'),
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
                  '남은 정보를\n기입해 주세요',
                  style: TextStyle(
                    fontSize: 24,
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
                    _isYearValid && _isMonthValid && _isDayValid
                        ? Icons.check_circle_outline
                        : Icons.radio_button_unchecked,
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
                        controller: yearController,
                        onChanged: (value) {
                          setState(() {
                            if (GetUtils.isNumericOnly(value))
                              _isYearValid = true;
                            else
                              _isYearValid = false;
                          });
                        },
                        keyboardType: TextInputType.datetime,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (!GetUtils.isNumericOnly(value!))
                            return '숫자만 입력가능';
                          else
                            return null;
                        },
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: '태어난 연도',
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
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 80,
                      child: TextFormField(
                        controller: monthController,
                        onChanged: (value) {
                          setState(() {
                            if (GetUtils.isNumericOnly(value))
                              _isMonthValid = true;
                            else
                              _isMonthValid = false;
                          });
                        },
                        keyboardType: TextInputType.datetime,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (!GetUtils.isNumericOnly(value!))
                            return '숫자만 입력가능';
                          else
                            return null;
                        },
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: '월',
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
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 80,
                      child: TextFormField(
                        controller: dayController,
                        onChanged: (value) {
                          setState(() {
                            if (GetUtils.isNumericOnly(value))
                              _isDayValid = true;
                            else
                              _isDayValid = false;
                          });
                        },
                        keyboardType: TextInputType.datetime,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (!GetUtils.isNumericOnly(value!))
                            return '숫자만 입력가능';
                          else
                            return null;
                        },
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: '일',
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
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: Row(
                children: [
                  Icon(
                    _gender != -1
                        ? Icons.check_circle_outline
                        : Icons.radio_button_unchecked,
                    color: Colors.black.withOpacity(0.5),
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ToggleSwitch(
                    initialLabelIndex: _gender,
                    totalSwitches: 2,
                    labels: ['남자', '여자'],
                    cornerRadius: 0,
                    activeFgColor: Colors.white,
                    activeBgColor: [
                      Color(0XFF6A93BF),
                    ],
                    inactiveBgColor: Colors.white,
                    inactiveFgColor: Colors.grey,
                    borderColor: [
                      Color(0XFF6A93BF),
                    ],
                    borderWidth: 1,
                    minWidth: 125,
                    minHeight: 30,
                    onToggle: (index) {
                      _gender = index!;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: Row(
                children: [
                  Icon(
                    _isPasswdValid
                        ? Icons.check_circle_outline
                        : Icons.radio_button_unchecked,
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
                          setState(() {
                            if (regex.hasMatch(value!))
                              _isPasswdValid = true;
                            else
                              _isPasswdValid = false;
                            _firstPasswd = value;
                          });
                        },
                        obscureText: _isObscure,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (!regex.hasMatch(value!))
                            return '6~20자, 영문 대소문자와 숫자 포함';
                          else
                            return null;
                        },
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
            Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: Row(
                children: [
                  Icon(
                    _isPasswdCheckValid
                        ? Icons.check_circle_outline
                        : Icons.radio_button_unchecked,
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
                        controller: passwordCheckController,
                        onChanged: (value) {
                          setState(() {
                            if (value != '' && value == _firstPasswd)
                              _isPasswdCheckValid = true;
                            else
                              _isPasswdCheckValid = false;
                          });
                        },
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value != _firstPasswd)
                            return '비밀번호가 서로 일치하지 않습니다';
                          else
                            return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: '비밀번호 확인',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0XFF6A93BF)),
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
            Container(
              height: 100,
              padding: const EdgeInsets.all(30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Color(0XFF6A93BF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: const Text('회원가입'),
                onPressed: isAllValid()
                    ? () {
                        Get.to(MainNavigation());
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
