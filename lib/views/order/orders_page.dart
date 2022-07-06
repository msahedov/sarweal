import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:sarweal/constants/constants.dart';
import 'package:sarweal/controllers/order.controller.dart';
import 'package:sarweal/models/order.model.dart';
import 'package:sarweal/views/order/neworder/calculator.dart';
import 'package:sarweal/views/screen_repository.dart';

class OrdersPage extends StatelessWidget {
  static const String routeName = '/orders';
  OrdersPage({
    Key? key,
  }) : super(key: key);

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

//  final ValueNotifier<bool> _isVisible = ValueNotifier(true);

  // @override
  // initState() {
  //   super.initState();
  //   _scrollController.addListener(() {
  //     if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
  //       if (_isVisible.value == true) {
  //         _isVisible.value = false;
  //       }
  //     } else {
  //       if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
  //         if (_isVisible.value == false) {
  //           _isVisible.value = true;
  //         }
  //       }
  //     }
  //   });
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     RemoteNotification? notification = message.notification;

  //     if (notification != null) {
  //       // flutterLocalNotificationsPlugin.show(
  //       //     message.hashCode,
  //       //     message.notification?.title,
  //       //     message.notification?.body,
  //       //     NotificationDetails(
  //       //       android: AndroidNotificationDetails(
  //       //         channel.id,
  //       //         channel.name,
  //       //         channelDescription: channel.description,
  //       //         color: primaryColor_2,
  //       //         playSound: true,
  //       //         icon: '@mipmap/ic_launcher',
  //       //       ),
  //       //     ));
  //     }
  //   });
  //   FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
  //     RemoteNotification? notification = message?.notification;

  //     if (notification != null) {
  //       // flutterLocalNotificationsPlugin.show(
  //       //     message.hashCode,
  //       //     message?.notification?.title,
  //       //     message?.notification?.body,
  //       //     NotificationDetails(
  //       //       android: AndroidNotificationDetails(
  //       //         channel.id,
  //       //         channel.name,
  //       //         channelDescription: channel.description,
  //       //         color: primaryColor_2,
  //       //         playSound: true,
  //       //         icon: '@mipmap/ic_launcher',
  //       //       ),
  //       //     ));
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: RefreshIndicator(
        displacement: 90,
        key: _refreshIndicatorKey,
        color: primaryColor_2,
        backgroundColor: Colors.white,
        onRefresh: () async {
          return Future.delayed(const Duration(milliseconds: 1000), () {});
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          slivers: [
            SliverAppBar(
              centerTitle: false,
              pinned: false,
              floating: true,
              automaticallyImplyLeading: false,
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
              elevation: 5.0,
              shadowColor: Colors.grey.shade100,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    splashRadius: 25,
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    icon: Icon(
                      Icons.more_vert, // IconlyLight.moreSquare,
                      //  size: 30,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      Get.toNamed(Calculator.routeName);
                      // widget.controller?.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOutCubic);
                    },
                  ),
                ),
              ],
              title: Image.asset("assets/logo/sarweal_log.png", height: 20),
            ),
            GetBuilder(
              init: OrderController(),
              autoRemove: false,
              builder: (OrderController controller) {
                return controller.obx(
                    (state) => SliverPadding(
                          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 0),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              childCount: state?.length,
                              (BuildContext context, int index) =>
                                  OrderItemCard(order: state![index]),
                            ),
                          ),
                        ),
                    onEmpty: Text("Bos"),
                    onLoading: const SliverFillRemaining(
                      fillOverscroll: true,
                      child: Center(
                          child: CircularProgressIndicator(
                        color: primaryColor_2,
                      )),
                    ),
                    onError: (errorText) => SliverFillRemaining(
                        fillOverscroll: true,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.wifi_off,
                              size: 100,
                              color: Colors.grey,
                            ),

                            Text("connection_title_txt".tr,
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(context).textTheme.titleMedium?.copyWith(height: 3)),

                            Text("connection_subtitle_txt".tr,
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5)),
                            SizedBox(
                              height: 50,
                            ),
                            // ignore: deprecated_member_use
                            RaisedButton(
                                onPressed: () {},
                                color: primaryColor_2,
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
                                shape: RoundedRectangleBorder(borderRadius: circular5),
                                child: Text(
                                  "Täzeden barla",
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(color: Colors.white),
                                )),
                          ],
                        )));
              },
            ),
          ],
        ),
      ),

      // floatingActionButton: ValueListenableBuilder(
      //     valueListenable: _isVisible,
      //     builder: (BuildContext context, bool visible, Widget? child) {
      //       return FloatingActionButton.extended(
      //         label: Text(
      //           "float_action_btn_txt".tr,
      //           style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),
      //         ),
      //         onPressed: () {
      //           pageIndex.value = 1;
      //         }, //=> Get.toNamed(NewOrderPage.routeName),
      //         backgroundColor: primaryColor_2,
      //         isExtended: visible,
      //         icon: const Icon(Icons.add, color: Colors.white),
      //       );
      //     }),
    );
  }
}

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({Key? key, required this.order}) : super(key: key);
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(borderRadius: circular10, boxShadow: [shadow], color: Colors.white),
      child: Column(
        children: [
          ListTile(
              dense: true,
              minLeadingWidth: 0,
              contentPadding: const EdgeInsets.only(left: 15),
              horizontalTitleGap: 0,
              trailing: IconButton(
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                icon: const Icon(
                  IconlyLight.arrowRightSquare,
                  size: 26,
                ),
                onPressed: () {
                  Get.toNamed(OrderTrackingPage.routeName, arguments: order);
                },
              ),
              tileColor: Colors.grey.shade100,
              title:
                  Text("Sargyt:  #${order.order}", style: Theme.of(context).textTheme.titleSmall),
              subtitle: Text("Jemi Bahasy:  ${order.totalPrice} TMT",
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 10))),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: circular5),
                  margin: const EdgeInsets.only(left: 0, right: 5),
                  child: Image.asset(
                    "assets/images/product1.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  height: 80,
                  width: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: circular5),
                  margin: const EdgeInsets.all(5),
                  child: Image.asset(
                    "assets/images/product2.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  height: 80,
                  width: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: circular5),
                  margin: const EdgeInsets.all(5),
                  child: Image.asset(
                    "assets/images/product3.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
            child: SizedBox(
              height: 35,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Status :",
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 10)),
                          Text("Takmyny Gowşurma :",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(fontSize: 10, height: 1.5))
                        ],
                      )),
                  const VerticalDivider(),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Sargydyňyz kabul edildi",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 10),
                        ),
                        Text(
                          "20.06.2022 - 10.07.2022",
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(fontSize: 10, height: 1.5),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
