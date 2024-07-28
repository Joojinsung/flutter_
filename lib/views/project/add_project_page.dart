import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:wadiz_clone/model/project/project_model.dart';
import 'package:wadiz_clone/shared/enum/enum_project_class.dart';
import 'package:wadiz_clone/shared/model/project_type.dart';
import 'package:wadiz_clone/theme.dart';
import 'package:wadiz_clone/view_model/category/category_view_model.dart';
import 'package:wadiz_clone/view_model/login/login_view_model.dart';
import 'package:wadiz_clone/view_model/project/project_view_model.dart';

class AddProjectPage extends StatefulWidget {
  const AddProjectPage({super.key});

  @override
  State<AddProjectPage> createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  EnumProjectClass enumProjectClass = EnumProjectClass.funding;

  TextEditingController priceTextEditingController = TextEditingController();
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController makerTextEditingController = TextEditingController();
  TextEditingController deadlineTextEditingController = TextEditingController();
  TextEditingController descriptionTextEditingController =
      TextEditingController();

  ProjectType? projectType;
  XFile? image;

  @override
  void dispose() {
    // TODO: implement dispose

    priceTextEditingController.dispose();
    titleTextEditingController.dispose();
    makerTextEditingController.dispose();
    deadlineTextEditingController.dispose();
    descriptionTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("프로젝트 정보"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "카테고리",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Gap(12),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    builder: (context) {
                      return SizedBox(
                        height: MediaQuery.sizeOf(context).height - 240,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "카테고리",
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(Icons.clear),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Consumer(
                                builder: (context, ref, child) {
                                  final types =
                                      ref.watch(fetchProjectTypesProvider);
                                  return switch (types) {
                                    AsyncData(:final value) =>
                                      ListView.separated(
                                          itemBuilder: (context, index) {
                                            final data = value[index];
                                            return ListTile(
                                              leading: SvgPicture.asset(
                                                  data.imagePath ?? ""),
                                              title: Text(
                                                "${data.type}",
                                              ),
                                              onTap: () {
                                                setState(
                                                  () {
                                                    projectType = data;
                                                  },
                                                );
                                                Navigator.of(context).pop();
                                              },
                                            );
                                          },
                                          separatorBuilder: (_, __) {
                                            return Divider();
                                          },
                                          itemCount: value.length),
                                    AsyncError(:var error) => Text(
                                        error.toString(),
                                      ),
                                    _ => Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                  };
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.wadizGray[200]!,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${projectType != null ? projectType?.type : "카테고리 선택"}",
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_drop_down,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Gap(24),
              // 프로젝트 유형
              Text(
                "프로젝트 유형",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Gap(12),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.wadizGray[200]!,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    RadioListTile(
                      value: EnumProjectClass.funding,
                      groupValue: enumProjectClass,
                      onChanged: (v) {
                        setState(
                          () {
                            enumProjectClass = v ?? EnumProjectClass.funding;
                          },
                        );
                      },
                      title: Text(EnumProjectClass.funding.title ?? ""),
                      subtitle: Text(EnumProjectClass.funding.subtitle ?? ""),
                    ),
                    RadioListTile(
                      value: EnumProjectClass.freeOrder,
                      groupValue: enumProjectClass,
                      onChanged: (v) {
                        setState(
                          () {
                            enumProjectClass = v ?? EnumProjectClass.freeOrder;
                          },
                        );
                      },
                      title: Text(EnumProjectClass.freeOrder.title ?? ""),
                      subtitle: Text(EnumProjectClass.freeOrder.subtitle ?? ""),
                    ),
                    RadioListTile(
                      value: EnumProjectClass.freeOrderGlobal,
                      groupValue: enumProjectClass,
                      onChanged: (v) {
                        setState(
                          () {
                            enumProjectClass =
                                v ?? EnumProjectClass.freeOrderGlobal;
                          },
                        );
                      },
                      title: Text(EnumProjectClass.freeOrderGlobal.title ?? ""),
                      subtitle:
                          Text(EnumProjectClass.freeOrderGlobal.subtitle ?? ""),
                    ),
                    RadioListTile(
                      value: EnumProjectClass.freeOrderEncore,
                      groupValue: enumProjectClass,
                      onChanged: (v) {
                        setState(
                          () {
                            enumProjectClass =
                                v ?? EnumProjectClass.freeOrderEncore;
                          },
                        );
                      },
                      title: Text(EnumProjectClass.freeOrderEncore.title ?? ""),
                      subtitle:
                          Text(EnumProjectClass.freeOrderEncore.subtitle ?? ""),
                    ),
                  ],
                ),
              ),
              Gap(24),
              // 목표 금액
              Text(
                "목표 금액",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Gap(12),
              Text(
                "최소 50만 원 ~ 최대 1억 원 사이에서 설정해 주세요",
              ),
              Gap(12),
              TextFormField(
                controller: priceTextEditingController,
                decoration: InputDecoration(
                  hintText: "목표 금액을 입력해주세요",
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),

              // 프로젝트 제목
              Gap(24),
              Text(
                "프로젝트 제목",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Gap(12),
              TextFormField(
                controller: titleTextEditingController,
                decoration: InputDecoration(
                  hintText: "제목을 입력해주세요",
                ),
                maxLength: 40,
              ),
              Gap(24),
              Text(
                "프로젝트 메이커",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Gap(12),
              TextFormField(
                controller: makerTextEditingController,
                decoration: InputDecoration(
                  hintText: "메이커 명을 입력해주세요",
                ),
              ),
              Gap(24),
              Text(
                "대표이미지",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Gap(12),
              Text(
                "메인, 검색 결과, SNS 광고 등 여러 곳에서 노출할 대표 이미지를 등록해 주세요",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: AppColors.wadizGray[400],
                ),
              ),
              Gap(12),
              InkWell(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  image = await picker.pickImage(source: ImageSource.gallery);
                  setState(() {});
                },
                child: Container(
                  height: 70,
                  width: 86,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.wadizGray[200]!,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                      ),
                      Text("${image == null ? "0" : "1"}/1")
                    ],
                  ),
                ),
              ),
              Gap(24),
              //프로젝트 종료일
              Text(
                "프로젝트 종료일",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),

              Gap(12),
              TextFormField(
                controller: deadlineTextEditingController,
                decoration: InputDecoration(
                  hintText: "예) 2024-05-05",
                  suffixIcon: IconButton(
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2024, 12, 31),
                      );
                      deadlineTextEditingController.text =
                          DateFormat("yyy-MM-dd")
                              .format(date ?? DateTime.now());
                    },
                    icon: Icon(Icons.calendar_month),
                  ),
                ),
              ),
              Gap(24),
              //프로젝트 요약
              Text(
                "프로젝트 요약",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Text(
                "소개 영상이나 사진과 함께 보이는 글이에요. 프로젝트를 쉽고 간결하게 소개해주세요.",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.wadizGray[400],
                ),
              ),
              Gap(12),
              TextFormField(
                controller: descriptionTextEditingController,
                decoration: InputDecoration(
                  hintText: "내용 입력",
                ),
                maxLines: 4,
                maxLength: 100,
              ),
              Gap(24),
              Consumer(builder: (context, ref, child) {
                return MaterialButton(
                  onPressed: () async {
                    final _image = await image?.readAsBytes();
                    final response = await ref
                        .read(projectViewModelProvider.notifier)
                        .createProject(
                          ProjectItemModel(
                            categoryId: 1,
                            projectTypeId: projectType?.id,
                            title: titleTextEditingController.text.trim(),
                            owner: makerTextEditingController.text.trim(),
                            deadline: deadlineTextEditingController.text.trim(),
                            description:
                                descriptionTextEditingController.text.trim(),
                            price: int.tryParse(
                                priceTextEditingController.text.trim()),
                            projectClass: enumProjectClass.title,
                            userid: ref.read(loginViewModelProvider).userid.toString(),
                            projectImage: _image ?? [],
                          ),
                        );
                    if (response) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("안내"),
                          content: Text("프로젝트 정보 등록 성공"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                context.go("/my");
                              },
                              child: Text(
                                "마이페이지,",
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("처리 실패"),
                          ),
                        );
                      };
                    }
                  },
                  height: 50,
                  minWidth: double.infinity,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: AppColors.primaryColor,
                  child: Text(
                    "저장하기",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
