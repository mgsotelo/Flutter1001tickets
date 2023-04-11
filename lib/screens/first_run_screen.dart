import 'package:flutter/material.dart';
import 'package:flutter1001tickets/utils/my_styles.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';
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
    return SafeArea(
      child: GFIntroScreen(
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
          child: GFImageOverlay(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        color: Colors.orange,
        image: const AssetImage('assets/images/1001tickets.png'),
        boxFit: BoxFit.contain,
        borderRadius: BorderRadius.circular(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 70.0, left: 20),
              child: Text(
                "¡Bienvenido!",
                style: MyStyles.h1StyleWhite,
              ),
            ),
          ],
        ),
      )),
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
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.amber[400],
            image: const DecorationImage(
              image: AssetImage('assets/images/safe-marketplace.png'),
              fit: BoxFit.contain,
            )),
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
