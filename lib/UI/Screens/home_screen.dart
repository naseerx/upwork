import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:upwork/UI/Screens/register_screen.dart';
import 'package:upwork/UI/Screens/verify_screen.dart';
import 'package:upwork/UI/Utils/app_utils.dart';
import 'package:upwork/UI/custom_widgets/custom_button.dart';
import 'package:upwork/UI/custom_widgets/small_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.red,
              height: 100,
              width: size.width,
              child: const Text(appTitle),
            ),
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
                          name: 'Resources', onTap: () {}, background: gRed)),
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
