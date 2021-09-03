import 'package:admob_flutter/admob_flutter.dart';
import 'package:covid/app/layout/layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

class Layout extends StatefulWidget {
  Layout({Key key}) : super(key: key);

  @override
  LayoutState createState() => LayoutState();
}

class LayoutState extends State<Layout> {
  LayoutController controller = new LayoutController();

  @override
  void initState() {
    super.initState();
    Admob.initialize('ca-app-pub-7746702946152949~6914436794');
    /*
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-7746702946152949~6914436794');

        

    myBanner
      // typically this happens well before the ad is shown
      ..load()
      ..show(
        // Positions the banner ad 60 pixels from the bottom of the screen
        anchorOffset: 60.0,
        // Positions the banner ad 10 pixels from the center of the screen to the right
        horizontalCenterOffset: 10.0,
        // Banner Position
        anchorType: AnchorType.bottom,
      );
    myInterstitial
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );*/
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR', null);
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.titulo),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.visibility),
              onPressed: () {
                controller.telaPrecaucoes(context);
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: controller.widgetOptions[controller.indiceNavegacao]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('Resumo')),
          BottomNavigationBarItem(
              icon: Icon(Icons.flare), title: Text('Estados')),
        ],
        currentIndex: controller.indiceNavegacao,
        onTap: (int index) {
          controller.onTapped(index);
          setState(() {});
        },
      ),
      floatingActionButton: controller.indiceNavegacao != 0
          ? FloatingActionButton.extended(
              icon: Icon(
                Icons.visibility,
                color: Colors.black,
              ),
              label: Text('Precauções COVID'),
              onPressed: (){
                controller.telaPrecaucoes(context);
              })
          : FloatingActionButton(
              child: Icon(
                Icons.share,
                color: Colors.black,
              ),
              onPressed: controller.share),
    );
  }
}

/*
MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['flutterio', 'beautiful apps'],
  contentUrl: 'https://flutter.io',
  birthday: DateTime.now(),
  childDirected: false,
  designedForFamilies: false,
  gender:
      MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>[], // Android emulators are considered test devices
);

BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: 'ca-app-pub-7746702946152949/4096701761',
  size: AdSize.banner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);

InterstitialAd myInterstitial = InterstitialAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: InterstitialAd.testAdUnitId,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("InterstitialAd event is $event");
  },
); */
