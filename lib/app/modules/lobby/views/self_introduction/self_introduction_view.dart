import 'package:choice/choice.dart';
import 'package:dodohan/app/modules/lobby/views/self_introduction/self_introduction_controller.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/services/auth_service.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../data/model/self_introduction.dart';
import '../../../../widgets/image/image_view_box.dart';

class SelfIntroductionView extends GetView<SelfIntroductionController> {
  const SelfIntroductionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 1,
          flexibleSpace: _filter(),
        ),
        Obx(
          () => FirestoreQueryBuilder<SelfIntroduction>(
            query: controller.docs.value!.withConverter(
              fromFirestore: (snapshot, _) => SelfIntroduction.fromJson(snapshot.data()!),
              toFirestore: (selfIntroduction, _) => selfIntroduction.toJson(),
            ),
            pageSize: 4,
            builder: (context, snapshot, _) {
              if (snapshot.isFetching) {
                return SliverToBoxAdapter(
                  child: const Center(child: CircularProgressIndicator()).paddingOnly(top: Get.height / 3),
                );
              }
              if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: Text(
                    'error ${snapshot.error}',
                    style: ThemeFonts.regular.getTextStyle(color: ThemeColors.grayText, size: 14),
                    textAlign: TextAlign.center,
                  ).paddingOnly(top: Get.height / 3),
                );
              }
              if (snapshot.docs.isEmpty) {
                return SliverToBoxAdapter(
                  child: Text(
                    '셀프 소개가 없습니다',
                    style: ThemeFonts.regular.getTextStyle(color: ThemeColors.grayText, size: 14),
                    textAlign: TextAlign.center,
                  ).paddingOnly(top: Get.height / 3),
                );
              }
              return SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: 0.8,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                      // Tell FirestoreQueryBuilder to try to obtain more items.
                      // It is safe to call this function from within the build method.
                      snapshot.fetchMore();
                    }
                    // Your grid item creation logic
                    final selfIntroduction = snapshot.docs[index].data();
                    return _item(selfIntroduction);
                  },
                  childCount: snapshot.docs.length,
                ),
              );
            },
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 8);
  }

  Widget _item(SelfIntroduction selfIntroduction) => GestureDetector(
        onTap: () => Get.toNamed(Routes.selfIntroductionItem, arguments: {'selfIntroduction': selfIntroduction}),
        onLongPress: AuthService.to.isAdmin ? () => controller.showDeleteDialog(selfIntroduction) : null,
        child: Card(
          margin: const EdgeInsets.all(4.0),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(9.0))),
          elevation: 1,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ImageViewBox(
                            url: selfIntroduction.image,
                            borderRadius: 8,
                            width: (Get.width - 48) / 2,
                            height: (Get.width - 48) / 2),
                        Positioned(
                            bottom: 4,
                            right: 4,
                            child: Row(
                              children: [
                                _tag(selfIntroduction.meInfo!.univ!),
                                const SizedBox(width: 4),
                                _tag(selfIntroduction.leftDay),
                              ],
                            )),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      selfIntroduction.title,
                      style: ThemeFonts.semiBold.getTextStyle(height: 1.2),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 2,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget _tag(String text) {
    return Container(
      height: 15,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child:
          Text(text, style: ThemeFonts.medium.getTextStyle(color: Colors.black, size: 10), textAlign: TextAlign.center)
              .paddingSymmetric(horizontal: 7, vertical: 1),
    );
  }

  Widget _filter() => Row(
        children: [
          Expanded(
            flex: 5,
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              elevation: 0.5,
              child: PromptedChoice<String>.single(
                title: '지역',
                value: '전체',
                itemCount: controller.choices.length,
                itemBuilder: (state, i) {
                  return RadioListTile(
                    value: controller.choices[i],
                    groupValue: state.single,
                    onChanged: (value) {
                      controller.onFilterChanged(value as String);
                      state.select(controller.choices[i]);
                    },
                    title: ChoiceText(
                      controller.choices[i],
                      highlight: state.search?.value,
                    ),
                  );
                },
                promptDelegate: ChoicePrompt.delegatePopupDialog(
                  maxHeightFactor: .5,
                  constraints: const BoxConstraints(maxWidth: 300),
                ),
                anchorBuilder: ChoiceAnchor.create(inline: true, dense: true),
              ),
            ),
          ),
          if (AuthService.to.isAdmin)
            Expanded(
                flex: 1,
                child: Obx(
                  () => Switch(
                      value: controller.isManAdminSwitch.value ?? true,
                      onChanged: (val) => controller.switchIsMan(val)),
                )),
        ],
      );
}
