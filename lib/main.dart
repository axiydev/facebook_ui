import 'package:device_preview/device_preview.dart';
import 'package:facebook_app/page/facebook/facebook_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) {
        return const MyApp();
      }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => MaterialApp(
        title: 'Flutter Demo',
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FacebookView(),
      ),
    );
  }
}
