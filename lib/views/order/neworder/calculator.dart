import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sarweal/constants/constants.dart';
import 'package:sarweal/constants/enums.dart';
import 'package:url_launcher/url_launcher.dart';

class Calculator extends StatelessWidget {
  Calculator({Key? key}) : super(key: key);

  static const String routeName = "/calculator";

  ///
  ///The maximum of money entered by customer
  ///

  final ValueNotifier<TextEditingController> amountMoneyController =
      ValueNotifier(TextEditingController());

  ///
  ///They received the amount of money for the amount of money at
  ///a maximum of the maximum amount of several financial money
  ///[TL] to convert [TMT]

  final ValueNotifier<TextEditingController> receivedMoneyController =
      ValueNotifier(TextEditingController(text: "0.0"));

  ///
  ///Coefficient of the amount of money received
  ///[0%]Without pre-payment
  final double coefficient = 1.87;

  ///
  ///Coefficient of the amount of money received
  ///[100%]full prepayment
  final double disCoefficient = 1.60;

  ///
  ///Payment method
  final ValueNotifier<PaymentMethod> paymentMethod = ValueNotifier(PaymentMethod.full);

  ///
  ///1 counts the old one in which "Turkish lira" is equal
  ///parametres of the amount money[tl] with payment method[method]
  void convertToTmt(String tl, PaymentMethod method) {
    double tlValue = double.tryParse(tl) ?? 0.0;
    double tmtValue = 0.0;
    if (method == PaymentMethod.full) {
      tmtValue = tlValue * disCoefficient;
    } else if (method == PaymentMethod.zero) {
      tmtValue = tlValue * coefficient;
    }
    receivedMoneyController.value.text = tmtValue.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        titleSpacing: 0.0,
        leading: IconButton(
          padding: EdgeInsets.zero,
          splashRadius: 25,
          onPressed: () => Get.back(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          icon: const Icon(
            IconlyLight.arrowLeft2,
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
        children: [
          Text(
            "Gysgaça maglumat",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(height: 2),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 25),
            child: Text(
                "Sarweal onlaýn dükanymyzyň hormatly müşderileri.Siz türkiýanyň internet sahypalaryndan harytlary aňsatlyk bilen sargyt edip bilersiňiz.",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(height: 1.7, wordSpacing: 1.5, color: Colors.grey)),
          ),
          RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                  text: "Meselem:  ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(height: 1.5, wordSpacing: 1.5, color: Colors.grey),
                  children: [
                    TextSpan(
                      text: "trendyol.com",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (!await launchUrl(Uri(scheme: "https", host: "www.trendyol.com"),
                              mode: LaunchMode.inAppWebView)) throw 'Could not launch';
                        },
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.5, wordSpacing: 1.5, color: primaryColor_2.withOpacity(0.5)),
                    ),
                    TextSpan(
                      text: "\n              hepsiburada.com",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (!await launchUrl(Uri(scheme: "https", host: "www.hepsiburada.com"),
                              mode: LaunchMode.inAppWebView)) throw 'Could not launch';
                        },
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.5, wordSpacing: 1.5, color: primaryColor_2.withOpacity(0.5)),
                    ),
                    TextSpan(
                      text: "\n              gittigidiyor.com",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (!await launchUrl(Uri(scheme: "https", host: "www.gittigidiyor.com"),
                              mode: LaunchMode.inAppWebView)) throw 'Could not launch';
                        },
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.5, wordSpacing: 1.5, color: primaryColor_2.withOpacity(0.5)),
                    ),
                    TextSpan(
                      text: "  we ş.m",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(height: 1.5, wordSpacing: 1.5, color: Colors.grey),
                    ),
                  ])),
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 45),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(color: Colors.grey.shade300, width: 1)),
                  boxShadow: [shadow],
                  color: Colors.white,
                  borderRadius: circular10),
              child: Column(
                mainAxisSize: MainAxisSize.min,

                // shrinkWrap: true,
                //physics: const NeverScrollableScrollPhysics(),
                children: [
                  Text(
                      "Milli walýutada eltip bermek bilen birlikde harytlaryň doly bahasyny derrew bilip bilersiňiz.",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(height: 1.7, wordSpacing: 1.5, color: Colors.black54)),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Öňünden tölemezden",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 14),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: ValueListenableBuilder(
                                valueListenable: paymentMethod,
                                builder:
                                    (BuildContext context, PaymentMethod method, Widget? child) {
                                  return Switch(
                                      value: method == PaymentMethod.full ? true : false,
                                      onChanged: (val) {
                                        paymentMethod.value =
                                            val ? PaymentMethod.full : PaymentMethod.zero;
                                        convertToTmt(
                                            amountMoneyController.value.text, paymentMethod.value);
                                      });
                                })),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "100% öňünden töleg",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 3,
                          child: ValueListenableBuilder(
                              valueListenable: amountMoneyController,
                              builder: (BuildContext context, TextEditingController controller,
                                  Widget? child) {
                                return TextFormField(
                                  controller: controller,
                                  keyboardType: TextInputType.number,
                                  style: Theme.of(context).textTheme.bodySmall,
                                  cursorColor: primaryColor_2,
                                  enableInteractiveSelection: false,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                      filled: true,
                                      suffixText: "TL",
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: circular5,
                                          borderSide: BorderSide(color: Colors.grey.shade100)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius: circular5,
                                          borderSide: BorderSide(color: Colors.grey.shade100)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: circular5,
                                          borderSide: BorderSide(color: Colors.grey.shade100)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: circular5,
                                          borderSide: BorderSide(color: Colors.grey.shade100)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: circular5,
                                          borderSide: BorderSide(color: Colors.grey.shade100)),
                                      border: OutlineInputBorder(
                                          borderRadius: circular5,
                                          borderSide: BorderSide(color: Colors.grey.shade100))),
                                );
                              })),
                      const Icon(Icons.drag_handle_outlined, size: 30, color: Colors.black),
                      Expanded(
                          flex: 3,
                          child: ValueListenableBuilder(
                              valueListenable: receivedMoneyController,
                              builder: (BuildContext context, TextEditingController controller,
                                  Widget? child) {
                                return TextFormField(
                                  controller: controller,
                                  readOnly: true,
                                  style: Theme.of(context).textTheme.bodySmall,
                                  enableInteractiveSelection: false,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                      filled: true,
                                      suffixText: "TMT",
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: circular5,
                                          borderSide: BorderSide(color: Colors.grey.shade100)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius: circular5,
                                          borderSide: BorderSide(color: Colors.grey.shade100)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: circular5,
                                          borderSide: BorderSide(color: Colors.grey.shade100)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: circular5,
                                          borderSide: BorderSide(color: Colors.grey.shade100)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: circular5,
                                          borderSide: BorderSide(color: Colors.grey.shade100)),
                                      border: OutlineInputBorder(
                                          borderRadius: circular5,
                                          borderSide: BorderSide(color: Colors.grey.shade100))),
                                );
                              })),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: circular5),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        onPressed: () {
                          convertToTmt(amountMoneyController.value.text, paymentMethod.value);
                        },
                        color: primaryColor_2,
                        child: Text("Hasaplamak",
                            style:
                                Theme.of(context).textTheme.button?.copyWith(color: Colors.white))),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: DataTable(
                border: TableBorder(borderRadius: circular10),
                horizontalMargin: 10,
                columnSpacing: 20,
                dataTextStyle: Theme.of(context).textTheme.bodySmall,
                headingTextStyle:
                    Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                headingRowColor: MaterialStateProperty.all<Color>(const Color(0xFf343a40)),
                columns: [
                  DataColumn(label: Text("#")),
                  DataColumn(label: Text("Agramy")),
                  DataColumn(
                      label: SvgPicture.asset(
                    "assets/images/truck.svg",
                    height: 20,
                    width: 20,
                    color: Colors.white,
                  )),
                  DataColumn(
                      label: SvgPicture.asset(
                    "assets/images/plane.svg",
                    height: 20,
                    width: 20,
                    color: Colors.white,
                  )),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Text("1")),
                    DataCell(Text("1 KG", maxLines: 1)),
                    DataCell(Text("30 TMT", maxLines: 1)),
                    DataCell(Text("80 TMT", maxLines: 1)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text("2")),
                    DataCell(Text("2 KG", maxLines: 1)),
                    DataCell(Text("60 TMT", maxLines: 1)),
                    DataCell(Text("160 TMT", maxLines: 1)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text("3")),
                    DataCell(Text("3 KG", maxLines: 1)),
                    DataCell(Text("90 TMT", maxLines: 1)),
                    DataCell(Text("240 TMT", maxLines: 1)),
                  ]),
                ]),
          ),
          Text(
              "Eger-de siziň harydyňyz 1 kg az ýa-da köp bolsa agrama görä tölener.Ähli harytlar biziň dükanymyzda işgärler tarapyndan ölçenilýär.Ähli maglumatlar çekde görkezilýär.",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(height: 1.7, wordSpacing: 1.5, color: Colors.grey))
        ],
      ),
    );
  }
}
