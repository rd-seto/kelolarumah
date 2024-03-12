import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/data/model/fcm_model/fcm_data_model.dart';
import 'package:landlord/data/model/user_model.dart';
import 'package:landlord/data/provider/add_emergency_contact_provider.dart';
import 'package:landlord/data/provider/add_property_provider.dart';
import 'package:landlord/data/provider/auth_provider.dart';
import 'package:landlord/data/provider/bottom_nav_provider.dart';
import 'package:landlord/data/provider/cash_management_provider.dart';
import 'package:landlord/data/provider/dashboard_provider.dart';
import 'package:landlord/data/provider/document_provider.dart';
import 'package:landlord/data/provider/notification_provider.dart';
import 'package:landlord/data/provider/profile_details_provider.dart';
import 'package:landlord/data/provider/property_details_edit_provider.dart';
import 'package:landlord/data/provider/property_provider.dart';
import 'package:landlord/data/provider/tenant_edit_provider.dart';
import 'package:landlord/data/provider/tenant_provider.dart';
import 'package:landlord/pages/auth/splash/splash_screen.dart';
import 'package:landlord/utils/notification_service.dart';
import 'package:landlord/utils/shared_preferences.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'data/provider/add_transaction_provider.dart';
import 'data/provider/transaction_list_provider.dart';
import 'data/provider/update_profile_provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  ///initializeFirebaseAtStatingPoint
  await Firebase.initializeApp();

  getDeviceId();

  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>(userBoxName);

  ///top-level function
  ///to handle background messaging
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('bn', 'BN'),
        Locale('ar', 'AR'),
        Locale('es', 'ES'),
        Locale('en', 'IN'),
      ],
      path: 'assets/translations',
      saveLocale: true,
      // assetLoader: CsvAssetLoader(),
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp()));
}

Future<void> getDeviceId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    final result =
        '${iosDeviceInfo.name}-${iosDeviceInfo.model}-${iosDeviceInfo.identifierForVendor}';
    SPUtill.setValue(SPUtill.keyIosDeviceToken, result);
    // return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else {
    final androidDeviceInfo = await deviceInfo.androidInfo;
    final result =
        '${androidDeviceInfo.brand}-${androidDeviceInfo.device}-${androidDeviceInfo.id}';
    SPUtill.setValue(SPUtill.keyAndroidDeviceToken, result);
    // final map = androidDeviceInfo.toMap();
    // print('Device Map: $map');
    // return androidDeviceInfo.androidId; // unique ID on Android
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthProvider>(create: (context) => AuthProvider()),
        ChangeNotifierProvider<UpdateProfileProvider>(
            create: (context) => UpdateProfileProvider()),
        ChangeNotifierProvider<LocalAutProvider>(
            create: (context) => LocalAutProvider()),
        ChangeNotifierProvider<DashBoardProvider>(
            create: (context) => DashBoardProvider(context)),
        ChangeNotifierProvider<BottomNavProvider>(
            create: (context) => BottomNavProvider(context)),
        ChangeNotifierProvider<PropertyProvider>(
            create: (context) => PropertyProvider(context)),
        ChangeNotifierProvider<TransactionListProvider>(
            create: (context) => TransactionListProvider(context)),
        ChangeNotifierProvider<AddTransactionProvider>(
            create: (context) => AddTransactionProvider(context)),
        ChangeNotifierProvider<AddEmergencyContractProvider>(
            create: (context) => AddEmergencyContractProvider(context)),
        ChangeNotifierProvider<CashManagementListProvider>(
            create: (context) => CashManagementListProvider(context)),
        ChangeNotifierProvider<NotificationProvider>(
            create: (context) => NotificationProvider(context)),
        ChangeNotifierProvider<TenantProvider>(
            create: (context) => TenantProvider(context)),
        ChangeNotifierProvider<AddPropertyProvider>(
            create: (context) => AddPropertyProvider(context)),
        ChangeNotifierProvider<TenantProvider>(
            create: (context) => TenantProvider(context)),
        ChangeNotifierProvider<ProfileDetailsProvider>(
            create: (context) => ProfileDetailsProvider(context)),
        ChangeNotifierProvider<PropertyDetailsEditProvider>(
            create: (context) => PropertyDetailsEditProvider(context)),
        ChangeNotifierProvider<TenantEditProvider>(
            create: (context) => TenantEditProvider()),
        ChangeNotifierProvider<DocumentProvider>(
            create: (context) => DocumentProvider(context))
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 813),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          theme: ThemeData(
            textTheme: GoogleFonts.manropeTextTheme(
              Theme.of(context).textTheme,
            ),
            primarySwatch: Colors.deepPurple,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                  const TextStyle(color: Colors.white)),
              backgroundColor: MaterialStateProperty.all(
                AppColors.colorPrimary,
              ),
            )),
          ),
          home: const SplashScreen(),
          builder: (ctx, child) {
            child = FlutterEasyLoading(child: child);
            return child;
          },
        ),
      ),
    );
  }
}

///Handle background messaging service
///It must not be an anonymous function.
/// It must be a top-level function (e.g. not a class method which requires initialization).
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.notification?.title == null) {
    final encodedString = json.encode(message.data);

    ///data class which will parse convert message to model data

    FCMDataModel notification = FCMDataModel.fromJson(message.data);

    if (notification.image == null) {
      await notificationPlugin.showNotification(
          title: notification.title ?? message.notification?.title,
          body: notification.body ?? message.notification?.body,
          payload: encodedString);
    } else {
      await notificationPlugin.showNotificationWithAttachment(
          title: notification.title ?? message.notification?.title,
          body: notification.body ?? message.notification?.body,
          image: notification.image,
          payload: encodedString);
    }
  }
}
