import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:sarweal/constants/constants.dart';
import 'package:sarweal/constants/enums.dart';
import 'package:sarweal/models/snackbar.model.dart';
import 'package:sarweal/service/auth.service.dart';
import 'package:sarweal/utils/masked_formatter.dart';
import 'package:sarweal/views/profil/sub/privacy_and_policy_page.dart';
import 'package:sarweal/views/screen_repository.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  final GlobalKey<FormFieldState> _formKey = GlobalKey<FormFieldState>();

  final TextEditingController _phone = TextEditingController();
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  void loginFn() async {
    if (_formKey.currentState!.validate()) {
      isLoading.value = true;
      final result = await AuthService.login(_phone.text.split(" ").join(""));

      switch (result?.message) {
        case ResponseMessage.sended:
          {
            ///
            ///if sms code send go next page
            ///
            Get.toNamed(OTPScreen.routeName, arguments: _phone.text.split(" ").join(""));
            break;
          }
        case ResponseMessage.phoneError:
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
      isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoading.value,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          backgroundColor: fonColor_2,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                IconlyLight.arrowLeft2,
                color: Colors.black,
              )),
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: fonColor_2, statusBarIconBrightness: Brightness.dark),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: fonColor_1,
        body: Container(
          decoration: const BoxDecoration(
              color: fonColor_1,
              image: DecorationImage(
                  image: AssetImage("assets/images/backgraund.png"), fit: BoxFit.cover)),
          child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              children: [
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
                    key: _formKey,
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
                        prefixIcon: Text("+993  ", style: Theme.of(context).textTheme.bodyMedium),
                        hintText: "Telefon belgiňiz",
                        helperText: "",
                        prefixIconConstraints: BoxConstraints(maxHeight: 40),
                        hintStyle:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade100)),
                        errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red..shade300)),
                        focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red..shade300)),
                        disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade100)),
                        focusedBorder:
                            UnderlineInputBorder(borderSide: BorderSide(color: primaryColor_2)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade100))),
                  ),
                ),
                CheckboxListTile(
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
                                ?.copyWith(decoration: TextDecoration.underline, inherit: true))),
                    value: true,
                    onChanged: (value) {}),
                ValueListenableBuilder(
                    valueListenable: isLoading,
                    builder: (BuildContext context, bool loading, Widget? child) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                        child: RaisedButton(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                          color: primaryColor_2,
                          disabledColor: primaryColor_2.withOpacity(0.5),
                          shape: RoundedRectangleBorder(borderRadius: circular5),
                          onPressed: loading ? null : () => loginFn(),
                          //Get.toNamed(OTPScreen.routeName, arguments: "64664642"), // null, // loginFn,
                          child: AnimatedCrossFade(
                            crossFadeState:
                                loading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                            duration: Duration(milliseconds: 500),
                            firstChild: Text(
                              "login_btn_txt".tr,
                              style: Theme.of(context).textTheme.button?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            secondChild: SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator.adaptive(
                                    strokeWidth: 2, backgroundColor: Colors.white)),
                          ),
                        ),
                      );
                    }),
              ]),
        ),
      ),
    );
  }
}
