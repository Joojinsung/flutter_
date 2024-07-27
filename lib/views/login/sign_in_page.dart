import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:wadiz_clone/theme.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "로그인",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: AppColors.wadizGray[900],
              ),
            ),
            Gap(32),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "이메일",
                    ),
                  ),
                  Gap(20),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: "비밀번호 입력",
                    ),
                  ),
                  Gap(8),
                  ButtonBar(
                    children: [
                      TextButton(
                        onPressed: () {
                        },
                        child: Text(
                          "로그인 정보를 잊으셨나요?",
                          style: TextStyle(
                            color: AppColors.wadizGray[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(24),
                  GestureDetector(
                    onTap: () async {},
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "이메일로 로그인하기",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "아직 계정이 없나요",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.wadizGray[900],
                        ),
                      ),
                      TextButton(
                        onPressed: () {

                          context.push("/sign-up");
                        },
                        child: Text("회원가입"),
                        style: TextButton.styleFrom(
                            foregroundColor: AppColors.primaryColor,
                            textStyle: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
