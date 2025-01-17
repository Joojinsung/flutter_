import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../theme.dart';
import '../../view_model/home/home_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final numberFormat = NumberFormat("###,###,###,###");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 324,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: TextFormField(
                              onTap: () {},
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: AppColors.wadizGray[100]!,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: AppColors.wadizGray[100]!,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                hintText: "새로운 일상이 필요하신가요?",
                                suffixIcon: Icon(Icons.search),
                                suffixIconColor: AppColors.wadizGray[400],
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.notifications_none),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 14),
                      child: Consumer(builder: (context, ref, child) {
                        final categories =
                            ref.watch(fetchHomeCategoriesProvider);

                        return switch (categories) {
                          AsyncData(:final value) => GridView.builder(
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 12,
                                      mainAxisSpacing: 0),
                              itemCount: value.length,
                              itemBuilder: (context, index) {
                                final data = value[index];
                                return InkWell(
                                  onTap: () {
                                    context.push("/home/category/${data.id}");
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 38,
                                        backgroundColor: AppColors.bg,
                                        child: Image.asset(
                                          data.iconPath ?? "",
                                          height: 42,
                                          width: 42,
                                        ),
                                      ),
                                      Gap(4),
                                      Text(data.title ?? "??"),
                                    ],
                                  ),
                                );
                              },
                            ),
                          AsyncError(:final error) =>
                            Text("${error.toString()}"),
                          _ => Center(
                              child: CircularProgressIndicator(),
                            ),
                        };
                      }),
                    ),
                  ),
                  Container(
                    width: 48,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.bg,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Gap(12),
                ],
              ),
            ),
            Gap(12),
            Expanded(
              child: Consumer(builder: (context, ref, child) {
                // final project =
                //     ref.watch(homeViewModelProvider.notifier).fetchHomeData();
                final homeData = ref.watch(fetchHomeProjectProvider);
                return homeData.when(
                  data: (data) {
                    if (data?.projects.isEmpty ?? true) {
                      return Column(
                        children: [
                          Text("정보가 없습니다"),
                          TextButton(onPressed: () {}, child: Text("새로고침"))
                        ],
                      );
                    }
                    return Container(
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          final project = data.projects[index];
                          return InkWell(
                            onTap: () {
                              context.push(
                                "/detail",
                                extra: json.encode(
                                  project.toJson(),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  bottom: 8, left: 16, right: 16, top: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 8),
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 30,
                                    spreadRadius: 4,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 220,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                          project?.thumbnail ?? "",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          project?.isOpen == "close"
                                              ? "${numberFormat.format(project?.waitlistCount)} 명이 기다려요"
                                              : "${numberFormat.format(project?.totalFundedCount)} 명이 인증했어요",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                        Gap(8),
                                        Text(project?.title ??
                                            "아이돌 관리비법 | 준비 안된 얼굴라인도 살리는 세럼,"),
                                        Gap(16),
                                        Text(
                                          project?.owner ?? "세상에 없던 브랜드",
                                          style: TextStyle(
                                            color: AppColors.wadizGray[500],
                                          ),
                                        ),
                                        Gap(16),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.bg,
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 4,
                                          ),
                                          child: Text(
                                            project?.isOpen == "close"
                                                ? "오픈예정"
                                                : "바로구매",
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  error: (error, trach) => Text("${error.toString()}"),
                  loading: () => Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                // return FutureBuilder(
                //   future: project,
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       final data = snapshot.data;
                //
                //     }
                //     return Center(
                //       child: CircularProgressIndicator(),
                //     );
                //   },
                // );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
