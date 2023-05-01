import 'package:flutter/material.dart';
import 'package:flutter1001tickets/utils/my_styles.dart';

class LeftLogoWidget extends StatelessWidget {
  final double height;
  const LeftLogoWidget({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MyStyles.myDefaultVerticalElementsPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/1001tickets.png',
            height: height,
          ),
        ],
      ),
    );
  }
}
