import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:v_app/configs/app_config.dart';
import 'package:v_app/pages/page.dart';
import 'package:v_app/services/service.dart';
import 'package:v_app/utils/util.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  login() async {
    if (email.text.isEmpty && password.text.isEmpty) {
      final snackBar = showSnackBar('Required email and password', redColor);
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (email.text.isEmpty) {
      final snackBar = showSnackBar('Required email', redColor);
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (password.text.isEmpty) {
      final snackBar = showSnackBar('Required password', redColor);
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (!ValidateUtil.validationEmail(email.text)) {
      final snackBar = showSnackBar('Email not validate formate', redColor);
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Container(
          padding: const EdgeInsets.all(appDefaultPadding * 2),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(appDefaultBorderRadius),
          ),
          child: CircularProgressIndicator(
            backgroundColor: appColor,
            color: appColor.shade200,
          ),
        ),
      ),
    );
    bool isLogin = await AuthServices().login(email.text, password.text);
    if (!isLogin) {
      Navigator.pop(context);
      final snackBar = showSnackBar('Login failed', redColor);
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AppPage(),
      ),
    );
  }

  SnackBar showSnackBar(String title, Color color) {
    return SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: const EdgeInsets.all(appDefaultPadding),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(appDefaultBorderRadius),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://i.pinimg.com/564x/f0/82/2e/f0822eea56a4765019741ba64f704846.jpg',
                  ),
                ),
              ),
              Positioned(
                top: appDefaultPadding * 5,
                right: appDefaultPadding,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://i.pinimg.com/736x/e3/35/87/e335877470ec1f731eb737fede2e311b.jpg',
                  ),
                ),
              ),
              Positioned(
                top: appDefaultPadding * 15,
                right: -50,
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                    'https://i.pinimg.com/736x/8b/2b/07/8b2b071a1c9abe181055a10043a6f7f8.jpg',
                  ),
                ),
              ),
              Positioned(
                top: appDefaultPadding * 30,
                right: -50,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://i.pinimg.com/736x/d1/6f/5f/d16f5f20ddf55e164b9e6739e09c6b86.jpg',
                  ),
                ),
              ),
              Positioned(
                top: appDefaultPadding * 10,
                left: -70,
                child: CircleAvatar(
                  radius: 65,
                  backgroundImage: NetworkImage(
                    'https://i.pinimg.com/736x/a6/39/35/a63935b6306ed76699661de0acb6a42f.jpg',
                  ),
                ),
              ),
              Positioned(
                top: appDefaultPadding * 8,
                left: appDefaultPadding * 8,
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                    'https://i.pinimg.com/564x/a5/d1/1a/a5d11a420cb0bf3f06e0a5b2ace867c2.jpg',
                  ),
                ),
              ),
              Positioned(
                top: appDefaultPadding * 22,
                left: appDefaultPadding * 5,
                child: CircleAvatar(
                  radius: 120,
                  backgroundImage: NetworkImage(
                    'https://i.pinimg.com/736x/f9/5f/b3/f95fb3b5b6eda21f587f6ba93995dbcd.jpg',
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: appDefaultPadding * 2,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      whiteColor.withOpacity(0.0),
                      whiteColor.withOpacity(0.5),
                      whiteColor.withOpacity(0.7),
                      whiteColor.withOpacity(0.9),
                      whiteColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: appDefaultPadding * 2),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: greyColor.shade100,
                        borderRadius:
                            BorderRadius.circular(appDefaultBorderRadius),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: appDefaultPadding,
                      ),
                      child: TextField(
                        controller: email,
                        decoration: const InputDecoration(
                          hintText: 'Email address',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: appDefaultPadding),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: greyColor.shade100,
                        borderRadius:
                            BorderRadius.circular(appDefaultBorderRadius),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: appDefaultPadding,
                      ),
                      child: TextField(
                        controller: password,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: appDefaultPadding * 2),
                    InkWell(
                      onTap: () => login(),
                      borderRadius:
                          BorderRadius.circular(appDefaultBorderRadius),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: appColor,
                          borderRadius:
                              BorderRadius.circular(appDefaultBorderRadius),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: appDefaultPadding,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: appDefaultPadding * 2),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius:
                            BorderRadius.circular(appDefaultBorderRadius),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: appDefaultPadding,
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.facebook,
                            color: whiteColor,
                            size: 18,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                'Continue with Facebook',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: appDefaultPadding),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: greyColor.shade200,
                        borderRadius:
                            BorderRadius.circular(appDefaultBorderRadius),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: appDefaultPadding,
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.google,
                            color: blueColor,
                            size: 18,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                'Continue with Google',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: appDefaultPadding * 2),
                    const Text(
                      'The App Privacy Policy is a document that informs users about the collection, use, and sharing of their personal information by the app. ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: appDefaultPadding * 2),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
