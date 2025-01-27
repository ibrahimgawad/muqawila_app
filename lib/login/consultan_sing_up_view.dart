import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/extension.dart';
import 'package:flutter_application_1/login/Consultan_login_view.dart';

import '../../common/globs.dart';

import 'package:loading_overlay/loading_overlay.dart';

import '../common/color_extension.dart';
import '../common_widget/round_button.dart';
import '../common_widget/round_textfield.dart';
import 'customer_login_view.dart';

class ConsultanSingUpView extends StatefulWidget {
  const ConsultanSingUpView({super.key});

  @override
  State<ConsultanSingUpView> createState() => _ConsultanSingUpView();
}

class _ConsultanSingUpView extends State<ConsultanSingUpView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();
  GlobalKey<FormState> formlKey = GlobalKey();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        body: Form(
          key: formlKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  Text(
                    "تسجيل جديد",
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "أضف تفاصيلك للتسجيل",
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RoundTextfield(
                    onSubmit: (p0) {
                      txtEmail.text = p0;
                    },
                    hintText: "البريد الإلكتروني",
                    controller: txtEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RoundTextfield(
                    onSubmit: (p0) {
                      txtPassword.text = p0;
                    },
                    hintText: "كلمة المرور",
                    controller: txtPassword,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RoundTextfield(
                    hintText: "تأكيد كلمة المرور",
                    controller: txtConfirmPassword,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RoundButton(
                      title: "تسجيل",
                      onPressed: () async {
                        btnSignUp();
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ConsultanLoginView(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "لديك حساب بالفعل؟ ",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "تسجيل الدخول",
                          style: TextStyle(
                              color: TColor.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //TODO: Action
  void btnSignUp() {
    if (!txtEmail.text.isEmail) {
      mdShowAlert(Globs.appName, MSG.enterEmail, () {});
      return;
    }

    if (txtPassword.text.length < 6) {
      mdShowAlert(Globs.appName, MSG.enterPassword, () {});
      return;
    }

    if (txtPassword.text != txtConfirmPassword.text) {
      mdShowAlert(Globs.appName, MSG.enterPasswordNotMatch, () {});
      return;
    }

    endEditing();

    // serviceCallSignUp({
    //   "name": txtName.text,
    //   "mobile": txtMobile.text,
    //   "email": txtEmail.text,
    //   "address": txtAddress.text,
    //   "password": txtPassword.text,
    //   "push_token": "",
    //   "device_type": Platform.isAndroid ? "A" : "I"
    // });
  }

  //TODO: ServiceCall

  void serviceCallSignUp() async {
    // try {
    //   await registerUser();
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     showSnakeBar(context, 'weak pasword');
    //   } else if (e.code == 'email-already-in-use') {
    //     showSnakeBar(context, 'email already exists');
    //   } else
    //     showSnakeBar(context, 'success');
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const OnBoardingView(),
    //     ),
    //     (route) => false);
    // }
    // Globs.showHUD();

    // ServiceCall.post(parameter, SVKey.svSignUp,
    //     withSuccess: (responseObj) async {
    //   Globs.hideHUD();
    //   if (responseObj[KKey.status] == "1") {
    //     Globs.udSet(responseObj[KKey.payload] as Map? ?? {}, Globs.userPayload);
    //     Globs.udBoolSet(true, Globs.userLogin);

    //   } else {
    //     mdShowAlert(Globs.appName,
    //         responseObj[KKey.message] as String? ?? MSG.fail, () {});
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const OnBoardingView(),
    //     ),
    //     (route) => false);
    //   }
    // }, failure: (err) async {
    //   Globs.hideHUD();
    //   mdShowAlert(Globs.appName, err.toString(), () {});
    // });
  }
}
