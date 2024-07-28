import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:wadiz_clone/model/project/project_model.dart';
import 'package:wadiz_clone/theme.dart';

class ProjectDetailPage extends StatefulWidget {
  final String project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  late ProjectItemModel projectItemModel;
  ValueNotifier<bool> isMore = ValueNotifier(false);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isMore.dispose();
  }

  @override
  void initState() {
    super.initState();
    projectItemModel = ProjectItemModel.fromJson(
      json.decode(
        widget.project,
      ),
    );
    print(widget.project);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.go("/home");
            },
            icon: SvgPicture.asset(
              "assets/icons/home_outlined.svg",
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  projectItemModel.thumbnail ?? "",
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(.2),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: isMore,
                builder: (context, value, child) {
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: SingleChildScrollView(
                          physics: !value
                              ? NeverScrollableScrollPhysics()
                              : BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                child: _ProjectWidget(
                                  data: projectItemModel,
                                ),
                              ),
                              Divider(
                                color: AppColors.bg,
                                height: 12,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "프로젝트 스토리",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Gap(12),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.newBg,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.all(16),
                                      child: Text("도서산간에 해당하는 서포터님은 배송가능 여부를 "
                                          "반드시 메이커에게 문의 후 참여해주세요."),
                                    ),
                                    Gap(12),
                                    Image.asset(
                                      width: double.infinity,
                                      "assets/image/advertising_image.png",
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (!value)
                        Positioned(
                          left: 16,
                          right: 16,
                          bottom: 0,
                          child: Container(
                            height: 20,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  Colors.white,
                                  Colors.white,
                                  Colors.white,
                                  Colors.white,
                                  Colors.white.withOpacity(.1),
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                      if (!value)
                        Positioned(
                          left: 16,
                          right: 16,
                          bottom: 16,
                          child: GestureDetector(
                            onTap: () {
                              isMore.value = true;
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "스토리 더보기",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  Gap(12),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppColors.primaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                }),
          )
        ],
      ),
      bottomNavigationBar: _BottomAppBar(),
    );
  }
}

class _ProjectWidget extends StatelessWidget {

  final ProjectItemModel data;
  const _ProjectWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(data.type ?? ""),
            Icon(
              Icons.keyboard_arrow_right,
            ),
          ],
        ),
        Gap(12),
        Text(
          "${data.title}",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Gap(
          12,
        ),
        Row(
          children: [
            Text(
              '${NumberFormat("####,####,####").format((data.totalFunded ?? 0) / (data.price ?? 1) * 100)} % 달성',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: AppColors.primaryColor,
              ),
            ),
            Gap(12),
            Container(
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius:
                BorderRadius.circular(3),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: 6, vertical: 4),
              child: Text(
                "${DateTime.parse(data.deadline ?? "").difference(DateTime.now()).inDays}일 남음",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
        Gap(12),
        Row(
          children: [
            Text(
              "${NumberFormat.currency(locale: "ko_KR", symbol: "₩").format(data.totalFunded)} 원 달성",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gap(12),
            Container(
              decoration: BoxDecoration(
                color: AppColors.bg,
                borderRadius:
                BorderRadius.circular(3),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: 6),
              child: Text(
                "${data.totalFundedCount} 명 참여",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}


class _BottomAppBar extends StatelessWidget {
  const _BottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 79,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      padding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey[300]!,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
        child: Row(
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border),
                ),
                Text("1만+"),
              ],
            ),
            Gap(12),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                height: 40,
                child: Center(
                  child: Text(
                    "펀딩하기",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
