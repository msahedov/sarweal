import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:sarweal/constants/constants.dart';

// class OrderTrackingPage extends StatefulWidget {
//   final OrderModel? orderModel;
//   static const String routeName = '/trackorder';
//   const OrderTrackingPage({Key? key, this.orderModel}) : super(key: key);

//   @override
//   _OrderTrackingPageState createState() => _OrderTrackingPageState();
// }

// class _OrderTrackingPageState extends State<OrderTrackingPage> {
//   @override
//   Widget build(BuildContext context) {
//     Size _size = MediaQuery.of(context).size;
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: CustomScrollView(slivers: [
//           _sliverAppBar,
//           FutureBuilder<dynamic>(
//               future: OrderService.getOrderItemsById(widget.orderModel?.id ?? "").then((value) {
//                 return value;
//               }),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   if (snapshot.data == OrderItemStatus.connection.toString()) {
//                     return _emptyWidget;
//                   } else if (snapshot.data == OrderItemStatus.connection.toString()) {
//                     return _emptyWidget;
//                   } else {
//                     return SliverAnimatedList(
//                         initialItemCount: snapshot.data?.length,
//                         itemBuilder: (context, index, animation) {
//                           return SlideTransition(
//                             position: animation.drive(Tween(begin: const Offset(2, 0.0), end: const Offset(0.0, 0.0)).chain(CurveTween(curve: Curves.elasticInOut))),
//                             child: _itemCard(context, snapshot, index, _size),
//                           );
//                         });
//                   }
//                 } else if (snapshot.hasError) {
//                   return _emptyWidget;
//                 } else {
//                   return SliverList(
//                     delegate: SliverChildListDelegate([
//                       _itemCardShimmer,
//                       _itemCardShimmer,
//                     ]),
//                   );
//                 }
//               }),
//           _itemList,
//           _callToOperator
//         ]));
//   }

//   SliverList get _itemList => SliverList(
//           delegate: SliverChildListDelegate([
//         widget.orderModel?.customerAddress == null
//             ? const SizedBox.shrink()
//             : ListTile(
//                 horizontalTitleGap: 0,
//                 minVerticalPadding: 0,
//                 leading: const Icon(IconlyLight.location, color: primaryColor_2),
//                 title: Text(widget.orderModel?.customerAddress ?? "", style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 16)),
//               ),
//         widget.orderModel?.createdTime == null
//             ? const SizedBox.shrink()
//             : ListTile(
//                 minVerticalPadding: 0,
//                 horizontalTitleGap: 0,
//                 leading: const Icon(IconlyLight.calendar, color: primaryColor_2),
//                 title: Text(widget.orderModel?.createdTime ?? "", style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 16)),
//               ),
//         widget.orderModel?.totalPrice == null
//             ? const SizedBox.shrink()
//             : ListTile(
//                 minVerticalPadding: 0,
//                 horizontalTitleGap: 0,
//                 leading: const ImageIcon(AssetImage("assets/images/price-tag.png"), color: primaryColor_2),
//                 title: Text("${widget.orderModel?.totalPrice} TMT", style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 16)),
//               ),
//         widget.orderModel?.note == null || widget.orderModel?.note == ""
//             ? const SizedBox.shrink()
//             : ListTile(
//                 horizontalTitleGap: 0,
//                 minVerticalPadding: 0,

//                 title: Text("note".tr, style: Theme.of(context).textTheme.headline2?.copyWith(fontWeight: FontWeight.w600, fontSize: 18)),

//                 ///leading: const Icon(Icons.description, color: primaryColor_2),
//                 subtitle: Container(padding: const EdgeInsets.all(5.0), decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: circular5), child: Text(widget.orderModel!.note.toString(), style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 16))),
//               ),
//       ]));

//   SliverToBoxAdapter get _callToOperator => SliverToBoxAdapter(
//         child: Padding(
//             padding: const EdgeInsets.fromLTRB(10, 20, 10, 30),
//             child: RaisedButton(
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                 elevation: 5.0,
//                 shape: RoundedRectangleBorder(borderRadius: circular5),
//                 color: primaryColor_2,
//                 onPressed: _callNumber,
//                 child: Text(
//                   "call_operator".tr,
//                   style: Theme.of(context).textTheme.headline2?.copyWith(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//                 ))),
//       );

//   _callNumber() async {
//     const number = 'tel: +99364173366';
//     await Permission.phone.request().then((status) async {
//       if (status == PermissionStatus.granted) {
//         if (!await launch(number)) throw 'Could not launch $number';
//       } else if (status == PermissionStatus.permanentlyDenied) {
//         print("No permission for phone call.");
//       } else {
//         openAppSettings();
//       }
//     });
//   }

//   Container _itemCard(BuildContext context, AsyncSnapshot<dynamic> snapshot, int index, Size size) {
//     final _decoration = BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             offset: const Offset(-1, 1),
//             color: Colors.grey.shade300,
//             blurRadius: 5,
//           ),
//         ],
//         borderRadius: circular10);
//     const _margin = EdgeInsets.fromLTRB(8, 10, 8, 10);

//     return Container(
//       width: size.width,
//       height: 250,
//       decoration: _decoration,
//       child: ClipRRect(
//         borderRadius: circular10,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               flex: 2,
//               child: InkWell(
//                 onTap: () {
//                   Navigator.of(context).push(PageTransition(ImagePreviewItem(image: snapshot.data?[index].photo)));
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: ClipRRect(
//                     borderRadius: circular5,
//                     child: CachedNetworkImage(
//                       imageUrl: snapshot.data?[index].photo,
//                       progressIndicatorBuilder: (context, url, downloadProgress) => Center(child: SizedBox(height: 25, width: 25, child: CircularProgressIndicator(color: primaryColor_2, value: downloadProgress.progress))),
//                       errorWidget: (context, url, error) => const Center(child: Icon(Icons.no_photography, size: 30, color: Colors.grey)),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             // _image,
//             Expanded(
//                 flex: 3,
//                 child: Container(
//                   color: Colors.white,
//                   child: Column(
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(5, 10, 15, 0),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 SizedBox(
//                                   height: 50,
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text("item_size".tr, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400)),
//                                       Text(
//                                         snapshot.data?[index].size ?? "",
//                                         style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade600),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 const Spacer(),
//                                 SizedBox(
//                                   height: 50,
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text("item_color".tr, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400)),
//                                       Text(
//                                         snapshot.data![index].color ?? "",
//                                         style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade600),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(5, 0, 15, 0),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 SizedBox(
//                                   height: 50,
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text("item_qty".tr, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400)),
//                                       Text(
//                                         snapshot.data?[index].quantity ?? "",
//                                         style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade600),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 const Spacer(),
//                                 SizedBox(
//                                   height: 50,
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text("item_price".tr, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400)),
//                                       Text(
//                                         snapshot.data?[index].price ?? "",
//                                         style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade600),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       snapshot.data?[index].totalPrice == null
//                           ? const SizedBox.shrink()
//                           : Padding(
//                               padding: const EdgeInsets.fromLTRB(5, 10, 15, 10),
//                               child: Row(
//                                 children: [
//                                   const ImageIcon(AssetImage("assets/images/tag.png"), size: 20, color: primaryColor_2),
//                                   const SizedBox(
//                                     width: 5,
//                                   ),
//                                   Expanded(child: Text("${snapshot.data![index].totalPrice} TMT", overflow: TextOverflow.clip, style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 14))),
//                                 ],
//                               ),
//                             ),
//                       snapshot.data?[index].status == null
//                           ? const SizedBox.shrink()
//                           : Padding(
//                               padding: const EdgeInsets.fromLTRB(5, 0, 15, 0),
//                               child: Row(
//                                 children: [
//                                   const ImageIcon(AssetImage("assets/images/process.png"), size: 20, color: primaryColor_2),
//                                   const SizedBox(
//                                     width: 5,
//                                   ),
//                                   Expanded(child: Text("${snapshot.data![index].status}", overflow: TextOverflow.clip, style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 14))),
//                                 ],
//                               ),
//                             ),
//                       // snapshot.data?[index].steps[snapshot.data?[index].stepId - 1].status[0].note == null
//                       //     ? const SizedBox.shrink()
//                       //     : Container(
//                       //         margin: const EdgeInsets.fromLTRB(5, 10, 15, 5),
//                       //         width: double.infinity,
//                       //         height: 50,
//                       //         padding: const EdgeInsets.all(3),
//                       //         decoration: BoxDecoration(borderRadius: circular5, color: Colors.grey.shade100),
//                       //         child: Text(snapshot.data?[index].steps[snapshot.data?[index].stepId - 1].status[0].note ?? "", overflow: TextOverflow.clip, style: const TextStyle(color: Colors.grey)),
//                       //       ),
//                     ],
//                   ),
//                 )),
//           ],
//         ),
//       ),
//       margin: _margin,
//     );
//   }

//   Container get _itemCardShimmer => Container(
//         width: MediaQuery.of(context).size.width,
//         height: 230,
//         decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 offset: const Offset(-1, 1),
//                 color: Colors.grey.shade300,
//                 blurRadius: 5,
//               ),
//             ],
//             borderRadius: circular10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               flex: 2,
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Shimmer.fromColors(
//                   baseColor: Colors.grey.shade200,
//                   highlightColor: Colors.grey.shade100,
//                   child: Container(
//                     width: double.infinity,
//                     height: double.infinity,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             // _image,
//             Expanded(
//               flex: 3,
//               child: ListView(
//                 padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
//                 shrinkWrap: true,
//                 children: [
//                   Shimmer.fromColors(
//                     baseColor: Colors.grey.shade200,
//                     highlightColor: Colors.grey.shade100,
//                     child: Container(
//                       color: Colors.grey,
//                       height: 40,
//                       width: double.infinity,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Shimmer.fromColors(
//                     baseColor: Colors.grey.shade200,
//                     highlightColor: Colors.grey.shade100,
//                     child: Container(
//                       color: Colors.grey,
//                       height: 40,
//                       width: double.infinity,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     child: Shimmer.fromColors(
//                       baseColor: Colors.grey.shade200,
//                       highlightColor: Colors.grey.shade100,
//                       child: Container(
//                         color: Colors.grey,
//                         height: 30,
//                         width: double.infinity,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   SizedBox(
//                     height: 30,
//                     width: 60,
//                     child: Shimmer.fromColors(
//                       baseColor: Colors.grey.shade200,
//                       highlightColor: Colors.grey.shade100,
//                       child: Container(
//                         color: Colors.grey,
//                         height: 30,
//                         width: 60,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//         margin: const EdgeInsets.all(10),
//       );

//   SliverToBoxAdapter get _loaderWidget => SliverToBoxAdapter(
//         child: Container(
//           color: Colors.white,
//           alignment: Alignment.center,
//           child: Lottie.asset('assets/lottie/loader_app.json', height: 90, width: 90, repeat: true),
//         ),
//       );

//   SliverToBoxAdapter get _emptyWidget => SliverToBoxAdapter(
//         child: Container(
//           color: Colors.white,
//           alignment: Alignment.center,
//           child: IconButton(
//             icon: const Icon(
//               Icons.autorenew,
//               color: primaryColor_2,
//               size: 50,
//             ),
//             onPressed: () {
//               setState(() {});
//             },
//           ),
//           height: 200,
//           width: double.infinity,
//         ),
//       );

//   SliverAppBar get _sliverAppBar => SliverAppBar(
//         pinned: true,
//         floating: true,
//         systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
//         actions: [
//           Container(
//             width: 80,
//             padding: const EdgeInsets.only(bottom: 10),
//             alignment: Alignment.center,
//             margin: const EdgeInsets.only(right: 10),
//             child: Image.asset("assets/logo/sarweal_log.png"),
//           ),
//         ],
//         leading: BackButton(
//           color: Colors.grey,
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("status_title".tr + " #" + widget.orderModel!.order!,
//                 style: Theme.of(context).textTheme.headline2?.copyWith(color: Colors.grey.shade700, fontSize: 14, fontWeight: FontWeight.w500) // TextStyle(fontFamily: "Poppins", color: Colors.grey.shade700, fontSize: 14, fontWeight: FontWeight.w600),
//                 ),
//             Text(
//               widget.orderModel?.process ?? "",
//               style: Theme.of(context).textTheme.headline2?.copyWith(color: _textColor(widget.orderModel!.processId!), fontSize: 12, fontWeight: FontWeight.w400),
//             ),
//           ],
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//       );

//   Color _textColor(int processId) {
//     switch (processId) {
//       case 1:
//         {
//           return primaryColor_2.withOpacity(0.6);
//         }
//       case 2:
//         {
//           return primaryColor_2;
//         }
//       case 3:
//         {
//           return Colors.green;
//         }

//       default:
//         {
//           return primaryColor_2.withOpacity(0.6);
//         }
//     }
//   }
// }

class ImagePreviewItem extends StatelessWidget {
  ImagePreviewItem({Key? key, required this.image}) : super(key: key);
  final String image;
  final _appBar = AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white),
    leading: const BackButton(
      color: primaryColor_2,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: CachedNetworkImage(
        imageUrl: image,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                    color: primaryColor_2, value: downloadProgress.progress))),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.no_photography, size: 30, color: Colors.grey)),
      ),
      // body: PhotoView(
      //   backgroundDecoration: const BoxDecoration(color: Colors.white),
      //   loadingBuilder: (context, event) => Container(
      //     height: _size.height,
      //     width: _size.width,
      //     alignment: Alignment.center,
      //     decoration: const BoxDecoration(color: Colors.white, image: DecorationImage(alignment: Alignment.center, image: AssetImage("assets/images/sarweal_backgraund.png"))),
      //     child: SizedBox(
      //       height: 60,
      //       width: 60,
      //       child: CircularProgressIndicator(
      //         color: primaryColor_2,
      //         value: event == null ? 0 : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1),
      //       ),
      //     ),
      //   ),
      //   heroAttributes: PhotoViewHeroAttributes(tag: image),
      //   minScale: PhotoViewComputedScale.contained * 0.8,
      //   maxScale: PhotoViewComputedScale.covered * 2,
      //   imageProvider: NetworkImage(image),
      // ),
    );
  }
}

class OrderItemTrackingPage extends StatelessWidget {
  // final OrderModel? orderModel;
  static const String routeName = '/trackorder';

  const OrderItemTrackingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.2,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              IconlyLight.arrowLeft2,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
        centerTitle: true,
        title: Text('Kargo Takibi - Sarweal',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey.shade600)),
      ),
      body: ListView(
        padding: paddingHV1520,
        shrinkWrap: true,
        children: [
          Text('Kargo Takibi',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  height: 1, fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500)),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 25),
            child: Image.asset(
              'assets/logo/sarweal_log.png',
              height: 25,
            ),
          ),
          Text('KARGO TAKIP NUMARASI ',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption?.copyWith(color: Colors.grey.shade500)),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 5, bottom: 30),
            height: 45,
            decoration: BoxDecoration(borderRadius: circular30, color: Colors.grey.shade100),
            child: Text("6275  0344  1541  80",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(letterSpacing: 1.5, color: Colors.grey.shade900)),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: 10,
            leading: Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: circular15,
                  border: Border.fromBorderSide(BorderSide(color: Colors.grey.shade300)),
                  color: Colors.white),
              child: Image.asset(
                'assets/images/process.png',
                color: Colors.grey,
              ),
            ),
            title: Text('Paketinizde',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(fontSize: 10, color: Colors.grey.shade500)),
            subtitle: Text('1 ürün bulunmaktadir',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(fontSize: 10, color: Colors.grey.shade500)),
          ),
          Stepper(
            margin: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            currentStep: 4,
            controlsBuilder: (BuildContext context, ControlsDetails details) =>
                const SizedBox.shrink(),
            steps: <Step>[
              Step(
                isActive: true,
                state: StepState.complete,
                title: Text(
                  'Kargoya verildi',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 14),
                ),
                content: SizedBox(width: double.infinity),
              ),
              Step(
                isActive: true,
                state: StepState.complete,
                title: Text('Transfer surecinde',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 14)),
                content: SizedBox(width: double.infinity),
              ),
              Step(
                title: Text('Teslimat şubesinde',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey.shade500, fontSize: 14)),
                content: SizedBox(width: double.infinity),
              ),
              Step(
                title: Text('Kurye dagitimda',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey.shade500, fontSize: 14)),
                content: SizedBox(width: double.infinity),
              ),
              Step(
                title: Text('Tamamlandi',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey.shade500, fontSize: 14)),
                content: SizedBox(width: double.infinity),
              ),
            ],
          ),
          Text("Kargo hereketlerini detayli goster",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: primaryColor_2)),
          SizedBox(height: 40),
          Text("TESLIMAT ADRESI",
              style: Theme.of(context).textTheme.caption?.copyWith(color: Colors.grey)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text("Paharahat 7", style: Theme.of(context).textTheme.bodyMedium),
          ),
          Text("kemine köç.52-nji jaý", style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
