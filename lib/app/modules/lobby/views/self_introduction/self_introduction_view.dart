import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dodohan/app/data/provider/api_service.dart';
import 'package:dodohan/app/modules/lobby/views/self_introduction/self_introduction_controller.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../data/model/self_introduction.dart';
import '../../../../widgets/image/image_view_box.dart';

class SelfIntroductionView extends GetView<SelfIntroductionController> {
  const SelfIntroductionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = Get.find();
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: FirestoreQueryBuilder<SelfIntroduction>(
                query: apiService.firestore
                    .collection('selfIntroductions')
                    .orderBy('createdAt', descending: true)
                    .withConverter(
                      fromFirestore: (snapshot, _) => SelfIntroduction.fromJson(snapshot.data()!),
                      toFirestore: (selfIntroduction, _) => selfIntroduction.toJson(),
                    ),
                pageSize: 14,
                builder: (context, snapshot, _) {
                  if (snapshot.isFetching) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Text('error ${snapshot.error}');
                  }
                  if (snapshot.docs.isEmpty) {
                    return const Text('셀프 소개가 없습니다');
                  }
                  return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: snapshot.docs.length,
                      itemBuilder: (context, index) {
                        // if we reached the end of the currently obtained items, we try to
                        // obtain more items
                        if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                          // Tell FirestoreQueryBuilder to try to obtain more items.
                          // It is safe to call this function from within the build method.
                          snapshot.fetchMore();
                        }
                        final selfIntroduction = snapshot.docs[index].data();
                        return _item(selfIntroduction);
                      });
                },
              ),
            )
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 8),
      ],
    );
  }

  Widget _item(SelfIntroduction selfIntroduction) => GestureDetector(
        onTap: () => Get.toNamed(Routes.selfIntroductionItem, arguments: {'selfIntroduction': selfIntroduction}),
        child: Card(
          margin: const EdgeInsets.all(4.0),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(9.0))),
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
                            width: (Get.width - 64) / 2,
                            height: (Get.width - 64) / 2),
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
                      overflow: TextOverflow.ellipsis,
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
}
