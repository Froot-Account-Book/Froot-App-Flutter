import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
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
                    Icons.check_circle_outline,
                    color: Colors.black.withOpacity(0.5),
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
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
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
