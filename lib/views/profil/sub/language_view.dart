import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:sarweal/constants/constants.dart';
import 'package:sarweal/service/locale.service.dart';

enum LanguageCode { tk, ru }

class LanguageView extends StatefulWidget {
  static const String routeName = '/language';

  const LanguageView({Key? key}) : super(key: key);
  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  LocaleController get controller => LocaleController();
  ValueNotifier<LanguageCode> _LanguageCode = ValueNotifier(LanguageCode.ru);

  @override
  void initState() {
    initilizeAppLocale();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fonColor_2,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: fonColor_2, statusBarIconBrightness: Brightness.dark),
        backgroundColor: fonColor_2,
        elevation: 0,
        leading: IconButton(
            splashRadius: 25,
            padding: EdgeInsets.zero,
            onPressed: () => Get.back(),
            icon: const Icon(
              IconlyLight.arrowLeft2,
              color: Colors.black,
            )),
      ),
      body: ValueListenableBuilder(
          valueListenable: _LanguageCode,
          builder: (BuildContext context, LanguageCode l, Widget? child) {
            return Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/backgraund.png"), fit: BoxFit.cover)),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(left: 5),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10, right: 5),
                    child: Text("select_language".tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24)),
                  ),
                  ListTile(
                      horizontalTitleGap: 5,
                      onTap: () {
                        _LanguageCode.value = LanguageCode.tk;
                        controller.changeApplocale = "tk";
                      },
                      leading: const CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage("assets/images/tm.png"),
                      ),
                      title: Text("Türkmen dili", style: Theme.of(context).textTheme.bodyMedium),
                      trailing: Radio<LanguageCode>(
                          value: LanguageCode.tk,
                          groupValue: l,
                          onChanged: (val) {
                            setState(() {
                              _LanguageCode.value = val ?? LanguageCode.tk;
                              controller.changeApplocale = "tk";
                            });
                          })),
                  ListTile(
                      horizontalTitleGap: 5,
                      onTap: () {
                        _LanguageCode.value = LanguageCode.ru;
                        controller.changeApplocale = "ru";
                      },
                      leading: const CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage("assets/images/ru.png"),
                      ),
                      title: Text("Русский язык", style: Theme.of(context).textTheme.bodyMedium),
                      trailing: Radio<LanguageCode>(
                        value: LanguageCode.ru,
                        onChanged: (val) {
                          setState(() {
                            _LanguageCode.value = val ?? LanguageCode.ru;
                            controller.changeApplocale = "ru";
                          });
                        },
                        groupValue: l,
                      ))
                ],
              ),
            );
          }),
    );
  }

  void initilizeAppLocale() {
    if (Get.locale?.languageCode == "tk") {
      _LanguageCode.value = LanguageCode.tk;
    } else {
      _LanguageCode.value = LanguageCode.ru;
    }
  }
}
