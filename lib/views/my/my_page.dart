import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:wadiz_clone/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wadiz_clone/view_model/login/login_view_model.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "my Page",
          ),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: AppColors.wadizGray[900],
          ),
        ),
        body: Consumer(builder: (context, ref, child) {
          final loginState = ref.watch(loginViewModelProvider);

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 430,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer(builder: (context, ref, child) {
                        if (loginState.isLogin) {
                          return Row(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: AppColors.bg,
                              ),
                              Gap(8),
                              Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${loginState.email}"),
                                  Gap(4),
                                  Text("${loginState.username}"),
                                ],
                              ),),
                            ],
                          );
                        }
                        return Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: AppColors.bg,
                            ),
                            Gap(8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    context.push("/login");
                                  },
                                  child: Row(
                                    children: [
                                      Text("로그인하기"),
                                      Icon(Icons.keyboard_arrow_right),
                                    ],
                                  ),
                                ),
                                Gap(4),
                                Text(
                                  "로그인 후 다양한 프로젝트에 참여해보세요.",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundColor: AppColors.wadizGray[200],
                            child: SvgPicture.asset(
                              "assets/icons/featured_seasonal_and_gifts.svg",
                              width: 28,
                              height: 28,
                              colorFilter: ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          Gap(20),
                          Text(
                            "새로운 도전을\n시작해보세요",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            ),
                          ),
                          Gap(20),
                          Text(
                            "개인 후원부터 제품, 콘텐츠, 서비스 출시, 성장까지 함께할께요.",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          // todo : 로그인 처리 확인
                          //todo : 프로젝트 추가화면으로 이동
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "프로젝트 만들기",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
