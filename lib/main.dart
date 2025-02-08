import 'package:device_preview/device_preview.dart';
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/helper/service_lecator.dart';
import 'package:ecommercefirebase/core/routeing/app_routing.dart';
import 'package:ecommercefirebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: 'https://khpuekxzwzmtudzejesy.supabase.co',
    anonKey: dotenv.env['SOPABASE_API_KEY'] ?? '',
       );
  CacheHelper().init();

//WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  runApp(DevicePreview(enabled:true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => SafeArea(
        child: MaterialApp.router(
          // ignore: deprecated_member_use
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          locale: DevicePreview.locale(context),
          title: 'ecommerce',
          theme: ThemeData(),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouting.router,
        ),
      ),
    );
  }
}
