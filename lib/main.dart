import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/data/model/user_model.dart';
import 'package:landlord/data/provider/add_emergency_contact_provider.dart';
import 'package:landlord/data/provider/add_property_provider.dart';
import 'package:landlord/data/provider/auth_provider.dart';
import 'package:landlord/data/provider/cash_management_provider.dart';
import 'package:landlord/data/provider/dashboard_provider.dart';
import 'package:landlord/data/provider/document_provider.dart';
import 'package:landlord/data/provider/notification_provider.dart';
import 'package:landlord/data/provider/profile_details_provider.dart';
import 'package:landlord/data/provider/property_provider.dart';
import 'package:landlord/data/provider/tenant_edit_provider.dart';
import 'package:landlord/data/provider/tenant_provider.dart';
import 'package:landlord/pages/auth/splash/splash_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'data/provider/add_transaction_provider.dart';
import 'data/provider/transaction_list_provider.dart';
import 'data/provider/update_profile_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>(userBoxName);

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('bn', 'BN'),
        Locale('ar', 'AR')
      ],
      path: 'assets/translations',
      saveLocale: true,
      // assetLoader: CsvAssetLoader(),
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp()));
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
