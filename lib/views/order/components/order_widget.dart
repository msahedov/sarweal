import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:sarweal/constants/constants.dart';
import 'package:sarweal/models/order.model.dart';
import 'package:sarweal/views/order/trackorder/order_tracking_page.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({Key? key, required this.orderModel}) : super(key: key);
  final OrderModel orderModel;

  Widget _iconStatusSwitcher(int processId) {
    switch (processId) {
      case 1:
        {
          return Icon(
            Icons.access_time_filled,
            color: primaryColor_2.withOpacity(0.6),
            size: 35,
          );
        }
      case 2:
        {
          return const ImageIcon(AssetImage("assets/images/process.png"), size: 30, color: primaryColor_2);
        }
      case 3:
        {
          return const Icon(
            Icons.check_circle_rounded,
            color: Colors.green,
            size: 35,
          );
        }

      default:
        {
          return Icon(
            Icons.access_time_filled,
            color: primaryColor_2.withOpacity(0.6),
            size: 30,
          );
        }
    }
  }

  Color _textColor(int processId) {
    switch (processId) {
      case 1:
        {
          return primaryColor_2.withOpacity(0.6);
        }
      case 2:
        {
          return primaryColor_2;
        }
      case 3:
        {
          return Colors.green;
        }

      default:
        {
          return primaryColor_2.withOpacity(0.6);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final _trailing = Container(
      height: 60,
      width: 30,
      alignment: Alignment.center,
      child: const Icon(IconlyLight.arrowRight2),
    );
    final _title = Text(
      "order_widget_title".tr + " #" + orderModel.order.toString(),
      style: TextStyle(color: Colors.grey.shade700, fontSize: 14, fontWeight: FontWeight.w400),
    );
    final _leading = Container(height: 60, width: 30, alignment: Alignment.center, child: _iconStatusSwitcher(orderModel.processId!));
    final _subtitle1 = Text(
      orderModel.process.toString(),
      style: TextStyle(color: _textColor(orderModel.processId!), fontSize: 10, fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),
    );
    final _subtitle2 = orderModel.totalPrice == null
        ? const SizedBox.shrink()
        : Text(
            "order_widget_subtitle".tr + orderModel.totalPrice.toString() + " TMT",
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12, fontWeight: FontWeight.w400),
          );
    // return TicketView(
    //   backgroundPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
    //   backgroundColor: Color(0xFF8F1299),
    //   contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 0),
    //   drawArc: false,
    //   triangleAxis: Axis.vertical,
    //   borderRadius: 6,
    //   corderRadius: 0,
    //   drawDivider: true,
    //   trianglePos: .5,
    //   child: Container(
    //     height: 200,
    //     color: Colors.yellow,
    //   ),
    // );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: circular25),
        isThreeLine: true,
        minLeadingWidth: 20,
        onTap: () => Navigator.of(context).pushNamed(OrderTrackingPage.routeName, arguments: orderModel),
        tileColor: Colors.white,
        hoverColor: Colors.white,
        focusColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        leading: _leading,
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_subtitle1, _subtitle2],
        ),
        title: _title,
        trailing: _trailing,
      ),
    );
  }
}
