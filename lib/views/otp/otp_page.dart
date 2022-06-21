import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sarweal/constants/constants.dart';
import 'package:sarweal/service/locale.service.dart';
import 'package:sarweal/service/auth.service.dart';

class OTPScreen extends StatefulWidget {
  final String? phone;
  static const String routeName = '/otp';
  const OTPScreen({Key? key, this.phone}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late CountdownController _timer;
  final TextEditingController _codeController = TextEditingController();
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final StreamController<ErrorAnimationType> _errorController =
      StreamController<ErrorAnimationType>();
  bool isRunning = false;

  @override
  void initState() {
    _timer = CountdownController(
        duration: const Duration(seconds: 120),
        onEnd: () {
          setState(() {
            isRunning = true;
          });
        })
      ..start();

    super.initState();
  }

  @override
  void dispose() {
    _errorController.close();
    super.dispose();
  }

  void _otpFn() async {
    //  if (_formKey.currentState!.validate()) {
    final result = await AuthService.verifyOtpCode(widget.phone ?? "", _codeController.text);
    //  if (result?.code == 200) {
    //   Get.reloadAll(force: true);
    // }
    //   }
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
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
              statusBarColor: fonColor_2, statusBarIconBrightness: Brightness.dark),
          elevation: 0.0,
          backgroundColor: fonColor_2,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: fonColor_2,
        body: Container(
          decoration: const BoxDecoration(
              color: fonColor_1,
              image: DecorationImage(
                  image: AssetImage("assets/images/backgraund.png"), fit: BoxFit.cover)),
          alignment: Alignment.center,
          child: ListView(
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
                enableActiveFill: false,
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
                child: AnimatedCrossFade(
                    firstChild: Countdown(
                        countdownController: _timer,
                        builder: (context, Duration time) {
                          return Center(
                            child: Text(
                              '${time.inMinutes % 60} : ${time.inSeconds % 60}',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color:
                                      primaryColor_2), // const TextStyle(fontSize: 14, color: primaryColor_2, fontWeight: FontWeight.bold),
                            ),
                          );
                        }),
                    firstCurve: Curves.easeInOutCubicEmphasized,
                    secondCurve: Curves.easeInOutCubicEmphasized,
                    secondChild: TextButton(
                        style: TextButton.styleFrom(primary: primaryColor_2),
                        onPressed: () {
                          //Get.find<AuthController>().postphone(widget.phone!.split(" ").join(""), "");

                          if (!_timer.isRunning) {
                            _timer = CountdownController(
                                duration: const Duration(seconds: 120),
                                onEnd: () {
                                  setState(() {
                                    isRunning = true;
                                  });
                                })
                              ..start();

                            setState(() {
                              isRunning = false;
                            });
                          }

                          //_snackBar("try_sms_code".tr);
                        },
                        child: Text(
                          "sms_try_again_btn_txt".tr,
                          style: Theme.of(context).textTheme.bodyText2,
                        )),
                    crossFadeState:
                        isRunning ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 300)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: RaisedButton(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                  color: primaryColor_2,
                  disabledColor: primaryColor_2.withOpacity(0.5),
                  shape: RoundedRectangleBorder(borderRadius: circular5),
                  onPressed: _otpFn,
                  child: Text(
                    "accept_sms_code".tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.button?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
