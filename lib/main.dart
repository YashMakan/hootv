import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/shared/config/theme/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'app/shared/config/constants/constants.dart';
import 'app/shared/config/routes/routes.dart';
import 'app/shared/core/firebase_options.dart';
import 'app/shared/core/inject_dependency/dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies();
  runApp(DevicePreview(
    enabled: false,
    defaultDevice: DeviceInfo.genericPhone(
        platform: TargetPlatform.iOS,
        id: 'iphone-13',
        name: 'iPhone 13',
        screenSize: Size(390.0, 844.0)),
    builder: (context) => MyApp(), // Wrap your app
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screen) {
      return FirebasePhoneAuthProvider(
        child: MaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          darkTheme: ThemeData.dark(),
          title: Constants.appName,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme(),
          routes: NavigationManager.appRoutes,
        ),
      );
    });
  }
}
