// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sarweal/constants/constants.dart';
import 'package:sarweal/constants/enums.dart';
import 'package:sarweal/models/snackbar.model.dart';
import 'package:sarweal/service/auth.service.dart';
import 'package:sarweal/service/locale.service.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  static const String routeName = '/otp';
  const OTPScreen({Key? key, required this.phone}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  CountdownController? _timer;
  final TextEditingController _codeController = TextEditingController();
  final StreamController<ErrorAnimationType> _errorController =
      StreamController<ErrorAnimationType>();
  ValueNotifier<bool> loadingValueNotify = ValueNotifier(false);

  bool isTimerEnd = false;
  @override
  void initState() {
    _timer = CountdownController(
        duration: const Duration(seconds: 10),
        onEnd: () {
          setState(() {
            isTimerEnd = true;
          });
        })
      ..start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (BuildContext context, bool isLoading, Widget? child) {
        return AbsorbPointer(
          absorbing: !isLoading,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                  padding: EdgeInsets.zero,
                  splashRadius: 25,
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    IconlyLight.arrowLeft2,
                    color: Colors.black,
                  )),
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
              elevation: 0.0,
              backgroundColor: Colors.white,
            ),
            body: ListView(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              children: <Widget>[
                Text(
                  "Tassyklaýjy kod",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 26),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, top: 15),
                  child: RichText(
                    text: LocaleController().getlocale.languageCode == "tk"
                        ? TextSpan(
                            text: "  +993 ${widget.phone} ",
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: [
                              TextSpan(
                                  text: "otp_header_txt".tr,
                                  style: Theme.of(context).textTheme.bodyMedium)
                            ],
                          )
                        : TextSpan(
                            text: "otp_header_txt".tr,
                            children: [
                              TextSpan(
                                  text: "  +993 ${widget.phone} ",
                                  style: Theme.of(context).textTheme.bodyMedium),
                            ],
                            style: Theme.of(context).textTheme.bodyMedium),
                    textAlign: TextAlign.center,
                  ),
                ),
                PinCodeTextField(
                  appContext: context,
                  autoFocus: false,
                  length: 6,
                  obscureText: false,
                  obscuringCharacter: '*',
                  blinkWhenObscuring: true,
                  animationType: AnimationType.scale,
                  onAutoFillDisposeAction: AutofillContextAction.commit,
                  textStyle: Theme.of(context).textTheme.headline6,
                  validator: (text) {
                    if (text!.length < 6) {
                      return "incorrect_sms_code".tr;
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    errorBorderColor: Colors.red,
                    selectedFillColor: Colors.white,
                    activeColor: primaryColor_2,
                    selectedColor: primaryColor_2,
                    inactiveFillColor: Colors.white,
                    disabledColor: Colors.white,
                    inactiveColor: Colors.grey,
                    shape: PinCodeFieldShape.underline,
                    fieldOuterPadding: const EdgeInsets.fromLTRB(1.0, 0, 1.0, 0),
                    //borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 45,
                    activeFillColor: Colors.white,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  errorAnimationController: _errorController,
                  controller: _codeController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    return true;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 30),
                  child: Center(
                    child: AnimatedCrossFade(
                        alignment: Alignment.center,
                        firstChild: Countdown(
                          builder: (context, Duration time) {
                            return Text(
                                '0${time.inMinutes % 60} : ${time.inSeconds % 60 >= 10 ? "${time.inSeconds % 60}" : "0${time.inSeconds % 60}"}',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium);
                          },
                          countdownController: _timer ??
                              CountdownController(
                                  duration: const Duration(seconds: 10),
                                  onEnd: () {
                                    setState(() {
                                      isTimerEnd = true;
                                    });
                                  })
                            ..start(),
                        ),
                        secondChild: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "sms_try_again_btn_txt".tr,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  AuthService.sendOtp(widget.phone);
                                  if (!_timer!.isRunning) {
                                    _timer = CountdownController(
                                        duration: const Duration(seconds: 10),
                                        onEnd: () {
                                          setState(() {
                                            isTimerEnd = true;
                                          });
                                        })
                                      ..start();

                                    setState(() {
                                      isTimerEnd = false;
                                    });
                                  }
                                },
                              style: Theme.of(context).textTheme.bodyMedium,
                            )),
                        crossFadeState:
                            isTimerEnd ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 300)),
                  ),
                ),
                ValueListenableBuilder(
                    valueListenable: _codeController,
                    builder: (BuildContext context, TextEditingValue value, Widget? child) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: RaisedButton(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                          color: primaryColor_2,
                          disabledColor: primaryColor_2.withOpacity(0.5),
                          shape: RoundedRectangleBorder(borderRadius: circular5),
                          onPressed: value.text.length < 6
                              ? null
                              : () {
                                  AuthService.verifyOtpCode(widget.phone, _codeController.text)
                                      .then((response) {
                                    switch (response?.message) {
                                      case ResponseMessage.codeVerified:
                                        {
                                          ///
                                          ///if sms code send go next page
                                          ///
                                          Get.reloadAll();
                                          break;
                                        }
                                      case ResponseMessage.wrongCode:
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
                                    //loadingValueNotify.value = false;
                                  });
                                },
                          child: AnimatedCrossFade(
                            crossFadeState:
                                isLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                            duration: const Duration(milliseconds: 300),
                            alignment: Alignment.center,
                            firstChild: Text(
                              "accept_sms_code".tr,
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
                                      color: primaryColor_1, backgroundColor: Colors.white)),
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
          ),
        );
      },
      valueListenable: loadingValueNotify,
    );
  }
}
