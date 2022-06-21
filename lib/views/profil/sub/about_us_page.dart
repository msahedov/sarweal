import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:sarweal/constants/constants.dart';
import 'package:sarweal/views/profil/sub/privacy_and_policy_page.dart';
import 'package:share/share.dart';

class AboutUsPage extends StatelessWidget {
  static const String routeName = '/aboutus';

  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fonColor_2,
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
                splashRadius: 25,
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                onPressed: () {
                  Share.share(
                      'https://play.google.com/store/apps/details?id=com.bilermennesil.sarweal',
                      subject: 'sarweal');
                },
                icon: const Icon(
                  Icons.share_outlined,
                  color: Colors.black,
                )),
          )
        ],
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: fonColor_2, statusBarIconBrightness: Brightness.dark),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: fonColor_2,
          image:
              DecorationImage(image: AssetImage("assets/images/backgraund.png"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 15),
              child: Image.asset("assets/logo/sarweal_log.png", height: 35),
            ),
            Text(
              "${"version".tr} 1.1.0",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Text("about_text".tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Colors.grey.shade600, height: 1.2, letterSpacing: .7, wordSpacing: 2)),
            ),
            Spacer(),

            // TextButton(
            //   onPressed: () {},
            //   style: TextButton.styleFrom(padding: EdgeInsets.zero),
            //   child: Text(
            //     "Ulanylyş düzgünleri we kadalary",
            //     textAlign: TextAlign.center,
            //     style: Theme.of(context).textTheme.caption?.copyWith(color: Colors.grey.shade400),
            //   ),
            // ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Ulanylyş düzgünleri we kadalary",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(PrivacyAndPolicy.routeName);
                    },
                  style:
                      Theme.of(context).textTheme.caption?.copyWith(color: Colors.grey.shade400)),
            ),
            Text(
              "©2022 Sarweal",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(height: 1.5, color: Colors.grey.shade400),
            )
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text("about_text".tr, style: Theme.of(context).textTheme.titleMedium),
            // )
            // ListTile(
            //   minLeadingWidth: 0,
            //   title: Row(
            //     children: [
            //       Container(
            //         height: 30,
            //         width: 5,
            //         decoration: BoxDecoration(
            //           borderRadius: circular5,
            //           color: primaryColor_2,
            //         ),
            //       ),
            //       Text("about_us".tr.toUpperCase(), style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500)),
            //     ],
            //   ), // Flexible(child: Text("\nBELLIK", style: Theme.of(context).textTheme.headline1?.copyWith(fontWeight: FontWeight.w400))),
            //   subtitle: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Text("about_text".tr, style: const TextStyle(wordSpacing: 4, letterSpacing: 0.7, fontSize: 16)),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
