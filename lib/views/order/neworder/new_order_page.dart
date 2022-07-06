import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:sarweal/views/bottom/bottom_nav_bar.dart';
import 'package:sarweal/views/order/neworder/info.dart';
import 'package:sarweal/views/order/neworder/items.dart';
import 'package:sarweal/views/order/neworder/shipment.dart';
import 'package:sarweal/views/order/neworder/tariff.dart';

class NewOrderPage extends StatefulWidget {
  const NewOrderPage({Key? key, this.subPageController}) : super(key: key);

  final TabController? subPageController;

  ///
  /// route name
  static const String routeName = '/neworder';

  @override
  State<NewOrderPage> createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {
  final Duration duration = const Duration(milliseconds: 300);

  ///
  /// initial page index
  ///
  late final ValueNotifier<int> initialPage; //= ValueNotifier<int>(0);

  ///
  /// controller for page view

  ///
  late final PageController pageController; // = PageController();

  ///
  /// next page function
  ///
  nextPage(int initialPage) {
    pageController.nextPage(duration: duration, curve: Curves.linear);
  }

  ///
  /// previous page function
  ///

  previousPage(int initialPage) {
    pageController.previousPage(duration: duration, curve: Curves.linear);
  }

  @override
  void initState() {
    initialPage = ValueNotifier<int>(0);
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: initialPage,
      builder: (BuildContext context, int page, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.grey.shade50,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            titleSpacing: 0.0,
            leading: IconButton(
              padding: EdgeInsets.zero,
              splashRadius: 25,
              onPressed: () {
                widget.subPageController?.animateTo(0);
                pageIndex.value = 0;
                //subPageController?.previousPage(duration: duration, curve: Curves.linear);
              },
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
          body: PageView(
            key: PageStorageKey("page"),
            controller: pageController,
            onPageChanged: (pageIndex) {
              initialPage.value = pageIndex;
            },
            physics: const NeverScrollableScrollPhysics(),
            children: const [Items(), Shipment(), Tariff(), Info()],
          ),
          persistentFooterButtons: [
            FlatButton.icon(
                onPressed: page == 0 ? null : () => previousPage(page),
                icon: Icon(Icons.navigate_before),
                label: Text("Yza")),
            FlatButton.icon(
                onPressed: page == 3 ? null : () => nextPage(page),
                icon: Text("Soňra"),
                label: Icon(Icons.navigate_next))
          ],
        );
      },
    );
  }
}













// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:async/async.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:lottie/lottie.dart';
// import 'package:mime/mime.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:sarweal/constants/constants.dart';
// import 'package:sarweal/constants/enums.dart';
// import 'package:sarweal/controllers/order.add.controller.dart';
// import 'package:sarweal/models/neworder/item.model.dart';
// import 'package:sarweal/models/neworder/new.order.model.dart';
// import 'package:sarweal/service/api.service.dart';
// import 'package:sarweal/service/auth.manager.dart';
// import 'package:sarweal/service/local.storage.dart';
// import 'package:sarweal/service/auth.service.dart';
// import 'package:sarweal/views/screen_repository.dart';
// import 'package:sarweal/utils/masked_formatter.dart';
// import 'package:uuid/uuid.dart';

// class NewOrderPage extends StatefulWidget {
//   static const String routeName = '/neworder';

//   const NewOrderPage({Key? key}) : super(key: key);

//   @override
//   _NewOrderPageState createState() => _NewOrderPageState();
// }

// class _NewOrderPageState extends State<NewOrderPage> {
//   static LocalStorage? _storage;
//   static NewOrderModel? _orderModel;
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final ImagePicker _picker = ImagePicker();
//   final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
//   final FToast _fToast = FToast();
//   final GlobalKey<DropdownSearchState<String>> _multiKey = GlobalKey<DropdownSearchState<String>>();
//   String? _selectedItem;

//   AnimatedList get animatedList => AnimatedList(
//         shrinkWrap: true,
//         key: _listKey,
//         physics: const NeverScrollableScrollPhysics(),
//         initialItemCount: _orderModel?.orderItems?.length ?? 1,
//         itemBuilder: (BuildContext context, int index, animation) {
//           return buildItem(context, index, _orderModel?.orderItems?[index] ?? NewOrderItemModel(), animation);
//         },
//       );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         titleSpacing: 0.0,
//         leading: IconButton(
//           onPressed: () => Get.back(),
//           icon: const Icon(
//             IconlyLight.arrowLeft2,
//             color: Colors.black,
//           ),
//         ),
//         elevation: 0.0,
//         systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
//       ),
//       backgroundColor: Colors.white,
//       resizeToAvoidBottomInset: true,
//       body: ListView(
//         padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
//         children: [],
//       ),
//     ); //const OrderPage(),

//     // return Scaffold(
//     //   appBar: AppBar(
//     //     automaticallyImplyLeading: false,
//     //     backgroundColor: Colors.white,
//     //     titleSpacing: 0.0,
//     //     leading: IconButton(
//     //       onPressed: () => Get.back(),
//     //       icon: const Icon(
//     //         IconlyLight.arrowLeft2,
//     //         color: Colors.black,
//     //       ),
//     //     ),
//     //     elevation: 0.0,
//     //     systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
//     //   ),
//     //   backgroundColor: Colors.white,
//     //   resizeToAvoidBottomInset: true,
//     //   body: ListView(
//     //     padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
//     //     children: [
//     //       Text(
//     //         "Gysgaça maglumat",
//     //         style: Theme.of(context).textTheme.titleLarge?.copyWith(height: 2),
//     //       ),
//     //       Padding(
//     //         padding: const EdgeInsets.only(top: 10, bottom: 25),
//     //         child: Text("Sarweal onlaýn dükanymyzyň hormatly müşderileri.Siz türkiýanyň internet sahypalaryndan harytlary aňsatlyk bilen sargyt edip bilersiňiz.", style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.7, wordSpacing: 1.5, letterSpacing: 0.5, color: Colors.grey)),
//     //       ),
//     //       RichText(
//     //           textAlign: TextAlign.justify,
//     //           text: TextSpan(text: "Meselem:  ", style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5, wordSpacing: 1.5, letterSpacing: 0.5, color: Colors.grey), children: [
//     //             TextSpan(
//     //               text: "trendyol.com",
//     //               recognizer: TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
//     //               style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5, wordSpacing: 1.5, letterSpacing: 0.5, color: primaryColor_2.withOpacity(0.5)),
//     //             ),
//     //             TextSpan(
//     //               text: "\n              hepsiburada.com",
//     //               recognizer: TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
//     //               style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5, wordSpacing: 1.5, letterSpacing: 0.5, color: primaryColor_2.withOpacity(0.5)),
//     //             ),
//     //             TextSpan(
//     //               text: "\n              gittigidiyor.com",
//     //               recognizer: TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
//     //               style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5, wordSpacing: 1.5, letterSpacing: 0.5, color: primaryColor_2.withOpacity(0.5)),
//     //             ),
//     //             const TextSpan(
//     //               text: "  we ş.m",
//     //             ),
//     //           ])),
//     //       Container(
//     //           alignment: Alignment.center,
//     //           margin: const EdgeInsets.symmetric(vertical: 45),
//     //           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//     //           decoration: BoxDecoration(
//     //               border: Border.fromBorderSide(BorderSide(color: Colors.grey.shade300, width: 1)),
//     //               boxShadow: [
//     //                 BoxShadow(
//     //                   offset: const Offset(-1, 1),
//     //                   color: Colors.grey.shade300,
//     //                   blurRadius: 5,
//     //                 ),
//     //               ],
//     //               color: Colors.white,
//     //               borderRadius: circular10),
//     //           child: ListView(
//     //             shrinkWrap: true,
//     //             physics: const NeverScrollableScrollPhysics(),
//     //             children: [
//     //               Text("Milli walýutada eltip bermek bilen birlikde harytlaryň doly bahasyny derrew bilip bilersiňiz.", style: Theme.of(context).textTheme.titleSmall?.copyWith(height: 1.7, wordSpacing: 1.5, letterSpacing: 0.5, color: Colors.black54)),
//     //               const SizedBox(height: 30),
//     //               Row(
//     //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     //                 crossAxisAlignment: CrossAxisAlignment.start,
//     //                 children: [
//     //                   Expanded(
//     //                     flex: 2,
//     //                     child: Text(
//     //                       "Öňünden tölemezden",
//     //                       textAlign: TextAlign.center,
//     //                       overflow: TextOverflow.clip,
//     //                       style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 16),
//     //                     ),
//     //                   ),
//     //                   Expanded(flex: 1, child: CupertinoSwitch(value: true, onChanged: (val) {})),
//     //                   Expanded(
//     //                     flex: 2,
//     //                     child: Text(
//     //                       "100% öňünden töleg",
//     //                       textAlign: TextAlign.center,
//     //                       overflow: TextOverflow.clip,
//     //                       style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 16),
//     //                     ),
//     //                   ),
//     //                 ],
//     //               ),
//     //               Padding(
//     //                 padding: const EdgeInsets.symmetric(vertical: 15),
//     //                 child: Row(
//     //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     //                   crossAxisAlignment: CrossAxisAlignment.center,
//     //                   children: [
//     //                     Expanded(
//     //                         flex: 3,
//     //                         child: TextFormField(
//     //                           keyboardType: TextInputType.number,
//     //                           style: Theme.of(context).textTheme.bodySmall,
//     //                           initialValue: "0.0",
//     //                           enableInteractiveSelection: false,
//     //                           decoration: InputDecoration(
//     //                               contentPadding: const EdgeInsets.symmetric(horizontal: 20),
//     //                               filled: true,
//     //                               suffixText: "TL",
//     //                               focusedErrorBorder: OutlineInputBorder(borderRadius: circular5, borderSide: BorderSide(color: Colors.grey.shade100)),
//     //                               disabledBorder: OutlineInputBorder(borderRadius: circular5, borderSide: BorderSide(color: Colors.grey.shade100)),
//     //                               focusedBorder: OutlineInputBorder(borderRadius: circular5, borderSide: BorderSide(color: Colors.grey.shade100)),
//     //                               enabledBorder: OutlineInputBorder(borderRadius: circular5, borderSide: BorderSide(color: Colors.grey.shade100)),
//     //                               errorBorder: OutlineInputBorder(borderRadius: circular5, borderSide: BorderSide(color: Colors.grey.shade100)),
//     //                               border: OutlineInputBorder(borderRadius: circular5, borderSide: BorderSide(color: Colors.grey.shade100))),
//     //                         )),
//     //                     IconButton(onPressed: () {}, visualDensity: VisualDensity.adaptivePlatformDensity, padding: EdgeInsets.zero, icon: Icon(Icons.change_circle_rounded, size: 40, color: Colors.green)),
//     //                     Expanded(
//     //                         flex: 3,
//     //                         child: TextFormField(
//     //                           initialValue: "0.0",
//     //                           style: Theme.of(context).textTheme.bodySmall,
//     //                           enableInteractiveSelection: false,
//     //                           keyboardType: TextInputType.number,
//     //                           decoration: InputDecoration(
//     //                               contentPadding: const EdgeInsets.symmetric(horizontal: 20),
//     //                               filled: true,
//     //                               suffixText: "TMT",
//     //                               focusedErrorBorder: OutlineInputBorder(borderRadius: circular5, borderSide: BorderSide(color: Colors.grey.shade100)),
//     //                               disabledBorder: OutlineInputBorder(borderRadius: circular5, borderSide: BorderSide(color: Colors.grey.shade100)),
//     //                               focusedBorder: OutlineInputBorder(borderRadius: circular5, borderSide: BorderSide(color: Colors.grey.shade100)),
//     //                               enabledBorder: OutlineInputBorder(borderRadius: circular5, borderSide: BorderSide(color: Colors.grey.shade100)),
//     //                               errorBorder: OutlineInputBorder(borderRadius: circular5, borderSide: BorderSide(color: Colors.grey.shade100)),
//     //                               border: OutlineInputBorder(borderRadius: circular5, borderSide: BorderSide(color: Colors.grey.shade100))),
//     //                         )),
//     //                   ],
//     //                 ),
//     //               ),
//     //               Padding(
//     //                 padding: const EdgeInsets.fromLTRB(40, 15, 40, 0),
//     //                 child: RaisedButton(
//     //                     elevation: 0.0,
//     //                     focusElevation: 0.0,
//     //                     hoverElevation: 0.0,
//     //                     disabledElevation: 0.0,
//     //                     highlightElevation: 0.0,
//     //                     shape: RoundedRectangleBorder(borderRadius: circular5),
//     //                     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//     //                     onPressed: () {},
//     //                     color: primaryColor_2,
//     //                     child: Text("Goşmaça maglumat", style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white))),
//     //               ),
//     //             ],
//     //           )),
//     //       Text(
//     //         "1-nji ädim.",
//     //         style: Theme.of(context).textTheme.titleLarge?.copyWith(height: 2),
//     //       ),
//     //       Padding(
//     //         padding: const EdgeInsets.only(top: 10, bottom: 30),
//     //         child: Text("Harydyň kodyny ýa-da ssylkasyny girizmeli ýa-da skrinşot(suratyny) ýüklemeli, hem-de ululygyny (razmeryny) görkezmeli.", style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5, wordSpacing: 1.5, letterSpacing: 0.5, color: Colors.grey)),
//     //       ),
//     //       animatedList,
//     //       Padding(
//     //         padding: const EdgeInsets.fromLTRB(40, 20, 40, 80),
//     //         child: RaisedButton.icon(
//     //             onPressed: getImage,
//     //             color: primaryColor_2,
//     //             padding: const EdgeInsets.symmetric(vertical: 10),
//     //             shape: RoundedRectangleBorder(borderRadius: circular5),
//     //             icon: const Icon(Icons.add, color: Colors.white),
//     //             label: Text(
//     //               "Ýene-de goşmak",
//     //               style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),
//     //             )),
//     //       ),

//     //       Text(
//     //         "2-nji ädim.",
//     //         style: Theme.of(context).textTheme.titleLarge?.copyWith(height: 2),
//     //       ),
//     //       Padding(
//     //         padding: const EdgeInsets.only(bottom: 30),
//     //         child: Text("Getirmegiň usulyny saýlaň", style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5, wordSpacing: 1.5, letterSpacing: 0.5, color: Colors.grey)),
//     //       ),
//     //       ListTile(
//     //         isThreeLine: true,
//     //         style: ListTileStyle.list,
//     //         selected: true,
//     //         selectedTileColor: primaryColor_2.withOpacity(0.1),
//     //         selectedColor: primaryColor_2.withOpacity(0.4),
//     //         shape: RoundedRectangleBorder(borderRadius: circular10, side: BorderSide(color: primaryColor_2)),
//     //         contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//     //         leading: SvgPicture.asset("assets/images/truck.svg", height: 50, semanticsLabel: 'truck'),
//     //         title: Text("Maşyn bilen getirmek", style: Theme.of(context).textTheme.titleMedium?.copyWith(height: 2)),
//     //         subtitle: RichText(
//     //             text: TextSpan(
//     //                 text: "\nMaşyn bilen getirmek \nEltip berme wagty 20-dan 25 güne çenli \nBahasy", style: Theme.of(context).textTheme.bodySmall, children: [TextSpan(text: "\nHer 1kg üçin 35 tmt", style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 2, color: primaryColor_1))])),
//     //         //  trailing: Radio(value: true, groupValue: "", onChanged: (val) {}),
//     //       ),

//     //       Padding(
//     //         padding: const EdgeInsets.only(top: 15, bottom: 50),
//     //         child: ListTile(
//     //           isThreeLine: true,
//     //           style: ListTileStyle.list,
//     //           selected: false,
//     //           selectedTileColor: primaryColor_2.withOpacity(0.1),
//     //           selectedColor: primaryColor_2.withOpacity(0.4),
//     //           shape: RoundedRectangleBorder(borderRadius: circular10, side: BorderSide(color: Colors.grey.shade300)),
//     //           contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//     //           leading: SvgPicture.asset("assets/images/plane.svg", height: 50, semanticsLabel: 'plane'),
//     //           title: Text("Uçar bilen getirmek", style: Theme.of(context).textTheme.titleMedium?.copyWith(height: 2)),
//     //           subtitle: RichText(
//     //               text: TextSpan(
//     //                   text: "\nUçar bilen getirmek \nEltip berme wagty 10-dan 14 güne çenli \nBahasy", style: Theme.of(context).textTheme.bodySmall, children: [TextSpan(text: "\nHer 1kg üçin 80 tmt", style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 2, color: primaryColor_1))])),
//     //         ),
//     //       ),

//     //       Text(
//     //         "3-nji ädim.",
//     //         style: Theme.of(context).textTheme.titleLarge?.copyWith(height: 2),
//     //       ),
//     //       Padding(
//     //         padding: const EdgeInsets.only(bottom: 30),
//     //         child: Text("Töleg usulyny saýlaň", style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5, wordSpacing: 1.5, letterSpacing: 0.5, color: Colors.grey)),
//     //       ),
//     //       ListTile(
//     //         style: ListTileStyle.list,
//     //         selected: true,
//     //         selectedTileColor: primaryColor_2.withOpacity(0.1),
//     //         selectedColor: primaryColor_2.withOpacity(0.4),
//     //         shape: RoundedRectangleBorder(borderRadius: circular10, side: BorderSide(color: primaryColor_2)),
//     //         contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//     //         leading: Image.asset("assets/images/pay.png", height: 50),
//     //         title: Text("100% öňünden töleg", style: Theme.of(context).textTheme.titleMedium?.copyWith()),
//     //         isThreeLine: true,
//     //         subtitle: Text("\n1 TL = 1.40 TMT", style: Theme.of(context).textTheme.bodySmall),
//     //       ),
//     //       SizedBox(height: 15),
//     //       ListTile(
//     //         style: ListTileStyle.list,
//     //         selected: false,
//     //         selectedTileColor: primaryColor_2.withOpacity(0.1),
//     //         selectedColor: primaryColor_2.withOpacity(0.4),
//     //         shape: RoundedRectangleBorder(borderRadius: circular10, side: BorderSide(color: Colors.grey.shade300)),
//     //         contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//     //         leading: Image.asset("assets/images/pay.png", height: 50),
//     //         title: Text("20% öňünden töleg", style: Theme.of(context).textTheme.titleMedium?.copyWith()),
//     //         isThreeLine: true,
//     //         subtitle: Text("\n1 TL = 1.50 TMT", style: Theme.of(context).textTheme.bodySmall),
//     //       ),
//     //       SizedBox(height: 15),
//     //       ListTile(
//     //         style: ListTileStyle.list,
//     //         selected: false,
//     //         selectedTileColor: primaryColor_2.withOpacity(0.1),
//     //         selectedColor: primaryColor_2.withOpacity(0.4),
//     //         shape: RoundedRectangleBorder(borderRadius: circular10, side: BorderSide(color: Colors.grey.shade300)),
//     //         contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//     //         leading: Image.asset("assets/images/pay.png", height: 50),
//     //         title: Text("Öňünden tölegsiz", style: Theme.of(context).textTheme.titleMedium?.copyWith()),
//     //         isThreeLine: true,
//     //         subtitle: Text("\n1 TL = 1.70 TMT", style: Theme.of(context).textTheme.bodySmall),
//     //       ),
//     //       SizedBox(height: 50),
//     //       TextFormField(
//     //         keyboardType: TextInputType.name,
//     //         cursorColor: primaryColor_2,
//     //         onChanged: (text) {
//     //           // Get.find<OrderAddController>().orderList[indexOfItem]["size"] = text;
//     //         },
//     //         style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
//     //         decoration: InputDecoration(
//     //             contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
//     //             errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             hintText: "Adyňyz",
//     //             hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
//     //       ),
//     //       SizedBox(height: 10),
//     //       TextFormField(
//     //         keyboardType: TextInputType.name,
//     //         cursorColor: primaryColor_2,
//     //         onChanged: (text) {
//     //           // Get.find<OrderAddController>().orderList[indexOfItem]["size"] = text;
//     //         },
//     //         style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
//     //         decoration: InputDecoration(
//     //             contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
//     //             errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             hintText: "Familiýaňyz",
//     //             hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
//     //       ),
//     //       SizedBox(height: 10),
//     //       TextFormField(
//     //         keyboardType: TextInputType.phone,
//     //         cursorColor: primaryColor_2,
//     //         onChanged: (text) {
//     //           // Get.find<OrderAddController>().orderList[indexOfItem]["size"] = text;
//     //         },
//     //         style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
//     //         decoration: InputDecoration(
//     //             contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
//     //             errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             hintText: "Telefon belgiňiz",
//     //             prefixText: "+993 ",
//     //             hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
//     //       ),
//     //       SizedBox(height: 10),
//     //       TextFormField(
//     //         keyboardType: TextInputType.streetAddress,
//     //         cursorColor: primaryColor_2,
//     //         onChanged: (text) {
//     //           // Get.find<OrderAddController>().orderList[indexOfItem]["size"] = text;
//     //         },
//     //         style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
//     //         decoration: InputDecoration(
//     //             contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
//     //             errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             hintText: "Eltip berme adresi",
//     //             hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
//     //       ),
//     //       SizedBox(height: 10),
//     //       TextFormField(
//     //         keyboardType: TextInputType.text,
//     //         cursorColor: primaryColor_2,
//     //         onChanged: (text) {
//     //           // Get.find<OrderAddController>().orderList[indexOfItem]["size"] = text;
//     //         },
//     //         maxLines: 5,
//     //         minLines: 5,
//     //         style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
//     //         decoration: InputDecoration(
//     //             contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
//     //             errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200), borderRadius: circular5),
//     //             hintText: "Bellik",
//     //             hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
//     //       ),
//     //       SizedBox(height: 40),
//     //       ListTile(
//     //         isThreeLine: true,
//     //         horizontalTitleGap: 5,
//     //         leading: Image.asset("assets/images/check.png"),
//     //         title: Text("Alyjynyň goragy", style: Theme.of(context).textTheme.labelLarge),
//     //         subtitle: Text("Harydyňy almasaňyz pulyňyzy doly yzyna gaýtarýarys", style: Theme.of(context).textTheme.labelSmall),
//     //       ),
//     //       // Get.find<AuthManager>().isLogged.value
//     //       //     ? const SizedBox.shrink()
//     //       //     : Padding(
//     //       //         padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
//     //       //         child: _addPhoneNumField,
//     //       //       ),

//     //       // Padding(
//     //       //   padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
//     //       //   child: _addressDialog(Get.find<localeController>().getlocale.languageCode), // _addressInputField(),
//     //       // ),
//     //       // Padding(
//     //       //   padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
//     //       //   child: _descriptionField,
//     //       // ),

//     //       Padding(
//     //         padding: const EdgeInsets.fromLTRB(60, 10, 60, 0),
//     //         child: _orderingButton,
//     //       ),
//     //     ],
//     //   ),
//     // ); //const OrderPage(),
//   }

//   Widget _addressDialog(String locale) {
//     List<String> _rayonlar = [];
//     for (var element in rayonlar) {
//       _rayonlar.add(element[locale] ?? "");
//     }
//     var textFieldProps = TextFieldProps(
//       cursorColor: primaryColor_2,
//       decoration: InputDecoration(
//           contentPadding: EdgeInsets.zero,
//           prefixIcon: const Icon(
//             IconlyLight.search,
//             color: Colors.grey,
//           ),
//           focusColor: primaryColor_2,
//           hintText: "search_field_label".tr,
//           enabledBorder: OutlineInputBorder(borderRadius: circular8, borderSide: BorderSide(color: Colors.grey.shade300)),
//           disabledBorder: OutlineInputBorder(borderRadius: circular8, borderSide: BorderSide(color: Colors.grey.shade300)),
//           focusedBorder: OutlineInputBorder(borderRadius: circular8, borderSide: const BorderSide(color: primaryColor_2)),
//           border: OutlineInputBorder(borderRadius: circular8, borderSide: BorderSide(color: Colors.grey.shade300))),
//     );
//     var container = Container(
//       height: 50,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//       ),
//       child: Center(
//         child: Text(
//           "search_sheet_title".tr,
//           style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w400,
//             color: primaryColor_2,
//           ),
//         ),
//       ),
//     );
//     var inputDecoration = InputDecoration(
//         contentPadding: EdgeInsets.zero,
//         prefixIcon: const Icon(
//           IconlyLight.location,
//           color: primaryColor_2,
//         ),
//         hintText: "delivery_address".tr,
//         hintStyle: const TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
//         enabledBorder: OutlineInputBorder(borderRadius: circular8, borderSide: BorderSide(color: Colors.grey.shade300)),
//         disabledBorder: OutlineInputBorder(borderRadius: circular8, borderSide: BorderSide(color: Colors.grey.shade300)),
//         focusedBorder: OutlineInputBorder(borderRadius: circular8, borderSide: BorderSide(color: primaryColor_2)),
//         border: OutlineInputBorder(borderRadius: circular8, borderSide: BorderSide(color: Colors.grey.shade300)));
//     return DropdownSearch<String>(
//       mode: Mode.BOTTOM_SHEET,
//       items: _rayonlar,
//       key: _multiKey,
//       popupBackgroundColor: Colors.white,
//       dropdownSearchBaseStyle: const TextStyle(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 14),
//       dropdownSearchDecoration: inputDecoration,
//       onChanged: (text) {
//         setState(() {
//           _selectedItem = text ?? '';
//         });
//       },
//       selectedItem: _selectedItem,
//       showSearchBox: true,
//       emptyBuilder: (context, text) => const SizedBox(),
//       searchFieldProps: textFieldProps,
//       popupTitle: container,
//       popupShape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//       ),
//     );
//   }

//   TextFormField get _descriptionField => TextFormField(
//         controller: _descriptionController,
//         keyboardType: TextInputType.multiline,
//         textInputAction: TextInputAction.newline,
//         cursorColor: primaryColor_2,
//         minLines: 3,
//         maxLines: 5,
//         style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
//         decoration: InputDecoration(
//             hintText: "note".tr,
//             hintStyle: const TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
//             enabledBorder: OutlineInputBorder(borderRadius: circular8, borderSide: BorderSide(color: Colors.grey.shade300)),
//             disabledBorder: OutlineInputBorder(borderRadius: circular8, borderSide: BorderSide(color: Colors.grey.shade300)),
//             focusedBorder: OutlineInputBorder(borderRadius: circular8, borderSide: BorderSide(color: primaryColor_2)),
//             border: OutlineInputBorder(borderRadius: circular8, borderSide: BorderSide(color: Colors.grey.shade300))),
//       );

// ////Buttons and Fields
//   // DottedBorder get addNewItemButton => DottedBorder(
//   //       borderType: BorderType.RRect,
//   //       color: Colors.grey.shade400,
//   //       radius: const Radius.circular(8),
//   //       padding: EdgeInsets.zero,
//   //       dashPattern: const [8, 4],
//   //       strokeWidth: 1.5,
//   //       strokeCap: StrokeCap.square,
//   //       child: OutlinedButton(
//   //         style: OutlinedButton.styleFrom(padding: EdgeInsets.zero, side: BorderSide.none, primary: primaryColor_2),
//   //         onPressed: getImage,
//   //         child: Container(
//   //           height: 120,
//   //           width: double.infinity,
//   //           alignment: Alignment.center,
//   //           child: Column(
//   //             mainAxisAlignment: MainAxisAlignment.center,
//   //             crossAxisAlignment: CrossAxisAlignment.center,
//   //             children: [
//   //               Icon(
//   //                 CupertinoIcons.plus,
//   //                 size: 50,
//   //                 color: Colors.grey.shade400,
//   //               ),
//   //               const SizedBox(
//   //                 height: 5,
//   //               ),
//   //               Text("p_add_btn".tr, style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 16, fontWeight: FontWeight.w400))
//   //             ],
//   //           ),
//   //           padding: EdgeInsets.zero,
//   //           decoration: BoxDecoration(color: Colors.grey.withOpacity(0.03), borderRadius: const BorderRadius.all(Radius.circular(8.0))),
//   //         ),
//   //       ),
//   //     );

//   TextFormField get _addPhoneNumField => TextFormField(
//         controller: _phoneController,
//         keyboardType: TextInputType.number,
//         inputFormatters: [
//           MaskedInputFormatter('## ######'),
//           LengthLimitingTextInputFormatter(9),
//         ],
//         autovalidateMode: AutovalidateMode.disabled,
//         cursorColor: primaryColor_2,
//         style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
//         decoration: InputDecoration(
//             contentPadding: EdgeInsets.zero,
//             prefixIcon: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: const [
//                 SizedBox(
//                   width: 15,
//                 ),
//                 Icon(IconlyLight.call, color: primaryColor_2),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(5, 0, 5, 2),
//                   child: Text(
//                     "+993",
//                     style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
//                   ),
//                 )
//               ],
//             ),
//             hintText: "xx xx xx xx",
//             hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
//             enabledBorder: OutlineInputBorder(borderRadius: circular8, borderSide: BorderSide(color: Colors.grey.shade300)),
//             disabledBorder: OutlineInputBorder(borderRadius: circular8, borderSide: BorderSide(color: Colors.grey.shade300)),
//             focusedBorder: OutlineInputBorder(borderRadius: circular8, borderSide: BorderSide(color: primaryColor_2)),
//             border: OutlineInputBorder(borderRadius: circular8, borderSide: BorderSide(color: Colors.grey.shade300))),
//       );

//   RaisedButton get _orderingButton => RaisedButton(
//         padding: const EdgeInsets.symmetric(vertical: 15),
//         child: Text(
//           "order_btn_txt".tr,
//           style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//         ),
//         onPressed: _orderFunction,
//         shape: RoundedRectangleBorder(side: const BorderSide(color: primaryColor_2), borderRadius: circular5),
//         color: primaryColor_2,
//       );

//   SlideTransition buildItem(BuildContext context, int indexOfItem, NewOrderItemModel orderItem, _animation) {
//     return SlideTransition(
//       position: _animation.drive(Tween(begin: const Offset(0, 0.0), end: const Offset(0.0, 0.0)).chain(CurveTween(curve: Curves.decelerate))),
//       child: Container(
//         height: 280,
//         width: MediaQuery.of(context).size.width,
//         margin: const EdgeInsets.symmetric(vertical: 10),
//         padding: const EdgeInsets.symmetric(horizontal: 5),
//         decoration: BoxDecoration(boxShadow: [
//           BoxShadow(
//             offset: const Offset(-1, 1),
//             color: Colors.grey.shade300,
//             blurRadius: 5,
//           ),
//         ], color: Colors.white, borderRadius: circular10),
//         child: ListView(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           children: [
//             SizedBox(
//               height: 40,
//               width: MediaQuery.of(context).size.width,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     " #${indexOfItem + 1}",
//                     style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black54),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       removeItem(indexOfItem);
//                     },
//                     padding: EdgeInsets.zero,
//                     visualDensity: VisualDensity.adaptivePlatformDensity,
//                     icon: const Icon(IconlyLight.closeSquare, size: 30, color: Colors.red),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 220,
//               width: MediaQuery.of(context).size.width,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                       flex: 3,
//                       child: InkWell(
//                         onTap: () {
//                           Get.to(ImagePreview(
//                             image: orderItem.image,
//                             title: "p_count".tr + " #${indexOfItem + 1}",
//                           ));
//                         },
//                         child: Container(
//                           margin: const EdgeInsets.only(left: 5),
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: orderItem.image != null
//                               ? ClipRRect(borderRadius: circular5, child: FadeInImage(height: 220, width: 130, fit: BoxFit.contain, placeholderFit: BoxFit.contain, placeholder: const AssetImage("assets/images/sarweal_backgraund.png"), image: FileImage(File(orderItem.image?.path ?? ""))))
//                               : ClipRRect(
//                                   borderRadius: circular5, child: FadeInImage(height: 220, width: 130, fit: BoxFit.contain, placeholderFit: BoxFit.contain, placeholder: const AssetImage("assets/images/sarweal_backgraund.png"), image: const AssetImage("assets/images/sarweal_backgraund.png"))),
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade100,
//                             borderRadius: circular5,
//                           ),
//                         ),
//                       )),
//                   Expanded(
//                       flex: 5,
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: 5, left: 10),
//                         child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//                           TextFormField(
//                             initialValue: orderItem.link,
//                             keyboardType: TextInputType.url,
//                             cursorColor: primaryColor_2,
//                             onChanged: (text) {
//                               //  Get.find<OrderAddController>().orderList[indexOfItem]["link"] = text;
//                             },
//                             style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
//                             decoration: InputDecoration(
//                                 filled: true, contentPadding: const EdgeInsets.symmetric(horizontal: 10.0), border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: circular5), hintText: "p_url".tr, hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
//                           ),
//                           const Spacer(flex: 1),
//                           TextFormField(
//                             initialValue: orderItem.size,
//                             keyboardType: TextInputType.text,
//                             cursorColor: primaryColor_2,
//                             onChanged: (text) {
//                               // Get.find<OrderAddController>().orderList[indexOfItem]["size"] = text;
//                             },
//                             style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
//                             decoration: InputDecoration(
//                                 filled: true, contentPadding: const EdgeInsets.symmetric(horizontal: 10.0), border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: circular5), hintText: "p_size".tr, hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
//                           ),
//                           const Spacer(flex: 1),
//                           TextFormField(
//                             keyboardType: TextInputType.text,
//                             initialValue: orderItem.color,
//                             cursorColor: primaryColor_2,
//                             style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
//                             onChanged: (text) {
//                               // Get.find<OrderAddController>().orderList[indexOfItem]["color"] = text;
//                             },
//                             decoration: InputDecoration(
//                                 filled: true, contentPadding: const EdgeInsets.symmetric(horizontal: 10.0), border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: circular5), hintText: "p_color".tr, hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
//                           ),
//                           const Spacer(flex: 2),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               IconButton(
//                                 onPressed: () {
//                                   removeItem(indexOfItem);
//                                 },
//                                 padding: EdgeInsets.zero,
//                                 visualDensity: VisualDensity.adaptivePlatformDensity,
//                                 icon: const Icon(
//                                   Icons.remove,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Container(
//                                   height: 40,
//                                   alignment: Alignment.center,
//                                   color: Colors.grey.shade100,
//                                   child: Text(
//                                     "1",
//                                     style: Theme.of(context).textTheme.bodyMedium,
//                                   ),
//                                 ),
//                               ),
//                               IconButton(
//                                 onPressed: () {
//                                   removeItem(indexOfItem);
//                                 },
//                                 padding: EdgeInsets.zero,
//                                 visualDensity: VisualDensity.adaptivePlatformDensity,
//                                 icon: const Icon(
//                                   Icons.add,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ]),
//                       )),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showSuccesDialog() {
//     showCupertinoDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//               title: Lottie.asset('assets/lottie/success.json', height: 90, width: 90, repeat: true),
//               content: ListView(
//                 shrinkWrap: true,
//                 children: [
//                   Text(
//                     "dialog_header".tr,
//                     textAlign: TextAlign.center,
//                     overflow: TextOverflow.clip,
//                     style: const TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     "dialog_body".tr,
//                     textAlign: TextAlign.center,
//                     overflow: TextOverflow.clip,
//                     style: const TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
//                   ),
//                 ],
//               ),
//               actions: [
//                 TextButton(
//                   style: TextButton.styleFrom(elevation: 0.0, primary: primaryColor_2, shape: RoundedRectangleBorder(borderRadius: circular5)),
//                   child: const Text(
//                     "OK",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 16, color: primaryColor_2, fontWeight: FontWeight.w600),
//                   ),
//                   onPressed: () {
//                     for (int i = Get.find<OrderAddController>().orderList.length - 1; i >= 0; i--) {
//                       removeItem(i);
//                     }
//                     Navigator.of(context).pop(true);
//                   },
//                 ),
//               ],
//             ));
//   }

//   void _showLoadingDialog() {
//     showCupertinoDialog(
//         context: context,
//         builder: (context) => WillPopScope(
//               onWillPop: () {
//                 return Future.value(false);
//               },
//               child: AlertDialog(
//                   insetPadding: EdgeInsets.zero,
//                   content: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Lottie.asset('assets/lottie/loader_app.json', height: 60, width: 60, repeat: true),
//                       Expanded(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "loader_dialog_title".tr,
//                               textAlign: TextAlign.start,
//                               overflow: TextOverflow.clip,
//                               style: const TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),
//                             ),
//                             const SizedBox(height: 10),
//                             Text(
//                               "loader_dialog_body".tr,
//                               textAlign: TextAlign.start,
//                               overflow: TextOverflow.clip,
//                               style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w400),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   )),
//             ));
//   }

//   Padding get otpInputField => Padding(
//       padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
//       child: PinCodeTextField(
//         appContext: context,
//         autoFocus: true,
//         pastedTextStyle: TextStyle(
//           color: Colors.green.shade600,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//         length: 6,
//         obscureText: false,
//         obscuringCharacter: '*',
//         blinkWhenObscuring: true,
//         animationType: AnimationType.fade,
//         textStyle: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
//         validator: (text) {
//           if (text!.length < 6) {
//             return "";
//           } else {
//             return null;
//           }
//         },
//         pinTheme: PinTheme(
//           errorBorderColor: Colors.red,
//           selectedFillColor: Colors.white,
//           activeColor: primaryColor_2,
//           selectedColor: primaryColor_2,
//           inactiveFillColor: Colors.white,
//           disabledColor: Colors.white,
//           inactiveColor: Colors.grey,
//           shape: PinCodeFieldShape.underline,
//           fieldOuterPadding: const EdgeInsets.fromLTRB(1.0, 0, 1.0, 0),
//           //borderRadius: BorderRadius.circular(5),
//           fieldHeight: 50,
//           fieldWidth: 45,
//           activeFillColor: Colors.white,
//         ),
//         cursorColor: Colors.black,
//         animationDuration: const Duration(milliseconds: 300),
//         enableActiveFill: false,
//         controller: _passwordController,
//         autoDisposeControllers: false,
//         keyboardType: TextInputType.number,
//         onChanged: (value) {},
//         beforeTextPaste: (text) {
//           return true;
//         },
//       ));

//   void _otpDialog() {
//     showCupertinoDialog(
//         context: context,
//         builder: (context) => Dialog(
//               backgroundColor: Colors.transparent,
//               insetPadding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Container(
//                 height: 300,
//                 width: MediaQuery.of(context).size.width,
//                 color: Colors.transparent,
//                 child: Stack(
//                   alignment: AlignmentDirectional.topCenter,
//                   children: [
//                     Positioned(
//                       top: 50,
//                       child: Container(
//                         height: 250,
//                         width: MediaQuery.of(context).size.width - 20,
//                         decoration: BoxDecoration(color: Colors.white, borderRadius: circular10),
//                         padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             SizedBox(
//                               height: 50,
//                               width: MediaQuery.of(context).size.width,
//                             ),
//                             Text(
//                               "otp_title".tr,
//                               style: const TextStyle(
//                                 color: primaryColor_2,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             otpInputField,
//                             Text(
//                               "otp_field_help".tr,
//                               style: const TextStyle(color: Colors.grey, fontSize: 10),
//                             ),
//                             SizedBox(
//                               height: 25,
//                               width: MediaQuery.of(context).size.width,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 OutlinedButton(
//                                   style: OutlinedButton.styleFrom(primary: primaryColor_2, shape: RoundedRectangleBorder(borderRadius: circular5, side: BorderSide(color: primaryColor_2))),
//                                   child: Text(
//                                     "sms_code_resend".tr,
//                                     style: const TextStyle(
//                                       fontSize: 12,
//                                       color: primaryColor_2,
//                                     ),
//                                   ),
//                                   onPressed: () {
//                                     FirebaseMessaging.instance.getToken().then((value) {
//                                       if (value != null) {
//                                         AuthService.login(_phoneController.text.split(" ").join("")).then((value) {});
//                                       }
//                                     });
//                                   },
//                                 ),
//                                 const SizedBox(width: 5),
//                                 RaisedButton(
//                                     elevation: 0.0,
//                                     focusElevation: 0,
//                                     hoverElevation: 0,
//                                     disabledElevation: 0,
//                                     highlightElevation: 0,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: circular5,
//                                     ),
//                                     onPressed: () {
//                                       verifySmsCode(_passwordController.text);
//                                     },
//                                     color: primaryColor_2,
//                                     child: Text(
//                                       "otp_verify".tr,
//                                       style: const TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.white,
//                                       ),
//                                     ))
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       child: ClipRRect(
//                         borderRadius: const BorderRadius.all(Radius.circular(50)),
//                         child: Image.asset(
//                           "assets/images/sms.gif",
//                           height: 100,
//                           width: 100,
//                           bundle: rootBundle,
//                           color: primaryColor_2,
//                           colorBlendMode: BlendMode.color,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ));
//   }

//   ///upload
//   Future<void> uploadOrder() async {
//     try {
//       final String token = _storage?.getDataInDisk(StorageKey.accesstoken.toString());
//       final String uuid = const Uuid().v4();

//       ///request
//       final request = http.MultipartRequest("POST", ApiService.orderUploadUrl(uuid));
//       request.headers.addAll(ApiService.authorizationHeader(token));
//       request.fields["customerAddress"] = _multiKey.currentState?.getSelectedItem ?? "";
//       request.fields["note"] = _descriptionController.text.trim();

//       ///
//       Get.find<OrderAddController>().orderList.forEach((file) {
//         final String fileName = file["image"].path.split("/").last;
//         final stream = http.ByteStream(DelegatingStream.typed(file["image"].openRead()));
//         final length = file["image"].length();
//         final mimeType = lookupMimeType(file["image"].path, headerBytes: [0xFF, 0xD8])!.split('/');
//         final fileContent = http.MultipartFile('picture', stream, length, filename: fileName, contentType: MediaType(mimeType[0], mimeType[1]));

//         //   final fileBytes = file.readAsBytesSync();
//         // final fileContent = http.MultipartFile.fromBytes(
//         //   "file",
//         //   fileBytes,
//         //   filename: fileNameWithExtension,
//         //   contentType: MediaType(mimeType),
//         // );
//         request.files.add(fileContent);
//       });
//     } catch (err) {
//       throw Exception(err);
//     }
//   }

//   /////Functions
//   void orderingForIndex(int index) async {
//     if (index < Get.find<OrderAddController>().orderList.length) {
//       Get.find<OrderAddController>().orderList[index]["process"] = "started";
//       try {
//         ///Required parametres
//         final String token = _storage?.getDataInDisk(StorageKey.accesstoken.toString());
//         final String uuid = const Uuid().v4();

//         ///request
//         final request = http.MultipartRequest("POST", ApiService.orderUploadUrl(uuid));
//         final String fileName = Get.find<OrderAddController>().orderList[index]["image"].path.split("/").last;
//         final stream = http.ByteStream(DelegatingStream.typed(Get.find<OrderAddController>().orderList[index]["image"].openRead()));
//         final length = await Get.find<OrderAddController>().orderList[index]["image"].length();
//         final mimeTypeData = lookupMimeType(Get.find<OrderAddController>().orderList[index]["image"].path, headerBytes: [0xFF, 0xD8])!.split('/');
//         final multipartFileSign = http.MultipartFile('picture', stream, length, filename: fileName, contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));

//         ////Add fields
//         request.headers.addAll(ApiService.authorizationHeader(token));

//         request.files.add(multipartFileSign);

//         request.fields["size"] = Get.find<OrderAddController>().orderList[index]["size"];
//         request.fields["color"] = Get.find<OrderAddController>().orderList[index]["color"];
//         request.fields["link"] = Get.find<OrderAddController>().orderList[index]["link"];
//         request.fields["customerAddress"] = _multiKey.currentState?.getSelectedItem ?? "";
//         request.fields["note"] = _descriptionController.text.trim();
//         request.fields["quantity"] = Get.find<OrderAddController>().orderList[index]["quantity"].toString();
//         final response = await request.send();

//         if (response.statusCode == 200) {
//           Get.find<OrderAddController>().orderList[index]["process"] = "completed";
//           return orderingForIndex(index + 1);
//         } else if (response.statusCode == 401) {
//           final refreshtoken = _storage?.getDataInDisk(StorageKey.refreshtoken.toString());

//           var res = await http.get(ApiService.refreshtokenUrl, headers: ApiService.authorizationHeader(refreshtoken));
//           if (res.statusCode == 200) {
//             final accesstoken = jsonDecode(res.body)["token"];
//             _storage?.saveDataToDisk(key: StorageKey.accesstoken.toString(), value: accesstoken);
//             return orderingForIndex(index);
//           }
//         } else {
//           Get.find<OrderAddController>().orderList[index]["process"] = "failed";
//           return orderingForIndex(index + 1);
//         }
//       } on SocketException catch (_) {
//         int counter = 0;
//         counter++;
//         if (counter == 1) {
//           _showToast(
//               "no_connection".tr,
//               const Icon(
//                 Icons.wifi_off,
//                 color: Colors.blue,
//                 size: 30,
//               ),
//               70.0);
//           Navigator.pop(context);
//         }
//         Get.find<OrderAddController>().orderList[index]["process"] = "failed";
//         return orderingForIndex(index + 1);
//       } on TimeoutException catch (_) {
//         Get.find<OrderAddController>().orderList[index]["process"] = "failed";
//         return orderingForIndex(index + 1);
//       } on http.ClientException catch (_) {
//         Get.find<OrderAddController>().orderList[index]["process"] = "failed";
//         return orderingForIndex(index + 1);
//       }
//     } else {
//       for (int i = 0; i < Get.find<OrderAddController>().orderList.length; i++) {
//         if (Get.find<OrderAddController>().orderList[i]["process"] == "completed") {
//           Navigator.of(context).pop();
//           Future.delayed(const Duration(milliseconds: 600), () {
//             _showSuccesDialog();
//           });
//           return;
//         }
//       }
//       for (int i = Get.find<OrderAddController>().orderList.length - 1; i >= 0; i--) {
//         removeItem(i);
//       }

//       Navigator.of(context).pop(true);
//     }
//   }

//   void addItem(XFile image) {
//     final int index = Get.find<OrderAddController>().orderList.length;
//     Map<String, dynamic> orderItem = {"size": "", "color": "", "quantity": 1, "image": image, "link": "", "process": "ready"};
//     Get.find<OrderAddController>().addOrderItem(index: index, item: orderItem);

//     setState(() {
//       _listKey.currentState?.insertItem(index, duration: const Duration(milliseconds: 300));
//     });
//   }

//   void removeItem(int index) {
//     // Map<String, dynamic> removedItem = Get.find<OrderAddController>().removeOrderItem(index: index);
//     NewOrderItemModel? removedItem = _orderModel?.orderItems?.removeAt(index);

//     AnimatedListRemovedItemBuilder builder = (context, animation) {
//       return buildItem(context, index, removedItem ?? NewOrderItemModel(), animation);
//     };
//     setState(() {
//       _listKey.currentState?.removeItem(index, (context, animation) => builder(context, animation));
//     });
//   }

//   void noAuthOrder() {
//     FirebaseMessaging.instance.getToken().then((value) {
//       if (value != null) {
//         AuthService.login(_phoneController.text.split(" ").join("")).then((value) {
//           if (value == 200) {
//             _otpDialog();
//           } else {
//             _showToast(
//                 "no_connection".tr,
//                 const Icon(
//                   Icons.wifi_off,
//                   color: Colors.blue,
//                   size: 30,
//                 ),
//                 70.0);
//           }
//         });
//       }
//     });
//   }

//   void verifySmsCode(String password) {
//     FirebaseMessaging.instance.getToken().then((value) {
//       if (value != null) {
//         //   Get.find<AuthController>().authenicationWithOtpCode(_phoneController.text.split(" ").join(""), password).then((value) {
//         //     if (value == 200) {
//         //       Navigator.of(context).pop();
//         //       _showLoadingDialog();
//         //       orderingForIndex(0);
//         //     } else if (value == 404) {
//         //       _showToast(
//         //           "otp_accept_val_txt".tr,
//         //           const Icon(
//         //             Icons.error,
//         //             color: Colors.red,
//         //             size: 30,
//         //           ),
//         //           70.0);
//         //     } else {
//         //       _showToast(
//         //           "otp_accept_val_txt".tr,
//         //           const Icon(
//         //             Icons.error,
//         //             color: Colors.red,
//         //             size: 30,
//         //           ),
//         //           70.0);
//         //     }
//         //   });
//         // }
//       }
//     });
//   }

//   Future<void> _orderFunction() async {
//     try {
//       final result = await InternetAddress.lookup('admin.sarweal.com');
//       String _selectedItem = _multiKey.currentState?.getSelectedItem ?? "";
//       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//         if (Get.find<AuthManager>().isLogged.value) {
//           if (_selectedItem.isEmpty) {
//             _showToast(
//                 "address_val_txt".tr,
//                 Icon(
//                   Icons.edit_location_alt,
//                   color: Colors.blue[900],
//                   size: 30,
//                 ),
//                 50.0);
//           } else {
//             _showLoadingDialog();
//             orderingForIndex(0);
//           }
//         } else {
//           if (_phoneController.text.isEmpty) {
//             _showToast(
//                 'phone_empty_val_txt'.tr,
//                 Icon(
//                   Icons.edit,
//                   color: Colors.blue[900],
//                   size: 30,
//                 ),
//                 50.0);
//           } else if (!phoneValidatorRegExp.hasMatch(_phoneController.text)) {
//             _showToast(
//                 'phone_val_txt'.tr,
//                 const Icon(
//                   Icons.error,
//                   color: Colors.red,
//                   size: 30,
//                 ),
//                 50.0);
//           } else if (_selectedItem.isEmpty) {
//             _showToast(
//                 "address_val_txt".tr,
//                 Icon(
//                   Icons.edit_location_alt,
//                   color: Colors.blue[900],
//                   size: 30,
//                 ),
//                 50.0);
//           } else {
//             noAuthOrder();
//           }
//         }
//       }
//     } on SocketException catch (_) {
//       _showToast(
//           "no_connection".tr,
//           const Icon(
//             Icons.wifi_off,
//             color: Colors.blue,
//             size: 30,
//           ),
//           70.0);
//     }
//   }

//   _showToast(String text, Icon icon, double size) {
//     Widget toast = Container(
//       width: MediaQuery.of(context).size.width,
//       height: size,

//       //  margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
//       decoration: BoxDecoration(
//         borderRadius: circular10,
//         color: primaryColor_2.withOpacity(0.7),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           const SizedBox(
//             width: 10,
//           ),
//           icon,
//           VerticalDivider(
//             thickness: 2,
//             width: 20,
//             color: Colors.white.withOpacity(0.5),
//             indent: 10,
//             endIndent: 10,
//           ),
//           Expanded(
//             child: Text(
//               text,
//               style: const TextStyle(color: Colors.white),
//               //  style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );

//     _fToast.showToast(
//       child: toast,
//       gravity: ToastGravity.TOP,
//       toastDuration: const Duration(seconds: 3),
//     );
//   }

//   void getImage() async {
//     await _picker.pickMultiImage().then((value) {
//       if (value != null) {
//         for (var file in value) {
//           addItem(file);
//         }
//       }
//     });
//   }
// }
