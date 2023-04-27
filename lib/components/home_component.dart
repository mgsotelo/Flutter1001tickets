import 'package:flutter/material.dart';
import 'package:flutter1001tickets/utils/my_styles.dart';
import 'package:gap/gap.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class HomeComponent extends StatelessWidget {
  const HomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Container(
          padding: MyStyles.myDefaultHorizontalAppPadding,
          child: ListView(
            children: [
              Container(
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
              const Gap(20),
              const GreetingWidget(),
            ],
          ),
        ));
  }
}

class GreetingWidget extends StatefulWidget {
  const GreetingWidget({
    super.key,
  });

  @override
  State<GreetingWidget> createState() => _GreetingWidgetState();
}

class _GreetingWidgetState extends State<GreetingWidget> {
  String fdate = "";
  String fgreet = "";

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('es', null).then((_) {
      var now = DateTime.now();
      var formatter = DateFormat("EEEE, d' de 'MMMM", 'es');
      var greeting = "Buenos días";
      if (now.hour < 12) {
        greeting = 'Buenos días';
      } else if (now.hour < 18) {
        greeting = 'Buenas tardes';
      } else {
        greeting = 'Buenas noches';
      }
      setState(() {
        fdate = formatter.format(now);
        fgreet = greeting;
      });
    });
    return Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                // DateFormat('EEEE d ' 'de' ' MMMM', 'es').format(DateTime.now()),
                fdate.toUpperCase(),
                style: MyStyles.supportingTextStyle,
              ),
              // const SizedBox(height: 10.0),
              Text(
                // _getGreeting(),
                fgreet,
                // TO DO: when firebase is fully connected, it should be a better idea to say something like "buenas tardes, XXXX"
                style: MyStyles.h1Style,
              ),
            ],
          )
        ],
      ),
    );
  }
}
