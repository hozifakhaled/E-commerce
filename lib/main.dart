import 'package:device_preview/device_preview.dart';
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/helper/service_lecator.dart';
import 'package:ecommercefirebase/features/notifcation/data/datasource/massage_config.dart';
import 'package:ecommercefirebase/core/routeing/app_routing.dart';
import 'package:ecommercefirebase/core/stripe/payment_key.dart';
import 'package:ecommercefirebase/features/notifcation/data/model/notification_model.dart';
import 'package:ecommercefirebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey = PaymentKeys.publisherKey;
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  Hive.registerAdapter(NotificationModelAdapter());
  var box = await Hive.openBox<NotificationModel>('box');
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();

  await Supabase.initialize(
    url: 'https://qymunmwtahpiautlqlaw.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF5bXVubXd0YWhwaWF1dGxxbGF3Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczODc2MTc0NywiZXhwIjoyMDU0MzM3NzQ3fQ.rIPHvAKGCsnQGk2noJglUID6gQ2l2E834Ni4CFWLXqw',
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationService.initialize();
  setup();

  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
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
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
