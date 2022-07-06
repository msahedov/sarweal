import 'package:get/get_navigation/src/root/internacionalization.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        //TURKMEN LANGUAGE
        'tk_TM': {
          "yes": "Täzele",
          "no": "Soňa goýmak",
          "newVersion": "Täze Wersiýa !!!",
          "newVersionTitle": "Programmyzyň täze wersiýasy çykdy, telefonyňyza ýükläp bilersiňiz.",

          ///Question Page Words
          "q_1": "Nädip sargyt edilýär?",
          "a_1":
              "Sargytlarym sahypasynda  sargyt etmek düwmesine basyp gerekli harydyňyzyň skrinşotyny ugratmaly.",
          "q_2": "Haýsy harytlary sargyt edip bolýar?",
          "a_2":
              "Islendik harytlary sargyt edip bilersiňiz. Sargytlaryňyz boýunça operatorlarymyz siz bilen goşmaça habarlaşarlar.",
          "q_3": "Sargydymy we olaryň jemi bahalaryny bahalaryny nirede görüp bilerin?",
          "a_3":
              "Sargytlaryňyzy we olaryň bahalaryny “Sargytlarym” sahypasyndan tanyşyp bilersiňiz.",
          "q_4": "Sargan harydym näçe wagtdan gelýär?",
          "a_4": "Harytlaryňyzy ortaça 15-20 gün aralykda getirip berýäris.",
          "q_5": "Tölegini haçan bermeli?",
          "a_5":
              "Sargyt eden günüňiz ýa-da harydy eliňize alandan soňra töleg geçirmeli. Eger-de tölegi öňünden berilen ýagdaýynda arzan tarifden peýdalanyp bilersiňiz.",

          ///Orders Status Page
          "status_title": "SARGYT",
          "all_order_items": "Harytlar",
          "order_cancel_btn_txt": "SARGYDY RET ET",
          "cancel_this_item_txt": "HARYDY RET ET",
          "item_overview": "Giňişleýin",
          "item_size": "Razmer",
          "item_color": "Reňk",
          "item_qty": "Sany",
          "item_price": "Bahasy",
          "call_operator": "HABARLAŞMAK",
          ////Orders Page(Main)
          "connection_title_txt": "Internet birikmesi ýok",
          "connection_subtitle_txt":
              "Internede birikdiriň we gaýtadan \nsynanyşyň", //"Häzirki wagtda haýyşyňyzy\n ýerine ýetirip bilmeris,\n soňrak synanyşyň.",
          "orders_connection_btn_txt": "TÄZEDEN SYNANYŞ",
          "empty_title_txt": "Sargydyňyz tapylmady",
          "empty_subtitle_txt": "Häzirki wagtda sizde\n sargyt ýok. ",
          "orders_empty_btn_txt": "SARGYT ETMEK",
          "float_action_btn_txt": " Täze sargyt",
          "orders_appbar_title": "  Sargytlarym",
          "order_widget_title": "Sargyt",
          "order_widget_subtitle": "Jemi :",

          ///OTP page Words

          "otp_header_txt": " belgisine ugradylan \nkody giriziň ",
          "sms_try_again_txt": "Kod almadyňyzmy? ",
          "sms_try_again_btn_txt": "Kod gelmedi",
          "accept_sms_code": "Tassykla",
          "clear_otp_field": "Arassala",
          "otp_accept_val_txt": "Sms kody nädogry girizdiňiz.\nDogry ýazyp gaýtadan synanşyň!",
          "incorrect_sms_code": "Öýjükleri dolduryň!",
          "try_sms_code": "Sms kod gaýtadan ugradyldy..",

          ///Login Page Words
          "header_txt": "ULGAMA GIRMEK",
          "accept_privace_policy": "Ulanyş şertleri we düzgünleri kabul edýän",
          "login_btn_txt": "Ulgama gir",
          "body_txt": "Telefon belgiňizi ýazyň",
          "input_val_txt": "Telefon belgiňizi giriziň",
          "short_val_txt": "Telefon belgiňiz gysga",
          "correct_val_txt": "Telefon belgiňiz nädogry",
          "accept_val_txt": "Ulanyş şertleri we düzgünleri kabul ediň!",
          "no_connection": "Internet baglanşygy ýok",

          ///Orders Add Page Words
          "p_size": "Razmer",
          "p_color": "Reňk",
          "p_count": "Haryt",
          "p_url": "Harydyň salgylanmasy",
          "p_add_btn": "GOŞMAK",
          "delivery_address": "Adres",
          "phone_number": "Telefon belgim",
          "order_btn_txt": "Sargydy tassykla",
          "note": "Bellik",
          "loader_dialog_title": "Biraz garaşyň..",
          "loader_dialog_body": "Sargydyňyz serwere ugradylýar",
          "phone_val_txt": "Telefon belgi nädogry",
          "address_val_txt": "Salgyňyzy saýlaň",
          "complete_btn_txt": "Baş Sahypa Git",
          "empty_header_txt": "SARGAMAK",
          "empty_body_txt": " Sargamak isleýän \nharydyňyzyň suratyny saýlaň \nwe ugradyň.",
          "empty_btn_txt": "HARYT SAÝLAMAK",
          "dialog_header": "Sargydyňyz üçin sag boluň!",
          "dialog_body":
              "Sargydyňyz kabul edildi.\nÝakyn wagtda buýrugy \ntassyklamak üçin dolandyryjy \nsize ýüz tutar.",
          "search_field_label": "Gözleg",
          "search_sheet_title": "Raýonyňyzy saýlaň",
          "phone_empty_val_txt": "Telefon belgiňizi giriziň!",
          "otp_title": "SMS kod",
          "otp_close": "Ýap",
          "otp_verify": "Tassykla",
          "sms_code_resend": "Gaýtadan ugrat",
          "otp_field_help": "Sargydy tassyklamak üçin sms arkaly gelen kody giriziň",

          /////Profil Page Words
          "version": "Wersiýa",
          "login": "Ulgama girmek",
          "login_btn": "Ulgama gir",
          "select_language": "Dil saýlaň",
          "change_locale": "Dil çalyşmak",
          "language": "Türkmen",
          'phone': "Ulanyjy profili",
          "appbar_title": "Ulanyjy",
          "notifications": "Bildirişler",
          "favorites": "Halanlarym",
          "settings": "Sazlamalar",
          "share_app": "Paýlaşmak",
          "about_us": "Biz barada",
          "about_text":
              "Sarweal - Trendyol, Hepsiburada, GittiGidiyor ýaly Türkiýäniň internet magazinlerinden sargan harytlaryňyzy tiz wagtda getirip berýär.\n\nSarweal telefon programmasynyň üsti bilen internet magazinlerinden halan harytlaryňyzyň skrinşotlaryny bize iberiň we sargyt ediň.\n\nSargan harytlaryňyzyň nireden gelýändigini aňsatlyk bilen bilip bilersiňiz. Sarweal - çalt, aňsat, we amatly söwda.",
          "dark_mode": "Gara tema",
          "contact_us": "Habarlaşmak",
          "question_answer": "Köp soralýan soraglar",
          "log_out": "Ulgamdan çykmak"
        },

        //RUSSIAN LANGUAGE
        'ru_RU': {
          "yes": "Обновить",
          "no": "Позже",
          "newVersion": "Новая версия !!!",
          "newVersionTitle":
              "Вышла новая версия нашей программы, которую вы можете скачать на свой телефон.",

          ///Questions Page Words
          "q_1": "Как оформить заказ?",
          "a_1":
              "На странице «Мои заказы», нажав кнопку «Заказать», вам необходимо отправить скриншоты желаемых товаров.",
          "q_2": "Какие товары можно заказывать?",
          "a_2":
              "Вы можете заказывать любые виды товаров. В случае необходимости наши операторы свяжутся с вами.",
          "q_3": "Где я могу посмотреть мои заказы и их расценки?",
          "a_3":
              "Вы можете ознакомиться о ваших заказах и об их расценках на странице «Мои заказы».",
          "q_4": "Когда приходит заказанный товар?",
          "a_4": "Он будет доставлен вам в течение 20-25 дней после вашего заказа.",
          "q_5": "Когда платить за заказ?",
          "a_5": "В день размещения заказа или в день получения товара.",

          ///Orders Status Page
          "status_title": "ЗАКАЗ",
          "all_order_items": "Заказанные товары",
          "order_cancel_btn_txt": "ОТКАЗАТЬ ВЕС ЗАКАЗ",
          "cancel_this_item_txt": "Отказать товар",
          "item_overview": "O продукте",
          "item_size": "Размер",
          "item_color": "Цвет",
          "item_qty": "Kоличество",
          "item_price": "Цена",
          "call_operator": "Позвонить оператору",

          ////Orders Page(Main)
          "connection_title_txt": "Нет подключения к интернету",
          "connection_subtitle_txt":
              "Подключитесь к сети и повторите попытку", //"В данный момент мы не можем \nвыполнить ваш запрос.\nПовторите попытку позже.",
          "orders_connection_btn_txt": "ПОПРОБУЙТЕ СНОВА",
          "empty_title_txt": "заказ не найден", //Ваш
          "empty_subtitle_txt": "У вас пока нет заказов.",
          "orders_empty_btn_txt": "ЗАКАЗАТЬ СЕЙЧАС",
          "float_action_btn_txt": "Новый заказ",
          "orders_appbar_title": "Мои заказы",
          "order_widget_title": "Заказ",
          "order_widget_subtitle": "Итого : ",

          ///OTP page Words
          "otp_header_txt": "Введите код, отправленный на ваш телефонный номер ",
          "sms_try_again_txt": "Не получили код? ",
          "sms_try_again_btn_txt": "ОТПРАВИТЬ СМС КОД",
          "accept_sms_code": "ПОДТВЕРДИТЬ",
          "clear_otp_field": "Очистить",
          "otp_accept_val_txt": "SMS-код неправильный! Попробуйте ввести его еще раз!",
          "incorrect_sms_code": "Неправильный код!",
          "try_sms_code": "Повторная отправка...",

          ///Login Page Words
          "header_txt": "ВОЙТИ В СИСТЕМУ",
          "accept_privace_policy": "Принятие условий использования",
          "login_btn_txt": "ВОЙТИ",
          "body_txt": "Введите свой номер телефона",
          "input_val_txt": "Введите свой номер телефона",
          "short_val_txt": "Введите правильный номер телефона",
          "correct_val_txt": "Введите правильный номер телефона",
          "accept_val_txt": "Принять условия использования!",
          "no_connection":
              "Не удалось подключиться к \nсерверу. Подключитесь к интернету и повторите попытку",

          ///Orders Add Page Words
          "p_size": "Размер",
          "p_color": "Цветь",
          "p_count": "Товар",
          "p_url": "Ссылка",
          "p_add_btn": "ДОБАВИТЬ ЕЩЁ",
          "delivery_address": "Адрес",

          "note": "Примечание",
          "loader_dialog_title": "Подождите минуту..",
          "loader_dialog_body": "Ваш заказ отправляется на сервер",
          "order_btn_txt": "Оформить заказ",
          "phone_val_txt": "Введите действующий номер телефона",
          "address_val_txt": "Выберите адрес",
          "complete_btn_txt": "ЗАВЕРШИТЬ",
          "empty_header_txt": "ЗАКАЗАТЬ",
          "empty_body_txt": " Выберите скриншот товара и отправьте заказ.",
          "empty_btn_txt": "ВЫБРАТ ТОВАР",
          "dialog_header": "Спасибо за заказ!",
          "dialog_body":
              "Ваш заказ принят.\nВ ближайшее время с вами \nсвяжется менеджер для \nподтверждения заказа",
          "search_field_label": "Поиск",
          "search_sheet_title": "Выберите район",
          "phone_empty_val_txt": "Введите номер телефона!",
          "otp_title": "СМС код",
          "otp_close": "Закрыть",
          "otp_verify": "Подтвердить",
          "sms_code_resend": "Отправить код",
          "otp_field_help": "Введите код из СМС",

          ///Profil Page Words
          "version": "Версия",
          "login": "Войти в систему",
          "login_btn": "Войти",

          "select_language": "Выберите язык",
          "change_locale": "Сменить язык",

          "language": "Русский",
          'phone': "Профиль",
          "appbar_title": "Пользователь",
          "notifications": "Уведомления",
          "favorites": "Избранное",
          "settings": "Настройки",
          "share_app": "Поделиться",
          "about_us": "О нас",
          "about_text":
              "Sarweal-это платформа для быстрой доставки ваших заказов из интернет магазинов Турции, таких как Trendyol, Hepsiburada, GittiGidiyor. \n\nДелайте скриншоты понравившихся товаров из интернет магазинов и заказывайте через мобильное приложение Sarweal. \n\nВы можете отслеживать свои товары быстро и легко. Sarweal-быстро, легко и удобно.",
          "contact_us": "Контакты",
          "question_answer": "Часто задаваемые вопросы",
          "dark_mode": "Темный режим",
          "log_out": "Выйти"
        },
      };
}
