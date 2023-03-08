import 'dart:convert';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:upwork/UI/Utils/app_utils.dart';
import 'package:upwork/UI/custom_widgets/custom_button.dart';
import 'package:upwork/UI/custom_widgets/custom_text_field.dart';
import 'package:upwork/UI/custom_widgets/small_widgets.dart';

import '../../Core/google_ads_services.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  TextEditingController phone1 = TextEditingController();
  TextEditingController phone2 = TextEditingController();
  TextEditingController phone3 = TextEditingController();
  TextEditingController email = TextEditingController();

  String message = '';

  verifyPhoneNumber() async {
    try {
      var response = await http.post(
        //due to security reasons i remove the api link
        Uri.parse('API LINK  HERE'),
        body: {
          'phone1': phone1.text,
          'phone2': phone2.text,
          'phone3': phone3.text,
          'email': email.text,
          'language': 'en-US'
        },
      );
      if (kDebugMode) {
        print(response.body);
      }
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        message = response.body;
        if (kDebugMode) {
          print(jsonData);
        }
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  BannerAd? _bannerAd;

  Future<InitializationStatus> initGoogleMobileAds() {
    return MobileAds.instance.initialize();
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBox20,
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                  ],
                ),
                sizedBox20,
                _bannerAd != null
                    ? Center(
                        child: GestureDetector(
                          onTap: onAdClicked,
                          child: SizedBox(
                            width: _bannerAd!.size.width.toDouble(),
                            height: _bannerAd!.size.height.toDouble(),
                            child: AdWidget(ad: _bannerAd!),
                          ),
                        ),
                      )
                    : const Text('Ads Here'),
                sizedBox20,
                const Text(
                  'You can verify if and when your phone number was register',
                  style: TextStyle(fontSize: 18),
                ),
                sizedBox10,
                const Text(
                  'Following are the verification steps',
                  style: TextStyle(fontSize: 18),
                ),
                sizedBox20,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '1. ',
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        'Enter up the three phone numbers and your email address. click submit',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
                sizedBox20,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '2. ',
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        'Check whether the information is correct',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
                sizedBox20,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '3.',
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        'Receive an email with the verification information',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
                sizedBox20,
                const Text(
                  'Step 1 of 3',
                  style: TextStyle(
                      fontSize: 25,
                      color: gPrimaryColor,
                      fontWeight: FontWeight.bold),
                ),
                sizedBox20,
                const Text(
                  'Phone number 1',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                sizedBox10,
                CustomTextField(
                    controller: phone1,
                    hintText: 'Enter only numbers e.g 2037278373833'),
                sizedBox20,
                const Text(
                  'Phone number 2 (Optional)',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                sizedBox10,
                CustomTextField(
                    controller: phone2,
                    hintText: 'Enter only numbers e.g 2037278373833'),
                sizedBox20,
                const Text(
                  'Phone number 3 (Optional)',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                sizedBox10,
                CustomTextField(
                    controller: phone3,
                    hintText: 'Enter only numbers e.g 2037278373833'),
                sizedBox20,
                const Text(
                  'Email Address',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                sizedBox10,
                CustomTextField(controller: email, hintText: 'Email'),
                sizedBox10,
                CustomElevatedButton(
                    name: 'Submit',
                    onTap: () {
                      verifyPhoneNumber();
                      FirebaseAnalytics.instance.logEvent(
                          name: 'Registration submit',
                          parameters: {'button_id': 'submit'});
                    },
                    background: gPrimaryColor),
                sizedBox10,
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                          style: TextStyle(color: gBlack, fontSize: 18),
                          text:
                              'Your email address MUST be correct to process your verification. lran why your'),
                      TextSpan(
                          style: const TextStyle(color: gBlue, fontSize: 18),
                          text: ' email address ',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('Terms of Service"');
                            }),
                      const TextSpan(
                          style: TextStyle(color: gBlack, fontSize: 18),
                          text:
                              'is required. If you do not receive the verification email within a'
                              ' few minutes , please check your spam filter or junk email folder'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
