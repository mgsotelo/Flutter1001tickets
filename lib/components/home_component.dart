import 'package:flutter/material.dart';
import 'package:flutter1001tickets/utils/my_styles.dart';
import 'package:flutter1001tickets/widgets/greeting_widget.dart';
import 'package:flutter1001tickets/widgets/left_logo_widget.dart';
import 'package:flutter1001tickets/widgets/req_auth_widget.dart';
import 'package:gap/gap.dart';

class HomeComponent extends StatelessWidget {
  const HomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Container(
          padding: MyStyles.myDefaultHorizontalAppPadding,
          child: ListView(
            children: const [
              LeftLogoWidget(
                height: 30,
              ),
              Gap(20),
              GreetingWidget(),
              Gap(20),
              ReqAuthWidget()
            ],
          ),
        ));
  }
}
