import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:froot_app/auth_pages/signin_page/signin_page2.dart';
import 'package:http/http.dart' as http;

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailVerifyController = TextEditingController();
  final RxBool isEmailFormValid = false.obs;
  bool _isNameValid = false;
  bool _isEmailValid = false;
  bool _isEmailNotDuplicated = false;
  bool _isEmailCodeValid = false;
  bool _isEmailCodeChecked = false;

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
                  '금융 선순환을\n시작해 볼까요?',
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
                    _isNameValid
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
                      child: TextField(
                        controller: nameController,
                        onChanged: (value) {
                          setState(() {
                            if (value != '')
                              _isNameValid = true;
                            else
                              _isNameValid = false;
                          });
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: '이름',
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
                    _isEmailValid && _isEmailNotDuplicated
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (!GetUtils.isEmail(value!))
                            return '올바른 이메일을 입력해 주세요.';
                          else
                            return null;
                        },
                        controller: emailController,
                        onChanged: (value) {
                          isEmailFormValid.value =
                              emailController.text.isNotEmpty &&
                                  GetUtils.isEmail(value!);
                          setState(() {
                            if (isEmailFormValid.value)
                              _isEmailValid = true;
                            else {
                              _isEmailValid = false;
                              _isEmailNotDuplicated = false;
                            }
                          });
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 70,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFF6A93BF),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: _isEmailValid
                      ? () async {
                          final url = Uri.parse('http://192.168.1.185:8080/check'); //서버 주소 넣으면 됨
                          final response = await http.post(url,
                              body: emailController.value.text);
                          print(response.body);
                          if (response.body == 'true') {
                            print("사용할 수 있는 이메일");
                            setState(() {
                              _isEmailNotDuplicated = true;
                            });
                          } else {
                            print("사용할 수 없는 이메일");
                          }
                        }
                      : null,
                  child: const Text('중복확인'),
                ),
                SizedBox(
                  width: 10,
                ),
                Visibility(
                  visible: _isEmailNotDuplicated,
                  child: Text(
                    '사용할 수 있는 이메일입니다.',
                    style: TextStyle(
                      color: Color(0XFF6A93BF),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    _isEmailCodeValid && _isEmailCodeChecked
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
                      child: TextField(
                        controller: emailVerifyController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            if (value != '')
                              _isEmailCodeValid = true;
                            else {
                              _isEmailCodeValid = false;
                              _isEmailCodeChecked = false;
                            }
                          });
                        },
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: '이메일 인증코드',
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      side: const BorderSide(
                        width: 1.0,
                        color: Colors.black38,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      '인증코드 발송',
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 10,
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
                  width: 70,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFF6A93BF),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: _isEmailCodeValid
                      ? () {
                          setState(() {
                            _isEmailCodeChecked = true;
                          });
                        }
                      : () {
                          setState(() {
                            _isEmailCodeChecked = false;
                          });
                        },
                  child: const Text('인증'),
                ),
                SizedBox(
                  width: 10,
                ),
                Visibility(
                  visible: _isEmailCodeChecked,
                  child: Text(
                    _isEmailCodeValid ? "인증되었습니다." : "인증코드가 틀립니다.",
                    style: TextStyle(
                      color: Color(0XFF6A93BF),
                    ),
                  ),
                ),
              ],
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
                child: const Text('다음'),
                onPressed:
                    _isNameValid && _isEmailNotDuplicated && _isEmailCodeChecked
                        ? () {
                            Get.to(SignInPage2());
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
