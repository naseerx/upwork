import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:upwork/UI/Screens/register_screen.dart';
import 'package:upwork/UI/Screens/verify_screen.dart';
import 'package:upwork/UI/Utils/app_utils.dart';
import 'package:upwork/UI/custom_widgets/custom_button.dart';
import 'package:upwork/UI/custom_widgets/small_widgets.dart';

import '../../Core/google_ads_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BannerAd? _bannerAd;

  Future<InitializationStatus> initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }

  void logAppOpen() async {
    await _firebaseAnalytics.logAppOpen();
  }

  final FirebaseAnalytics _firebaseAnalytics = FirebaseAnalytics.instance;

  void onAdClicked() {
    _firebaseAnalytics.logEvent(
      name: 'google_ad_conversion',
      parameters: {
        'value': '1.0',
        'currency': 'USD',
      },
    );
  }

  void _setAnalyticsProperties() async {
    await _firebaseAnalytics.setUserId(id: '000002');
    await _firebaseAnalytics.setUserProperty(
      name: 'tester',
      value: 'upwork project',
    );
  }

  @override
  void initState() {
    super.initState();
    initGoogleMobileAds();
    logAppOpen();
    _setAnalyticsProperties();
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          if (kDebugMode) {
            print('Failed to load a banner ad: ${err.message}');
          }
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            sizedBox10,
            _bannerAd != null
                ? GestureDetector(
                    onTap: onAdClicked,
                    child: SizedBox(
                      width: _bannerAd!.size.width.toDouble(),
                      height: _bannerAd!.size.height.toDouble(),
                      child: AdWidget(ad: _bannerAd!),
                    ),
                  )
                : const Text('Ads Here'),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  sizedBox20,
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.2,
                        child: const CircleAvatar(
                          radius: 40,
                          child: Icon(
                            Icons.mobile_friendly,
                            size: 40,
                          ),
                        ),
                      ),
                      SizedBox(
                          width: size.width * 0.7,
                          height: 55,
                          child: CustomElevatedButton(
                              name: 'Verify',
                              onTap: () {
                                FirebaseAnalytics.instance.logEvent(
                                    name: 'Verify button',
                                    parameters: {'button_id': 'verify'});

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const VerifyScreen()));
                              },
                              background: gPrimaryColor))
                    ],
                  ),
                  sizedBox15,
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.2,
                        child: const CircleAvatar(
                          radius: 40,
                          child: Icon(
                            Icons.mobile_friendly,
                            size: 40,
                          ),
                        ),
                      ),
                      SizedBox(
                          width: size.width * 0.7,
                          height: 55,
                          child: CustomElevatedButton(
                              name: 'Register',
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen()));
                                FirebaseAnalytics.instance.logEvent(
                                    name: 'registration button',
                                    parameters: {'button_id': 'registration'});
                              },
                              background: gDarkBrown))
                    ],
                  ),
                  sizedBox50,
                  const Text(
                    'Telemarketing',
                    style: TextStyle(fontSize: 18),
                  ),
                  sizedBox20,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: gBlack),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                  style: TextStyle(color: gBlack, fontSize: 18),
                                  text: 'You can '),
                              TextSpan(
                                  style: const TextStyle(
                                      color: gBlue, fontSize: 18),
                                  text: 'register',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('Terms of Service"');
                                    }),
                              const TextSpan(
                                  style: TextStyle(color: gBlack, fontSize: 18),
                                  text: ' your home or mobile phone for '),
                              TextSpan(
                                  style: const TextStyle(
                                      color: gBlack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  text: 'free',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('Privacy Policy"');
                                    }),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  sizedBox20,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: gBlack),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                  style: TextStyle(color: gBlack, fontSize: 18),
                                  text: 'After you register, '),
                              TextSpan(
                                style: TextStyle(
                                    color: gBlack,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                text: 'other types of organization',
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  sizedBox20,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: gBlack),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                  style: TextStyle(color: gBlack, fontSize: 18),
                                  text:
                                      'If you received an unwanted call after your number '),
                              TextSpan(
                                  style: const TextStyle(
                                      color: gBlue, fontSize: 18),
                                  text: 'regret it ',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('Terms of Service"');
                                    }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  sizedBox50,
                  SizedBox(
                      height: 45,
                      width: size.width * 0.7,
                      child: CustomElevatedButton(
                          name: 'Resources',
                          onTap: () {
                            FirebaseAnalytics.instance.logEvent(
                                name: 'Resources button',
                                parameters: {'button_id': 'resources'});
                          },
                          background: gRed)),
                  sizedBox50,
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: gBrown,
          height: 80,
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Back to ftc',
                style: TextStyle(
                    fontSize: 18,
                    color: gWhite,
                    decoration: TextDecoration.underline),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '|  Privacy Policy',
                style: TextStyle(
                    fontSize: 18,
                    color: gWhite,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
