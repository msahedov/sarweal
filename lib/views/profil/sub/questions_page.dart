import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:sarweal/constants/constants.dart';

class QuestionPage extends StatelessWidget {
  static const String routeName = '/questions';

  const QuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: fonColor_2, // Colors.white,
        leading: IconButton(
            splashRadius: 25,
            padding: EdgeInsets.zero,
            onPressed: () => Get.back(),
            icon: const Icon(
              IconlyLight.arrowLeft2,
              color: Colors.black,
            )),
        elevation: 0.0,

        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: fonColor_2, statusBarIconBrightness: Brightness.dark),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: fonColor_2,
          image:
              DecorationImage(image: AssetImage("assets/images/backgraund.png"), fit: BoxFit.cover),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          children: [
            Text("question_answer".tr.toUpperCase(), style: Theme.of(context).textTheme.titleLarge),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: Text("q_1".tr, style: Theme.of(context).textTheme.titleMedium),
            ),
            // ignore: prefer_interpolation_to_compose_strings
            Text("\u00B7 " + "a_1".tr,
                style:
                    Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5, wordSpacing: 1)),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: Text("q_2".tr, style: Theme.of(context).textTheme.titleMedium),
            ),
            Text("\u00B7 ${"a_2".tr}",
                style:
                    Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5, wordSpacing: 1)),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: Text("q_3".tr, style: Theme.of(context).textTheme.titleMedium),
            ),
            Text("\u00B7 ${"a_3".tr}",
                style:
                    Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5, wordSpacing: 1)),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: Text("q_4".tr, style: Theme.of(context).textTheme.titleMedium),
            ),
            Text("\u00B7 ${"a_4".tr}",
                style:
                    Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5, wordSpacing: 1)),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: Text("q_5".tr, style: Theme.of(context).textTheme.titleMedium),
            ),
            Text("\u00B7 ${"a_5".tr}",
                style:
                    Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5, wordSpacing: 1)),
          ],
        ),
      ),
    );
  }
}
