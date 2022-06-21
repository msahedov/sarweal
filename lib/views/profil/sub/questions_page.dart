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
            Text("\u00B7 " + "a_1".tr,
                style:
                    Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5, wordSpacing: 1)),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: Text("q_2".tr, style: Theme.of(context).textTheme.titleMedium),
            ),
            Text("\u00B7 " + "a_2".tr,
                style:
                    Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5, wordSpacing: 1)),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: Text("q_3".tr, style: Theme.of(context).textTheme.titleMedium),
            ),
            Text("\u00B7 " + "a_3".tr,
                style:
                    Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5, wordSpacing: 1)),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: Text("q_4".tr, style: Theme.of(context).textTheme.titleMedium),
            ),
            Text("\u00B7 " + "a_4".tr,
                style:
                    Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5, wordSpacing: 1)),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: Text("q_5".tr, style: Theme.of(context).textTheme.titleMedium),
            ),
            Text("\u00B7 " + "a_5".tr,
                style:
                    Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5, wordSpacing: 1)),
          ],
        ),
      ),
    );
  }

  // Widget myText(BuildContext context, String name) {
  //   return Flexible(
  //     child: Container(
  //       width: double.infinity,
  //       padding: const EdgeInsets.all(15),
  //       child: Text(name, maxLines: 2, textAlign: TextAlign.left, overflow: TextOverflow.clip, style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500)),
  //     ),
  //   );
  // }

  // Row _verticalDivider(BuildContext context, String text) {
  //   return Row(
  //     children: [
  //       Container(
  //         height: 30,
  //         width: 5,
  //         decoration: BoxDecoration(
  //           borderRadius: circular5,
  //           color: primaryColor_2,
  //         ),
  //       ),
  //       myText(context, text),
  //     ],
  //   );
  // }

  // ExpandableNotifier _questionTile(context, String q, String a) {
  //   return ExpandableNotifier(
  //       child: ScrollOnExpand(
  //     child: Column(
  //       children: <Widget>[
  //         ExpandablePanel(
  //           theme: const ExpandableThemeData(
  //             headerAlignment: ExpandablePanelHeaderAlignment.center,
  //             tapBodyToExpand: true,
  //             tapBodyToCollapse: true,

  //             iconPadding: EdgeInsets.only(right: 20),
  //             // iconColor: Colors.black,
  //             iconSize: 26,
  //             hasIcon: true,
  //           ),
  //           header: Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //             child: ListTile(
  //                 title: Text(q, style: Theme.of(context).textTheme.titleMedium),
  //                 trailing: const Padding(
  //                   padding: EdgeInsets.all(8.0),
  //                 )),
  //           ),
  //           collapsed: const SizedBox.shrink(),
  //           expanded: Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 30.0),
  //             child: Column(
  //               children: [Text("\u00B7 $a")],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   ));
  // }

}
