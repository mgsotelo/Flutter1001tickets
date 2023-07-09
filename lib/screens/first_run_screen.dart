import 'package:flutter/material.dart';
import 'package:flutter1001tickets/utils/my_styles.dart';
import 'package:gap/gap.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/intro_screen/gf_intro_screen.dart';
import 'package:getwidget/components/intro_screen/gf_intro_screen_bottom_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstRunScreen extends StatefulWidget {
  const FirstRunScreen({super.key});

  @override
  State<FirstRunScreen> createState() => _FirstRunScreenState();
}

class _FirstRunScreenState extends State<FirstRunScreen> {
  late PageController _pageController;
  late List<Widget> slideList;
  late int initialPage;

  @override
  void initState() {
    _pageController = PageController();
    initialPage = _pageController.initialPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GFIntroScreen(
        color: Colors.blueGrey,
        slides: _slides(),
        pageController: _pageController,
        currentIndex: 0,
        pageCount: 5,
        introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
          pageController: _pageController,
          pageCount: slideList.length,
          currentIndex: initialPage,
          onForwardButtonTap: () {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.decelerate);
          },
          onBackButtonTap: () {
            _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.decelerate);
          },
          onDoneTap: _goToMainScreen,
          onSkipTap: _goToMainScreen,
          // ------ custom button texts (spanish) ------
          skipButtonText: 'SALTAR',
          doneButtonText: 'LISTO',
          forwardButtonText: 'SIGUIENTE',
          backButtonText: 'ATRAS',
          // -------------------------------------------
          navigationBarColor: Colors.white,
          showDivider: false,
          inactiveColor: Colors.grey.shade200,
          activeColor: GFColors.SUCCESS,
        ),
      ),
    );
  }

  List<Widget> _slides() {
    slideList = [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.purple[400],
            image: const DecorationImage(
              image: AssetImage('assets/images/best-artists.png'),
              fit: BoxFit.contain,
            )),
        child: Column(
          children: [
            const Gap(100),
            Center(
                child: Text(
              "Los mejores conciertos",
              softWrap: true,
              style: MyStyles.h2StyleWhite,
            )),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                  child: Text(
                "Sigue a tus artistas favoritos y no te pierdas ningún concierto suyo.",
                softWrap: true,
                style: MyStyles.supportingTextStyleWhite,
                textAlign: TextAlign.center,
              )),
            ),
          ],
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.pink[400],
            image: const DecorationImage(
              image: AssetImage('assets/images/drop-queues.png'),
              fit: BoxFit.contain,
            )),
        child: Column(
          children: [
            const Gap(100),
            Center(
                child: Text(
              "Sin las molestas \"colas virtuales\"",
              softWrap: true,
              style: MyStyles.h2StyleWhite,
            )),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                  child: Text(
                "Olvídate de esperar horas para tener tus entradas. Consigue tu entrada en minutos y sin pagar de más.",
                softWrap: true,
                style: MyStyles.supportingTextStyleWhite,
                textAlign: TextAlign.center,
              )),
            ),
          ],
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.green[400],
            image: const DecorationImage(
              image: AssetImage('assets/images/safe-qrs.png'),
              fit: BoxFit.contain,
            )),
        child: Column(
          children: [
            const Gap(100),
            Center(
                child: Text(
              "Tu seguridad es lo más importante",
              softWrap: true,
              style: MyStyles.h2StyleWhite,
            )),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                  child: Text(
                "Garantizamos la seguridad de tus datos y la total validez de las entradas en nuestra plataforma.",
                softWrap: true,
                style: MyStyles.supportingTextStyleWhite,
                textAlign: TextAlign.center,
              )),
            ),
          ],
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.blue[400],
            image: const DecorationImage(
              image: AssetImage('assets/images/safe-marketplace.png'),
              fit: BoxFit.contain,
            )),
        child: Column(
          children: [
            const Gap(100),
            Center(
                child: Text(
              "Sin estafas de reventas",
              softWrap: true,
              style: MyStyles.h2StyleWhite,
            )),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                  child: Text(
                "Usa el marketplace de nuestra app para comprar entradas de alguien que no podrá ir al concierto, o vender las entradas que no vayas a usar. Todo 100% seguro.",
                softWrap: true,
                style: MyStyles.supportingTextStyleWhite,
                textAlign: TextAlign.center,
              )),
            ),
          ],
        ),
      ),
    ];
    return slideList;
  }

  void _goToMainScreen() async {
    Navigator.pushNamed((context), '/');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstRun', false);
  }
}
