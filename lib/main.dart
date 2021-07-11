import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/app/app.router.dart';
import 'package:votex/models/hiveUserDetails_model.dart';
import 'package:votex/providers/current_voting_model_provider.dart';
import 'package:votex/providers/user_details_provider.dart';
import 'package:votex/theme/theme.dart';
import 'package:votex/utils/appsettings.dart';
import 'package:votex/utils/setup_bottom_sheet.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  setupBottomSheetUi();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter<HiveUserDetails>(HiveUserDetailsAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserDetailsProvider>(
            create: (_) => UserDetailsProvider()),
      ],
      child: MaterialApp(
        title: appTitle,
        theme: lightTheme,
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
      ),
    );
  }
}
