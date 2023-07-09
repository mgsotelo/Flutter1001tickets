import 'package:flutter/material.dart';
import 'package:flutter1001tickets/utils/my_styles.dart';

class ReqAuthWidget extends StatefulWidget {
  const ReqAuthWidget({super.key});

  @override
  State<ReqAuthWidget> createState() => _ReqAuthWidgetState();
}

class _ReqAuthWidgetState extends State<ReqAuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(color: Colors.amber)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 180),
            child: Text(
              "La app es más divertida si inicias sesión",
              textAlign: TextAlign.start,
              style: MyStyles.supportingTextStyle,
            ),
          ),
          ElevatedButton(
            onPressed: _goToAuthScreen,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
            ),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 50),
              child: Text(
                "Iniciar Sesión",
                textAlign: TextAlign.center,
                style: MyStyles.supportingTextStyle,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _goToAuthScreen() {
    Navigator.pushNamed((context), '/auth');
  }
}
