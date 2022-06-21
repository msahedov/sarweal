import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:sarweal/constants/constants.dart';

class ContactsPage extends StatelessWidget {
  static const String routeName = '/contacts';

  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fonColor_2,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: fonColor_2,
        leading: IconButton(
            splashRadius: 25,
            padding: EdgeInsets.zero,
            onPressed: () => Get.back(),
            icon: const Icon(
              IconlyLight.arrowLeft2,
              color: Colors.black,
            )),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: fonColor_2, statusBarIconBrightness: Brightness.dark),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: const BoxDecoration(
          color: fonColor_2,
          image:
              DecorationImage(image: AssetImage("assets/images/backgraund.png"), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5, left: 15),
              child: Text("Habarlaşmak üçin",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24)),
            ),
            ListTile(
              horizontalTitleGap: 0,
              leading: ImageIcon(
                AssetImage("assets/images/instagram.png"),
                color: Colors.grey.shade800,
                size: 20,
              ),
              title: Text("@sarweal", style: Theme.of(context).textTheme.bodyMedium),
            ),
            ListTile(
              horizontalTitleGap: 0,
              leading: ImageIcon(AssetImage("assets/images/imo.png"),
                  size: 20, color: Colors.grey.shade800),
              title: Text("+993 64173366", style: Theme.of(context).textTheme.bodyMedium),
            ),
            ListTile(
              horizontalTitleGap: 0,
              leading: ImageIcon(AssetImage("assets/images/mail.png"),
                  size: 20, color: Colors.grey.shade800),
              title: Text("hello@sarweal.com", style: Theme.of(context).textTheme.bodyMedium),
            ),
            ListTile(
              horizontalTitleGap: 0,
              leading: Icon(IconlyLight.call, size: 20, color: Colors.grey.shade800),
              title: Text("+993 64 159977",
                  style: Theme.of(context).textTheme.bodyMedium), //("+993 64 173366
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 5, left: 15),
              child: Text("Biziň salgymyz",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24)),
            ),
            ListTile(
              horizontalTitleGap: 0,
              leading: Icon(
                IconlyLight.location,
                size: 20,
                color: Colors.grey.shade800,
              ),
              title: Text("Garaşsyzlyk şaýoly, jaý 90, Aşgabat",
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 4),
                  ImageIcon(
                    AssetImage("assets/images/instagram.png"),
                    color: Colors.grey.shade400,
                    size: 25,
                  ),
                  Spacer(flex: 1),
                  ImageIcon(
                    AssetImage("assets/images/mail.png"),
                    color: Colors.grey.shade500,
                    size: 25,
                  ),
                  Spacer(flex: 1),
                  ImageIcon(
                    AssetImage("assets/images/imo.png"),
                    color: Colors.grey.shade400,
                    size: 25,
                  ),
                  Spacer(flex: 4),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
