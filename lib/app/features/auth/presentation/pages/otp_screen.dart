// import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:hootv/app/shared/config/assets/asset.dart';
// import 'package:hootv/app/shared/config/constants/strings.dart';
// import 'package:hootv/app/shared/config/routes/routes.dart';
// import 'package:hootv/app/shared/config/theme/theme.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// class OtpScreen extends StatefulWidget {
//   const OtpScreen({Key? key}) : super(key: key);
//
//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }
//
// class _OtpScreenState extends State<OtpScreen> {
//   final TextEditingController controller = TextEditingController();
//   bool _isLoading = false;
//   String? phoneNumber;
//
//   String get arguments =>
//       (ModalRoute.of(context)?.settings.arguments as String);
//
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       phoneNumber = arguments;
//       setState(() {});
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: FirebasePhoneAuthHandler(
//             phoneNumber: phoneNumber ?? arguments,
//             onCodeSent: () {
//               debugPrint("code sent!");
//             },
//             onLoginFailed: (error, _) {
//               debugPrint(error.message);
//             },
//             onLoginSuccess: (user, _) {
//               Navigator.pushNamed(context, AppRoutes.mainScreen);
//               setState(() {
//                 _isLoading = false;
//               });
//             },
//             builder: (context, controller) {
//               return Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage(Assets.images.splashBg),
//                       fit: BoxFit.fill),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height,
//                     padding: const EdgeInsets.symmetric(horizontal: 22),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: Center(
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 SizedBox(
//                                     width: 50.w,
//                                     child: Placeholder(fallbackHeight: 50.w)),
//                                 const SizedBox(
//                                   height: 40,
//                                 ),
//                                 Text(
//                                   context.strings.otpPageHeading,
//                                   style: context.headlineMedium?.copyWith(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       vertical: 15.0, horizontal: 20),
//                                   child: Text(
//                                     context.strings.otpPageSubheading(""),
//                                     textAlign: TextAlign.center,
//                                     style: context.bodySmall
//                                         ?.copyWith(color: Colors.white54),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 30,
//                                 ),
//                                 OtpTextField(
//                                   numberOfFields: 6,
//                                   borderColor: const Color(0xFF512DA8),
//                                   showFieldAsBox: true,
//                                   enabledBorderColor: Colors.white,
//                                   focusedBorderColor: Colors.white,
//                                   textStyle:
//                                       const TextStyle(color: Colors.white),
//                                   cursorColor: Colors.white,
//                                   onCodeChanged: (String code) {},
//                                   onSubmit: (String verificationCode) {
//                                     setState(() {
//                                       _isLoading = true;
//                                     });
//                                     controller.verifyOtp(verificationCode);
//                                   }, // end onSubmit
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             setState(() {
//                               _isLoading = true;
//                             });
//
//                             Future.delayed(const Duration(seconds: 2), () {
//                               setState(() {
//                                 _isLoading = false;
//                               });
//                             });
//                           },
//                           style: ElevatedButton.styleFrom(
//                             fixedSize: Size(100.w, 55),
//                             backgroundColor: Colors.black,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(5)),
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 15, horizontal: 30),
//                           ),
//                           child: _isLoading
//                               ? const SizedBox(
//                                   width: 20,
//                                   height: 20,
//                                   child: CircularProgressIndicator(
//                                     backgroundColor: Colors.white,
//                                     color: Colors.black,
//                                     strokeWidth: 2,
//                                   ),
//                                 )
//                               : Text(
//                                   context.strings.otpPageButton,
//                                   style: const TextStyle(color: Colors.white),
//                                 ),
//                         ),
//                         const SizedBox(
//                           height: 42,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             }));
//   }
// }
