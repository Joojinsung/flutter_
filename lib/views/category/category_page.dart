import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:wadiz_clone/theme.dart';
import 'package:wadiz_clone/view_model/category/category_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryPage extends ConsumerStatefulWidget {
  final String categoryId;

  const CategoryPage({super.key, required this.categoryId});

  @override
  ConsumerState<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(categoryViewModelProvider.notifier)
          .fetchProjects(widget.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("카테고리"),
        actions: [
          IconButton(
            onPressed: () {},
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
          SizedBox(
            height: 204,
            child: Consumer(builder: (context, ref, child) {
              final datas =
                  ref.watch(fetchCategoryProjectsProvider(widget.categoryId));
              return datas.when(
                  data: (data) {
                    final titleProject = data
                        .projects[Random().nextInt((data.projects.length) - 1)];
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[800]!,
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                titleProject.thumbnail ?? ""),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(.2),
                                BlendMode.darken)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${titleProject.title}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Gap(12),
                          Text(
                            "${titleProject.description}",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Gap(16),
                          Container(
                            height: 4,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  error: (error, trace) {
                    return Text("${error.toString()}");
                  },
                  loading: () => Center(
                        child: CircularProgressIndicator(),
                      ));
            }),
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
            child: Consumer(builder: (context, ref, child) {
              final types = ref.watch(fetchTypeTabsProvider);
              return types.when(data: (data) {
                return Consumer(builder: (context, ref, child) {
                  final vm = ref.watch(categoryViewModelProvider);

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final tab = data[index];
                      return GestureDetector(
                        onTap: () {
                          ref
                              .read(categoryViewModelProvider.notifier)
                              .updateType(tab);
                          ref
                              .read(categoryViewModelProvider.notifier)
                              .fetchProjects(widget.categoryId);
                          // 데이터 가져오는 것 추가
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 32,
                          ),
                          child: IntrinsicWidth(
                            child: Column(
                              children: [
                                Gap(8),
                                SvgPicture.asset(
                                  tab.imagePath ?? "",
                                  width: 24,
                                  height: 24,
                                ),
                                Gap(12),
                                Text(
                                  "${tab.type}",
                                  style: TextStyle(
                                    fontWeight:
                                        vm.selectedType?.type == tab.type
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                  ),
                                ),
                                Gap(12),
                                Container(
                                  height: 6,
                                  color: vm.selectedType?.type == tab.type
                                      ? Colors.black
                                      : Colors.transparent,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                });
              }, error: (error, tract) {
                return Center(
                  child: Text("${error.toString()}"),
                );
              }, loading: () {
                return Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              });
            }),
          ),
          Divider(
            height: 0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Consumer(builder: (context, ref, child) {
                final projects = ref
                    .watch(
                      categoryViewModelProvider,
                    )
                    .projectState;
                return projects.when(
                  data: (data) {
                    if (data.isEmpty) {
                      return Center(
                        child: Text("등록된 프로젝트가 없습니다."),
                      );
                    }
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            children: [
                              Consumer(builder: (context, ref, child) {
                                final filter = ref
                                    .watch(categoryViewModelProvider)
                                    .projectFilter;

                                return DropdownButton(
                                  value: filter,
                                  items:
                                      EnumCategoryProjectType.values.map((e) {
                                    return DropdownMenuItem(
                                      child: Text("${e.value}"),
                                      value: e,
                                      onTap: () {
                                        ref
                                            .read(categoryViewModelProvider
                                                .notifier)
                                            .updateProjectFilter(e);
                                      },
                                    );
                                  }).toList(),
                                  onChanged: (value) {},
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  underline: SizedBox.shrink(),
                                );
                              }),
                              Gap(24),
                              DropdownButton(
                                items: [
                                  DropdownMenuItem(
                                    child: Text("추천수"),
                                  ),
                                ],
                                onChanged: (value) {},
                                icon: Icon(Icons.keyboard_arrow_down),
                                underline: SizedBox.shrink(),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final project = data[index];
                              return InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 24.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 120,
                                        width: 164,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey,
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                project.thumbnail ?? "",
                                              ),
                                              fit: BoxFit.cover,
                                              colorFilter: ColorFilter.mode(
                                                  Colors.black.withOpacity(.2),
                                                  BlendMode.darken)),
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              right: 2,
                                              top: 2,
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.favorite_border,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Gap(12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${project.title}",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Gap(8),
                                            Text(
                                              "${project.owner}",
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: AppColors.wadizGray[500],
                                              ),
                                            ),
                                            Gap(8),
                                            Text(
                                              "${NumberFormat("###,###,###").format(project.totalFundedCount)} 명 참여",
                                              style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Gap(8),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 6, vertical: 4),
                                              decoration: BoxDecoration(
                                                color: AppColors.bg,
                                              ),
                                              child: Text(
                                                switch (
                                                    project.totalFunded ?? 0) {
                                                  >= 100000000 && > 10000000 =>
                                                    "${NumberFormat.currency(
                                                      locale: "ko_KR",
                                                      symbol: "",
                                                    ).format((project.totalFunded ?? 0) ~/ 100000000)}억 원+",
                                                  >= 10000000 && > 10000 =>
                                                    "${NumberFormat.currency(
                                                      locale: "ko_KR",
                                                      symbol: "",
                                                    ).format((project.totalFunded ?? 0) ~/ 10000000)}천만 원+",
                                                  > 10000 =>
                                                    "${NumberFormat.currency(
                                                      locale: "ko_KR",
                                                      symbol: "",
                                                    ).format((project.totalFunded ?? 0) ~/ 10000)}만 원+",
                                                  _ => "",
                                                },
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ), // TextStyle
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                  error: (error, trace) {
                    return Center(child: Text("${error.toString()}"));
                  },
                  loading: () => Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
