import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../widgets/appbars/default_appbar.dart';

class UpdatesPage extends StatelessWidget {
  const UpdatesPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar('공지사항'),
      body: Center(
        child: Text(
          '업데이트 예정',
          style: TextStyle(color: ThemeColors.greyText),
        ),
      ),
    );
  }
}
