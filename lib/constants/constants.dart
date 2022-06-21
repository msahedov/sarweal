import 'package:flutter/material.dart';
import 'package:sarweal/models/order.model.dart';

//Colors
const Color primaryColor_1 = Color(0xFF560A59);
const Color primaryColor_2 = Color(0xFFEE8B06);
const Color fonColor_1 = Color(0xFFfff9f5);
const Color fonColor_2 = Color(0xFFffebe1);
const Color primaryColor_3 = Color(0xFFEEC897);
//Form error
final RegExp phoneValidatorRegExp = RegExp(r'(^(?:[6])?[1-5]{1}?[ ]{1}?[0-9]{6}$)');

///Padding
EdgeInsets paddingHV1015 = const EdgeInsets.symmetric(horizontal: 15, vertical: 10);
EdgeInsets paddingHV1520 = const EdgeInsets.symmetric(horizontal: 15, vertical: 20);
//Borders
BorderRadius circular30 = const BorderRadius.all(Radius.circular(30));
BorderRadius circular25 = const BorderRadius.all(Radius.circular(25));
BorderRadius circular15 = const BorderRadius.all(Radius.circular(15));
BorderRadius circular10 = const BorderRadius.all(Radius.circular(10));
BorderRadius circular8 = const BorderRadius.all(Radius.circular(8));
BorderRadius circular5 = const BorderRadius.all(Radius.circular(5));

///shadows
BoxShadow shadow = BoxShadow(
  offset: const Offset(-1, 1),
  color: Colors.grey.shade300,
  blurRadius: 5,
);
final orders = [
  OrderModel(count: '3', customerAddress: "Mary", note: "uuu", totalPrice: '1200', id: '1', order: '9867', orderId: 1, userId: 12, createdTime: "12.05.2022", process: "Tassyklanmady", processId: 1),
  OrderModel(count: '3', customerAddress: "Mary", note: "uuu", totalPrice: '1200', id: '1', order: '9867', orderId: 1, userId: 12, createdTime: "12.05.2022", process: "Tassyklanmady", processId: 1),
  OrderModel(count: '3', customerAddress: "Mary", note: "uuu", totalPrice: '1200', id: '1', order: '9867', orderId: 1, userId: 12, createdTime: "14.05.2022", process: "Tassyklanmady", processId: 1)
];

final List<Map<String, String>> rayonlar = [
  {"tk": "1 mkr", "ru": "1 мкр"},
  {"tk": "2 mkr", "ru": "2 мкр"},
  {"tk": "3 mkr", "ru": "3 мкр"},
  {"tk": "4 mkr", "ru": "4 мкр"},
  {"tk": "5 mkr", "ru": "5 мкр"},
  {"tk": "6 mkr", "ru": "6 мкр"},
  {"tk": "8 mkr", "ru": "8 мкр"},
  {"tk": "9 mkr", "ru": "9 мкр"},
  {"tk": "10 mkr", "ru": "10 мкр"},
  {"tk": "11 mkr", "ru": "11 мкр"},
  {"tk": "30 mkr", "ru": "30 мкр"},
  {"tk": "Parahat 1", "ru": "Мир 1"},
  {"tk": "Parahat 2", "ru": "Мир 2"},
  {"tk": "Parahat 3", "ru": "Мир 3"},
  {"tk": "Parahat 4", "ru": "Мир 4"},
  {"tk": "Parahat 5", "ru": "Мир 5"},
  {"tk": "Parahat 6", "ru": "Мир 6"},
  {"tk": "Parahat 7", "ru": "Мир 7"},
  {"tk": "Parahat 8", "ru": "Мир 8"},
  {"tk": "Howdan A", "ru": "Гаудан А"},
  {"tk": "Howdan B", "ru": "Гаудан Б"},
  {"tk": "Howdan W", "ru": "Гаудан В"},
  {"tk": "DOSAAF", "ru": "ДОСААФ"},
  {"tk": "Nagina", "ru": "Нагина"},
  {"tk": "13 etap", "ru": "13 этап"},
  {"tk": "14 etap", "ru": "14 этап"},
  {"tk": "15 etap", "ru": "15 этап"},
  {"tk": "16 etap", "ru": "16 этап"},
  {"tk": "Olimpiýa şäherçesi", "ru": "Олимпийский городок"},
  {"tk": "Nebitgaz", "ru": "Нефтегаз"},
  {"tk": "Arçabil", "ru": "Арчабиль"},
  {"tk": "Çandibil", "ru": "Чандыбиль"},
  {"tk": "Atatürk", "ru": "Ататурк"},
  {"tk": "Türkmenbaşy şaýoly", "ru": "Ленина"},
  {"tk": "10 ýyl abadançylyk", "ru": "Московская"},
  {"tk": "Bitaraplyk", "ru": "Подвойского"},
  {"tk": "Garaşsyzlyk şaýoly", "ru": "Советская"},
  {"tk": "Çehow", "ru": "Чехова"},
  {"tk": "Merkez", "ru": "Центр"},
  {"tk": "Dworýanskoýe gnezdo", "ru": "Дворянское гнездо"},
  {"tk": "Ak altyn", "ru": "Ак Алтын"},
  {"tk": "Kim raýon", "ru": "Ким район"},
  {"tk": "Magtymguly şaýoly", "ru": "Свобода"},
  {"tk": "Gagarin", "ru": "Гагарина"},
  {"tk": "Ýerewanskiý", "ru": "Ереванская"},
  {"tk": "Petrozawodskiý", "ru": "Петрозаводская"},
  {"tk": "Gogol", "ru": "Гоголя"},
  {"tk": "Grajdanskiý", "ru": "Гражданская"},
  {"tk": "Hitrowka", "ru": "Хитровка"},
  {"tk": "Bekrewe", "ru": "Бекрава"},
  {"tk": "Bagyr", "ru": "Багир"},
  {"tk": "Köşi", "ru": "Коши"},
  {"tk": "Köşi taslama", "ru": "Коши таслама"},
  {"tk": "Gurtly", "ru": "Гуртлы"},
  {"tk": "Ruhabat", "ru": "90 разъезд"},
  {"tk": "G. Kulyýewa", "ru": "Объездная"},
  {"tk": "Arzuw", "ru": "Арзув"},
  {"tk": "Şor garadamak", "ru": "Шор гарадамак"},
  {"tk": "Çoganly", "ru": "Чоганлы"},
  {"tk": "Ýalkym", "ru": "Ялкым"},
  {"tk": "Gökçe", "ru": "Гокче"},
  {"tk": "Herrikgala", "ru": "Херрикгала"},
  {"tk": "Ýasmansalyk", "ru": "Ясмансалык"},
  {"tk": "Akdaşaýak", "ru": "Акдашаяк"},
  {"tk": "Büzmeýin", "ru": "Безмеин"},
  {"tk": "Täze zaman", "ru": "Тязе заман"},
  {"tk": "Eksbaza", "ru": "Эксбаза"},
  {"tk": "Promzona", "ru": "Промзона"},
  {"tk": "Bedew", "ru": "Бедев"},
];
