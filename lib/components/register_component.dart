import 'package:email_validator/email_validator.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter1001tickets/utils/my_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class RegisterComponent extends StatelessWidget {
  final Function onLoginSelected;
  final Function onForgotSelected;

  RegisterComponent(
      {super.key,
      required this.onLoginSelected,
      required this.onForgotSelected});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  void _goToLoginComponent() {
    onLoginSelected();
  }

  void _goToForgotPassComponent() {
    onForgotSelected();
  }

  void _onFacebookRegister() {
    // Use Firebase to register using facebook
    // Change shared preferences (?)
    // Go To Main Screen or previous screen, it depends
  }

  void _onRegister() {
    // Use Firebase to register using email/pass
    // Change shared preferences (?)
    // Go To Main Screen or previous screen, it depends
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
            "Crea tu cuenta",
            textAlign: TextAlign.center,
            style: MyStyles.h1StyleWhite,
          ),
          const Gap(10),
          Text(
              "Ingresa tu correo y contraseña para registrarte en nuestra aplicación",
              textAlign: TextAlign.center,
              style: MyStyles.supportingTextStyleWhite),
          const Gap(60),
          _buildTextField(usernameController, FluentIcons.person_24_filled,
              'Correo Electrónico',
              type: "email"),
          const Gap(20),
          _buildTextField(passwordController, FluentIcons.lock_closed_24_filled,
              'Contraseña',
              type: "password"),
          const Gap(20),
          _buildTextField(repeatPasswordController,
              FluentIcons.lock_closed_24_filled, 'Repite tu contraseña',
              type: "password"),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: _goToLoginComponent,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.zero,
                  ),
                ),
                child: Text(
                  "Ya tengo una cuenta",
                  style: MyStyles.underlineSupportingTextStyleWhite,
                ),
              ),
              TextButton(
                onPressed: _goToForgotPassComponent,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.zero,
                  ),
                ),
                child: Text(
                  "Olvidé mi contraseña",
                  style: MyStyles.underlineSupportingTextStyleWhite,
                ),
              ),
            ],
          ),
          const Gap(10),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _onRegister,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
              ),
              child: Text(
                'Registrarme',
                style: MyStyles.h2StyleWhite,
              ),
            ),
          ),
          const Gap(20),
          Text(
            "⎯⎯⎯⎯⎯⎯⎯⎯    o quizás    ⎯⎯⎯⎯⎯⎯⎯⎯",
            style: MyStyles.supportingTextStyleWhite,
            textAlign: TextAlign.center,
          ),
          const Gap(20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _onFacebookRegister,
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blue[700]!),
              ),
              child: Row(
                children: <Widget>[
                  const Icon(FontAwesomeIcons.facebook),
                  const Gap(20),
                  Text(
                    'Registrarme con Facebook',
                    style: MyStyles.h2StyleWhite,
                  ),
                ],
              ),
            ),
          ),
          const Gap(60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/1001tickets.png',
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
