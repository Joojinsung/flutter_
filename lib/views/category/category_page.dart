import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CategoryPage extends StatefulWidget {
  final String categoryId;

  const CategoryPage({super.key, required this.categoryId});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[800]!,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "최고의 이어폰 | 전문가가 만든 완벽한 이어폰",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  Gap(12),
                  Text(
                    "전문가가 만든 이어폰 하나둘하나둘하나둘하나둘하나둘하나둘하나둘하나둘하나둘하나둘",
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
            ),
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 32,
                    ),
                    child: IntrinsicWidth(
                      child: Column(
                        children: [
                          Gap(8),
                          CircleAvatar(
                            radius: 12,
                          ),
                          Gap(12),
                          Text("테크"),
                          Gap(12),
                          Container(
                            height: 6,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
