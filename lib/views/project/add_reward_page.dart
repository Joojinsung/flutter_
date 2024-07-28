import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:wadiz_clone/model/project/reward_model.dart';
import 'package:wadiz_clone/theme.dart';
import 'package:wadiz_clone/view_model/project/project_view_model.dart';

class AddRewardPage extends StatefulWidget {
  final String projectId;

  const AddRewardPage({super.key, required this.projectId});

  @override
  State<AddRewardPage> createState() => _AddRewardPageState();
}

class _AddRewardPageState extends State<AddRewardPage> {
  TextEditingController priceTextEditingController = TextEditingController();
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController descriptionTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    priceTextEditingController.dispose();
    titleTextEditingController.dispose();
    descriptionTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("리워드 추가"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "리워드 추가",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Gap(12),
              DottedBorder(
                color: AppColors.wadizGray[200]!,
                dashPattern: [5, 5],
                borderType: BorderType.RRect,
                radius: Radius.circular(10),
                child: Container(
                  height: 216,
                  width: double.infinity,
                  color: Color(0xfffbfbfb),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle,
                      ),
                      Gap(
                        12,
                      ),
                      Text(
                        "리워드를 추가해주세요",
                      ),
                    ],
                  ),
                ),
              ),
              Gap(24),
              Text(
                "금액",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Gap(12),
              TextFormField(
                controller: priceTextEditingController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "0",
                ),
              ),
              Gap(24),
              Text(
                "리워드명",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Gap(12),
              TextFormField(
                controller: titleTextEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "예시) [얼리버드] 베이직 이불, 베개 1세트",
                ),
                maxLength: 60,
              ),
              Text(
                "리워드 설명",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Gap(12),
              TextFormField(
                controller: descriptionTextEditingController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "리워드 구성과 혜택을 간결하게 설명해 주세요.",
                ),
                maxLength: 400,
                maxLines: 10,
              ),
              Gap(24),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          context.go("/my");
                        },
                        child: Text("취소"),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(12),
              SizedBox(
                height: 50,
                child: Consumer(builder: (context, ref, child) {
                  return GestureDetector(
                    onTap: () async {
                      final result = await ref
                          .read(projectViewModelProvider.notifier)
                          .createProjectReward(
                            widget.projectId,
                            RewardItemModel(
                              title: titleTextEditingController.text.trim(),
                              price: int.tryParse(
                                priceTextEditingController.text.trim(),
                              ),
                              description:
                                  descriptionTextEditingController.text.trim(),
                              imageRaw: [],
                              imageUrl: "",
                            ),
                          );
                      if (result) {
                        if (context.mounted) {
                          showDialog(
                              context: context,
                              builder: (Context) {
                                return AlertDialog(
                                  title: Text("리워드 추가"),
                                  content: Text("리워드가 추가되었습니다."),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        context.go("/my");
                                      },
                                      child: Text("확인"),
                                    ),
                                  ],
                                );
                              },);
                        };
                      };
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryColor,
                      ),
                      child: Center(
                        child: Text(
                          "추가",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
