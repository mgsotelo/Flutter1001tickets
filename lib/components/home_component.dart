import 'package:flutter/material.dart';
import 'package:flutter1001tickets/utils/my_styles.dart';

class HomeComponent extends StatelessWidget {
  const HomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: MyStyles.myDefaultHorizontalAppPadding,
          child: ListView(
            children: [
              Padding(
                padding: MyStyles.myDefaultVerticalElementsPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/1001tickets.png',
                      height: 30,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: MyStyles.myDefaultVerticalElementsPadding,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          // DateFormat('EEEE d ' 'de' ' MMMM', 'es').format(DateTime.now()),
                          "Lunes 3 de Marzo".toUpperCase(),
                          style: MyStyles.supportingTextStyle,
                        ),
                        // const SizedBox(height: 10.0),
                        Text(
                          // _getGreeting(),
                          "Buenas tardes, Mario",
                          style: MyStyles.h1Style,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              
            ],
          ),
        ));
  }
}
