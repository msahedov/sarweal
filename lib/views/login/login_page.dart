import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sarweal/constants/constants.dart';
import 'package:sarweal/constants/enums.dart';
import 'package:sarweal/helpers/masked_formatter.dart';
import 'package:sarweal/models/snackbar.model.dart';
import 'package:sarweal/service/auth.service.dart';
import 'package:sarweal/views/profil/sub/privacy_and_policy_page.dart';
import 'package:sarweal/views/screen_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final GlobalKey<FormFieldState> _phoneFieldKey = GlobalKey<FormFieldState>();

  final TextEditingController _phone = TextEditingController();

  final ValueNotifier<bool> loadingValueNotify = ValueNotifier<bool>(false);

  final ValueNotifier<bool> checkValueNotify = ValueNotifier<bool>(true);
  late final AnimationController controller;
  late final Animation<Offset> offsetAnimation;
  Future<void> loginFn() async {
    if (_phoneFieldKey.currentState!.validate()) {
      loadingValueNotify.value = true;
      final result = await AuthService.sendOtp(_phone.text.split(" ").join(""));

      switch (result?.message) {
        case ResponseMessage.sended:
          {
            ///
            ///if sms code send go next page
            ///
            Get.toNamed(OTPScreen.routeName, arguments: _phone.text.split(" ").join(""));
            break;
          }
        case ResponseMessage.wrongPhone:
          {
            ////
            ///wrong phone number
            ///
            Snackbar.showSnackbar(SnackBarType.phoneError);
            break;
          }
        case ResponseMessage.connectionError:
          {
            ///
            ///connection error
            ///
            Snackbar.showSnackbar(SnackBarType.connection);
            break;
          }
      }
      loadingValueNotify.value = false;
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);
    offsetAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero).animate(controller);

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: loadingValueNotify,
        builder: (BuildContext context, bool isLoading, Widget? child) {
          return AbsorbPointer(
            absorbing: isLoading,
            child: Scaffold(
                appBar: AppBar(
                  elevation: 0.0,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white, //fonColor_2,
                  systemOverlayStyle: const SystemUiOverlayStyle(
                      statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
                ),
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.white,
                body: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(padding: EdgeInsets.all(30), children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text("Hoş geldiňiz",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 26)),
                    ),
                    Text("Giriş kody almak üçin telefon \nbelgiňizi giriziň",
                        textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, bottom: 20),
                      child: TextFormField(
                        key: _phoneFieldKey,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          MaskedInputFormatter('## ######'),
                          LengthLimitingTextInputFormatter(9)
                        ],
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "Boş bolmaly däl";
                          } else {
                            return null;
                          }
                        },
                        controller: _phone,
                        cursorColor: primaryColor_2,
                        onEditingComplete: loginFn,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade50,
                            filled: true,
                            prefixIcon:
                                Text("+993  ", style: Theme.of(context).textTheme.bodyMedium),
                            hintText: "Telefon belgiňiz",
                            helperText: "",
                            prefixIconConstraints: const BoxConstraints(maxHeight: 40),
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.grey),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.shade100)),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red..shade300)),
                            focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red..shade300)),
                            disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.shade100)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor_2)),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.shade100))),
                      ),
                    ),
                    ValueListenableBuilder(
                        valueListenable: checkValueNotify,
                        builder: (BuildContext context, bool isChecked, snapshot) {
                          return CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.zero,
                              title: RichText(
                                  text: TextSpan(
                                      text: "Ulanyş kadalaryny we düzgünlerini",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.toNamed(PrivacyAndPolicy.routeName);
                                        },
                                      children: [
                                        TextSpan(
                                            text: " kabul edýärin",
                                            style: Theme.of(context).textTheme.labelMedium)
                                      ],
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(decoration: TextDecoration.underline))),
                              value: isChecked,
                              tristate: true,
                              onChanged: (value) {
                                checkValueNotify.value = value ?? false;
                              });
                        }),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: ValueListenableBuilder(
                          valueListenable: checkValueNotify,
                          builder: (BuildContext context, bool isChecked, Widget? child) {
                            return RaisedButton(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              color: primaryColor_2,
                              disabledColor: primaryColor_2.withOpacity(0.5),
                              shape: RoundedRectangleBorder(borderRadius: circular25),
                              onPressed: isLoading || !isChecked
                                  ? null
                                  : () => Get.toNamed(OTPScreen.routeName,
                                      arguments: _phone.text.split(" ").join("")), //loginFn,
                              child: AnimatedCrossFade(
                                firstCurve: Curves.decelerate,
                                secondCurve: Curves.decelerate,
                                sizeCurve: Curves.decelerate,
                                crossFadeState: isLoading
                                    ? CrossFadeState.showSecond
                                    : CrossFadeState.showFirst,
                                duration: const Duration(milliseconds: 200),
                                alignment: Alignment.center,
                                firstChild: Text(
                                  "login_btn_txt".tr,
                                  style: Theme.of(context).textTheme.button?.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                secondChild: const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                          color: primaryColor_2, backgroundColor: Colors.white)),
                                ),
                              ),
                            );
                          }),
                    )
                  ]),
                )),
          );
        });
  }
}





// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:get/get.dart';
// import 'package:sarweal/constants/constants.dart';
// import 'package:sarweal/constants/enums.dart';
// import 'package:sarweal/models/snackbar.model.dart';
// import 'package:sarweal/service/auth.service.dart';
// import 'package:sarweal/helpers/masked_formatter.dart';
// import 'package:sarweal/views/profil/sub/privacy_and_policy_page.dart';
// import 'package:sarweal/views/screen_repository.dart';

// class LoginScreen extends StatelessWidget {
//   LoginScreen({Key? key}) : super(key: key);
//   static const String routeName = '/login';
//   final GlobalKey<FormFieldState> _phoneFieldKey = GlobalKey<FormFieldState>();
//   final TextEditingController _phone = TextEditingController();
//   final ValueNotifier<bool> loadingValueNotify = ValueNotifier<bool>(false);
//   final ValueNotifier<bool> checkValueNotify = ValueNotifier<bool>(true);

//   Future<void> loginFn() async {
//     if (_phoneFieldKey.currentState!.validate()) {
//       loadingValueNotify.value = true;
//       final result = await AuthService.sendOtp(_phone.text.split(" ").join(""));

//       switch (result?.message) {
//         case ResponseMessage.sended:
//           {
//             ///
//             ///if sms code send go next page
//             ///
//             Get.toNamed(OTPScreen.routeName, arguments: _phone.text.split(" ").join(""));
//             break;
//           }
//         case ResponseMessage.wrongPhone:
//           {
//             ////
//             ///wrong phone number
//             ///
//             Snackbar.showSnackbar(SnackBarType.phoneError);
//             break;
//           }
//         case ResponseMessage.connectionError:
//           {
//             ///
//             ///connection error
//             ///
//             Snackbar.showSnackbar(SnackBarType.connection);
//             break;
//           }
//       }
//       loadingValueNotify.value = false;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//         valueListenable: loadingValueNotify,
//         builder: (BuildContext context, bool isLoading, Widget? child) {
//           return AbsorbPointer(
//             absorbing: isLoading,
//             child: Scaffold(
//               appBar: AppBar(
//                 elevation: 0.0,
//                 automaticallyImplyLeading: false,
//                 backgroundColor: Colors.white, //fonColor_2,
//                 systemOverlayStyle: const SystemUiOverlayStyle(
//                     statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
//               ),
//               resizeToAvoidBottomInset: false,
//               backgroundColor: Colors.white,
//               //   backgroundColor: fonColor_1,
//               body: ListView(
//                   physics: const NeverScrollableScrollPhysics(),
//                   padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 15),
//                       child: Text("Hoş geldiňiz",
//                           textAlign: TextAlign.center,
//                           style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 26)),
//                     ),
//                     Text("Giriş kody almak üçin telefon \nbelgiňizi giriziň",
//                         textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 40, bottom: 20),
//                       child: TextFormField(
//                         key: _phoneFieldKey,
//                         keyboardType: TextInputType.phone,
//                         inputFormatters: [
//                           MaskedInputFormatter('## ######'),
//                           LengthLimitingTextInputFormatter(9)
//                         ],
//                         validator: (text) {
//                           if (text!.isEmpty) {
//                             return "Boş bolmaly däl";
//                           } else {
//                             return null;
//                           }
//                         },
//                         controller: _phone,
//                         cursorColor: primaryColor_2,
//                         onEditingComplete: loginFn,
//                         style: Theme.of(context).textTheme.bodyMedium,
//                         decoration: InputDecoration(
//                             prefixIcon:
//                                 Text("+993  ", style: Theme.of(context).textTheme.bodyMedium),
//                             hintText: "Telefon belgiňiz",
//                             helperText: "",
//                             prefixIconConstraints: const BoxConstraints(maxHeight: 40),
//                             hintStyle: Theme.of(context)
//                                 .textTheme
//                                 .bodyMedium
//                                 ?.copyWith(color: Colors.grey),
//                             enabledBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.grey.shade100)),
//                             errorBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.red..shade300)),
//                             focusedErrorBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.red..shade300)),
//                             disabledBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.grey.shade100)),
//                             focusedBorder: const UnderlineInputBorder(
//                                 borderSide: BorderSide(color: primaryColor_2)),
//                             border: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.grey.shade100))),
//                       ),
//                     ),
//                     ValueListenableBuilder(
//                         valueListenable: checkValueNotify,
//                         builder: (BuildContext context, bool isChecked, snapshot) {
//                           return CheckboxListTile(
//                               controlAffinity: ListTileControlAffinity.leading,
//                               contentPadding: EdgeInsets.zero,
//                               title: RichText(
//                                   text: TextSpan(
//                                       text: "Ulanyş kadalaryny we düzgünlerini",
//                                       recognizer: TapGestureRecognizer()
//                                         ..onTap = () {
//                                           Get.toNamed(PrivacyAndPolicy.routeName);
//                                         },
//                                       children: [
//                                         TextSpan(
//                                             text: " kabul edýärin",
//                                             style: Theme.of(context).textTheme.labelMedium)
//                                       ],
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .labelMedium
//                                           ?.copyWith(decoration: TextDecoration.underline))),
//                               value: isChecked,
//                               tristate: true,
//                               onChanged: (value) {
//                                 checkValueNotify.value = value ?? false;
//                               });
//                         }),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
//                       child: ValueListenableBuilder(
//                           valueListenable: checkValueNotify,
//                           builder: (BuildContext context, bool isChecked, Widget? child) {
//                             return RaisedButton(
//                               padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
//                               color: primaryColor_2,
//                               disabledColor: primaryColor_2.withOpacity(0.5),
//                               shape: RoundedRectangleBorder(borderRadius: circular5),
//                               onPressed: isLoading || !isChecked ? null : () => loginFn(),
//                               child: AnimatedCrossFade(
//                                 crossFadeState: isLoading
//                                     ? CrossFadeState.showSecond
//                                     : CrossFadeState.showFirst,
//                                 duration: const Duration(milliseconds: 300),
//                                 alignment: Alignment.center,
//                                 firstChild: Text(
//                                   "login_btn_txt".tr,
//                                   style: Theme.of(context).textTheme.button?.copyWith(
//                                         color: Colors.white,
//                                       ),
//                                 ),
//                                 secondChild: const Padding(
//                                   padding: EdgeInsets.all(2.0),
//                                   child: SizedBox(
//                                       height: 20,
//                                       width: 20,
//                                       child: CircularProgressIndicator(
//                                           color: primaryColor_1, backgroundColor: Colors.white)),
//                                 ),
//                               ),
//                             );
//                           }),
//                     ),
//                   ]),
//             ),
//           );
//         });
//   }
// }
