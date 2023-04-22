import 'package:email_validator/email_validator.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter1001tickets/utils/my_styles.dart';
import 'package:gap/gap.dart';

class ForgotPassComponent extends StatelessWidget {
  final Function onLoginSelected;

  ForgotPassComponent({super.key, required this.onLoginSelected});

  final TextEditingController usernameController = TextEditingController();

  void _goToLoginComponent() {
    onLoginSelected();
  }

  void _onForgotPassRequest() {
    // Call Firebase to reset email password
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Olvidé mi contraseña",
            textAlign: TextAlign.center,
            style: MyStyles.h1StyleWhite,
          ),
          const Gap(10),
          Text(
              "Ingresa tu dirección de correo electrónico para enviar el enlace de recuperación de tu cuenta",
              textAlign: TextAlign.center,
              style: MyStyles.supportingTextStyleWhite),
          const Gap(60),
          _buildTextField(usernameController, FluentIcons.person_24_filled,
              'Correo Electrónico',
              type: "email"),
          const Gap(20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _onForgotPassRequest,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
              ),
              child: Text(
                'Recuperar mi contraseña',
                style: MyStyles.h2StyleWhite,
              ),
            ),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: _goToLoginComponent,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.zero,
                  ),
                ),
                child: Text(
                  "Volver al Inicio de Sesión",
                  style: MyStyles.underlineSupportingTextStyleWhite,
                ),
              ),
            ],
          ),
          const Gap(60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/1001tickets_4dark.png',
                height: 60,
              ),
            ],
          ),
        ],
      )),
    );
  }

  _buildTextField(
      TextEditingController controller, IconData icon, String placeholder,
      {String type = "email"}) {
    bool obscuretext = false;
    bool autocorrect = false;
    bool suggest = true;

    if (type == "password") {
      obscuretext = true;
      suggest = false;
    }

    var textFormField = TextFormField(
      controller: controller,
      style: MyStyles.supportingTextStyleWhite,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          labelText: placeholder,
          labelStyle: const TextStyle(color: Colors.white),
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          border: InputBorder.none),
      obscureText: obscuretext,
      enableSuggestions: suggest,
      autocorrect: autocorrect,
      validator: (value) {
        if (type != "password") {
          if (value!.isEmpty) {
            return 'Please enter your email';
          }
          if (!EmailValidator.validate(value)) {
            return 'Please enter a valid email';
          }
          return null;
        }
        return null;
      },
    );

    var container = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: MyStyles.unselectedColor,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(10)),
      child: textFormField,
    );

    return container;
  }
}
