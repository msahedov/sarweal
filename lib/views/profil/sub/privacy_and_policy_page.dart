import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class PrivacyAndPolicy extends StatelessWidget {
  static const String routeName = '/privacy-policy';

  const PrivacyAndPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Ulanylyş kadalary", style: Theme.of(context).textTheme.titleLarge),
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
        leading: IconButton(
          onPressed: () => Get.back(),
          splashRadius: 25,
          icon: const Icon(
            IconlyLight.arrowLeft2,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(padding: const EdgeInsets.fromLTRB(20, 20, 20, 40), children: [
        RichText(
            text: TextSpan(
                text: "Sarweal - Ulanyş kadalary\n",
                style: Theme.of(context).textTheme.titleSmall,
                children: [
              TextSpan(
                text:
                    'Sarweal - Internet Magaziny (" Sarweal ")  bilen , onuň agzasynyň ( " Agza " ) arasynda aşakdaky şertleri ýerine ýetirmek barada ylalaşyga gelindi.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextSpan(text: "\n\nUmumy düzgünler\n", children: [
                TextSpan(
                  text:
                      "- Agza , applikasiýada bellige alyş işlerini tamamlandan soň , şu Ylalaşykda bellenen şertlere eýermek bilen telefon belgisini we tassyklaýyş kodyny girizip , applikasiýany ulanmaga başlap biler .\n - Agzanyň applikasiýany ulanyp başlamagy Ylalaşygyň ähli şertlerini kabul edýär diýip hasaplanylýar .\n - Ylalaşyk , agzalygyňyzyň ýatyrylmagy bilen güýjini ýitirjekdir .\n - Sarweal şu Ylalaşyga birtaraplaýyn üýtgetmeleri we goşmaçalary girizip biler .\n - Applikasiýanyň belli ýerlerinde , umumy düzgünler , şeýle hem degişli bölüme laýyk başga şertler - de bellenilip biliner . Hyzmatlarymyzdan peýdalanýan Agza , degişli şertleri okan we kabul eden hasaplanýar.",
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ]),
              TextSpan(
                  text: "\n\nAgzanyň hukuklary we borçlary\n",
                  style: Theme.of(context).textTheme.titleSmall,
                  children: [
                    TextSpan(
                      text:
                          "- Applikasiýa , ähli adamlaryň ulanmagy üçin açykdyr .\n - Agza , applikasiýany ulananda , Ylalaşykda bellenen ähli şertleri kabul edýär .\n - Agza , applikasiýadan peýdalanan döwründe Türkmenistanyň kanunçylygyna laýyklykda hereket etjekdigine borçlanýar .\n - Agza , beýleki agzalaryň we zyýaratçylaryň applikasiýany ulanmagyna päsgel beriji ýa - da agyrlaşladyryjy hereketlere baş goşmaly däldir . Baş goşan ýagdaýynda , Sarweal tarapyndan agzalykdan çykaryljakdygyny we bu ýagdaý sebäpli ýüze çykjak her bir hukuk we jerime jogapkärçiligini öz üstüne kabul edýär .\n - Sosial ulgamlarda operator bilen ýazyşmalaryň göçürmesiniň saklanmagy agzalaryň jogapkärçiligindedir . Bu Sarweal tarapyndan maslahat berilýär . Yazyşmalaryň göçürmesi saklanmadyk ýagdaýynda , ýitmeginden ýa - da pozulmagyndan Sarweal jogapkär däldir .\n - Sarweal ýa - da Agzanyň özi tarapyndan ýatyrylan agza , hasabyna degişli ýazgysyny , agzanyň garşy talabynyň bolmadyk ýagdaýynda , Sarweal ony pozmakda ýa da pozmazlykda erkindir.\n- Agza , applikasiýa registrasiýa bolanynda ýa da hyzmatlaryndan peýdalananynda şahsy we beýleki maglumatlarynyň dogrulygyny we bu maglumatlaryň dogry bolmadyk ýagdaýynda Sarwealyň bu sebäpden görjek ähli zeperlerini tölejekdigini kabul edýär.",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ]),
              TextSpan(
                  text: "\n\nSarwealyň hukuklary we jogapkärçiligi\n",
                  style: Theme.of(context).textTheme.titleSmall,
                  children: [
                    TextSpan(
                      text:
                          "- Agza , applikasiýany ulanmak bilen bagly Türkmenistanyň kanunçylygyny we şu Ylalaşygyň şertlerini bozan ýagdaýynda Sarwealyň birtaraplaýyn agzany agzalykdan çykarmaga hukugy bardyr .\n - Agzalara , Sarweal tarapyndan applikasiýa agza bolmagy bilen berilen ýa - da öz bellän agza ady , açar sözi ýaly maglumatlaryň ulanmagyny , başga adamlara beren ýagdaýynda , açar sözüniň başga adamalar tarapyndan ýaman niýet bilen ulanylmagyndan Agza jogapkärdir . Şeýle - de , Agza , internet äleminde başganyň IP adresini , e - poçta adresini we ulanyjy adyny ulanyp bilmeýändigi bilen birlikde , Agzalaryň şahsy maglumatlaryny rugsatsyz ulanyp bilmeýär . Ulanylan halatynda , ýüze çykjak ähli hukuk we jerime jogapkärçiliklerini Agza öz üstüne alýar .",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ]),
              TextSpan(
                  text: "\n\nAlynan maglumatlar we olaryň ulanylyşy\n",
                  style: Theme.of(context).textTheme.titleSmall,
                  children: [
                    TextSpan(
                      text:
                          "Applikasiýanyň hyzmatlaryndan ulanýan döwrünizde we / ýa - da applikasiýamyza agza bolan ýagdaýyňyzda , size ýokary hilli hyzmat bermek üçin adyňyz , familiýaňyz , telefon belgiňiz , jynsyňyz , eltip berme adresiniz ýaly käbir şahsy maglumatlaryňyza zerurlyk ýüze çykýar . Saytda alynan maglumatlar aşakdaky maksatlar üçin ulanylýar :\n - Siziň hususy hasabyňyzy döretmek .\n - Sargydy ýerine ýetirmek , tamamlamak we müşderilerimiz bilen aragatnaşyk saklamak .\n - Sargytlar , hyzmatlar we arzanladyşlar hakda maglumat bermek .\n - Müşderilerimiziň söwda saýlawlaryny has gowy bilmek we olara teklipler hödürlemek .\n - Trend seljermeleri we statistik seljermeler etmek .",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ]),
            ])),
      ]),
    );
  }
}
