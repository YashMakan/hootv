import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hootv/app/shared/config/assets/asset.dart';
import 'package:hootv/app/shared/config/constants/strings.dart';
import 'package:hootv/app/shared/config/routes/routes.dart';
import 'package:hootv/app/shared/config/theme/theme.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controller = TextEditingController();
  bool _isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String selectedIsoCode = 'ZA';
  String selectedDialCode = '+27';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.images.splashBg), fit: BoxFit.fill)),
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                          width: 50.w,
                          child: Placeholder(fallbackHeight: 50.w)),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        context.strings.loginPageHeading,
                        style: context.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20),
                        child: Text(
                          context.strings.loginPageSubHeading,
                          textAlign: TextAlign.center,
                          style: context.bodySmall
                              ?.copyWith(color: Colors.white54),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.13)),
                        ),
                        child: Stack(
                          children: [
                            Theme(
                              data: ThemeData(
                                  colorScheme: ColorScheme.fromSeed(
                                      seedColor: Colors.purple)),
                              child: InternationalPhoneNumberInput(
                                onInputChanged: (PhoneNumber number) {
                                  if (number.dialCode != null) {
                                    selectedDialCode = number.dialCode!;
                                  }
                                  if (number.isoCode != null) {
                                    selectedIsoCode = number.isoCode!;
                                  }
                                },
                                onInputValidated: (bool value) {
                                  debugPrint(value.toString());
                                },
                                selectorConfig: const SelectorConfig(
                                  selectorType: PhoneInputSelectorType.DIALOG,
                                ),
                                ignoreBlank: false,
                                initialValue:
                                    PhoneNumber(isoCode: selectedIsoCode),
                                autoValidateMode: AutovalidateMode.disabled,
                                selectorTextStyle:
                                    const TextStyle(color: Colors.black),
                                textFieldController: controller,
                                formatInput: false,
                                maxLength: 10,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                                cursorColor: Colors.black,
                                inputDecoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      bottom: 15, left: 0),
                                  border: InputBorder.none,
                                  hintText: context
                                      .strings.loginPageTextFieldHintText,
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 16),
                                ),
                                onSaved: (PhoneNumber number) {
                                  debugPrint('On Saved: $number');
                                },
                              ),
                            ),
                            Positioned(
                              left: 90,
                              top: 8,
                              bottom: 8,
                              child: Container(
                                height: 40,
                                width: 1,
                                color: Colors.black.withOpacity(0.13),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isLoading = true;
                  });

                  Future.delayed(const Duration(seconds: 2), () {
                    String phoneNumber = "$selectedDialCode${controller.text}";
                    Navigator.pushNamed(context, AppRoutes.otpScreen,
                        arguments: phoneNumber);
                    setState(() {
                      _isLoading = false;
                    });
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(100.w, 55),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                ),
                child: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          color: Colors.black,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        context.strings.loginPageButton,
                        style: const TextStyle(color: Colors.white),
                      ),
              ),
              const SizedBox(height: 16),
              Text(
                "OR",
                style: context.bodyMedium?.copyWith(color: Colors.white38),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(12),
                        backgroundColor: Colors.black),
                    child: Center(
                      child: Image.asset(
                        Assets.icons.apple,
                        width: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        final GoogleSignInAccount? googleSignInAccount =
                            await googleSignIn.signIn();
                        final GoogleSignInAuthentication?
                            googleSignInAuthentication =
                            await googleSignInAccount?.authentication;

                        final AuthCredential credential =
                            GoogleAuthProvider.credential(
                          accessToken: googleSignInAuthentication?.accessToken,
                          idToken: googleSignInAuthentication?.idToken,
                        );

                        final UserCredential authResult =
                            await _auth.signInWithCredential(credential);
                        final User? user = authResult.user;

                        debugPrint("User signed in: ${user?.displayName}");
                        Navigator.pushNamed(context, AppRoutes.mainScreen);
                      } catch (error) {
                        debugPrint("Error during Google Sign-In: $error");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(12),
                        backgroundColor: Colors.white),
                    child: Center(
                      child: Image.asset(
                        Assets.icons.google,
                        width: 30,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final LoginResult result =
                          await FacebookAuth.instance.login();

                      if (result.status == LoginStatus.success) {
                        final AuthCredential credential =
                            FacebookAuthProvider.credential(
                                result.accessToken!.token);

                        try {
                          UserCredential authResult =
                              await _auth.signInWithCredential(credential);
                          final User? user = authResult.user;

                          debugPrint("User signed in: ${user?.displayName}");
                          Navigator.pushNamed(context, AppRoutes.mainScreen);
                        } catch (e) {
                          debugPrint('Error signing in with Facebook: $e');
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(6),
                        backgroundColor: const Color(0xFF1877F2)),
                    child: Center(
                      child: Image.asset(
                        Assets.icons.facebook,
                        width: 36,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // IconButton(
                  //     onPressed: () {}, icon: Image.asset(Assets.icons.google)),
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: Image.asset(Assets.icons.facebook)),
                ],
              ),
              const SizedBox(
                height: 42,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
