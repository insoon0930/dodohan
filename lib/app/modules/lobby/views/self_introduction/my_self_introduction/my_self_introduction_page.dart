import 'package:dodohan/app/widgets/card_container.dart';
import 'package:dodohan/app/widgets/dividers/divider_with_text.dart';
import 'package:dodohan/app/widgets/my_text_field.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../core/theme/buttons.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../core/theme/fonts.dart';
import '../../../../../../routes/app_routes.dart';
import '../../../../../data/model/daily_card.dart';
import '../../../../../data/model/self_introduction.dart';
import '../../../../../widgets/appbars/default_appbar.dart';
import '../../../../../widgets/dialogs/action_dialog.dart';
import '../../../../../widgets/dialogs/report_dialog.dart';
import '../../../../../widgets/dividers/my_divider_2.dart';
import '../../../../../widgets/image/image_pick_box.dart';
import '../../../../../widgets/image/image_view_box.dart';
import '../../daily/current_card/widgets/current_card_item.dart';
import 'my_self_introduction_controller.dart';

class MySelfIntroductionPage extends GetView<MySelfIntroductionController> {
  const MySelfIntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('오늘의 카드'),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const DividerWithText('보낸 신청').paddingOnly(top: 4, bottom: 8),
                  Expanded(
                    child: FirestoreQueryBuilder<SelfIntroduction>(
                      query: controller.docs.value!.withConverter(
                        fromFirestore: (snapshot, _) =>
                            SelfIntroduction.fromJson(snapshot.data()!),
                        toFirestore: (selfIntroduction, _) => selfIntroduction.toJson(),
                      ),
                      pageSize: 14,
                      builder: (context, snapshot, _) {
                        if (snapshot.isFetching) {
                          return const Center(child: CircularProgressIndicator())
                              ;
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              'error ${snapshot.error}',
                              style: ThemeFonts.regular
                                  .getTextStyle(color: ThemeColors.greyText, size: 14),
                              textAlign: TextAlign.center,
                            ),
                          );
                        }
                        if (snapshot.docs.isEmpty) {
                          return Center(
                            child: Text(
                              '셀프 소개가 없습니다',
                              style: ThemeFonts.regular
                                  .getTextStyle(color: ThemeColors.greyText, size: 14),
                              textAlign: TextAlign.center,
                            ),
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
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const DividerWithText('받은 신청').paddingOnly(top: 12, bottom: 8),
                  Expanded(
                    child: FirestoreQueryBuilder<SelfIntroduction>(
                      query: controller.docs.value!.withConverter(
                        fromFirestore: (snapshot, _) =>
                            SelfIntroduction.fromJson(snapshot.data()!),
                        toFirestore: (selfIntroduction, _) => selfIntroduction.toJson(),
                      ),
                      pageSize: 14,
                      builder: (context, snapshot, _) {
                        if (snapshot.isFetching) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              'error ${snapshot.error}',
                              style: ThemeFonts.regular
                                  .getTextStyle(color: ThemeColors.greyText, size: 14),
                              textAlign: TextAlign.center,
                            ),
                          );
                        }
                        if (snapshot.docs.isEmpty) {
                          return Center(
                            child: Text(
                              '셀프 소개가 없습니다',
                              style: ThemeFonts.regular
                                  .getTextStyle(color: ThemeColors.greyText, size: 14),
                              textAlign: TextAlign.center,
                            ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(SelfIntroduction selfIntroduction) => GestureDetector(
        onTap: () => Get.toNamed(Routes.selfIntroductionItem,
            arguments: {'selfIntroduction': selfIntroduction}),
        child: Card(
          margin: const EdgeInsets.all(4.0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(9.0))),
          elevation: 3,
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
                      style: ThemeFonts.semiBold.getTextStyle(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
      child: Text(text,
              style:
                  ThemeFonts.medium.getTextStyle(color: Colors.black, size: 10),
              textAlign: TextAlign.center)
          .paddingSymmetric(horizontal: 7, vertical: 1),
    );
  }
}
