import 'package:findwords/utils/colors.dart';
import 'package:flutter/cupertino.dart';

class AppbarComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[t3_colorPrimary, t3_colorPrimaryDark]),
      ),
    );
  }
}
