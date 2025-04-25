import 'package:event_planner/src/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:event_planner/bloc_provider.dart';
import 'package:event_planner/src/core/router/router.dart';
import 'package:event_planner/src/core/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:event_planner/src/shared/presentation/splash_page.dart';

import 'firebase_options.dart';
import 'locator.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const EventPlannerApp());
}

class EventPlannerApp extends StatelessWidget {
  const EventPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: createBlocProviders(context),
      child: MaterialApp(
        title: Strings.title,
        debugShowCheckedModeBanner: false,
        theme: EventTheme.getTheme(context),
        onGenerateRoute: AppRouter.generateRoute,
        home: const SplashPage(),
      ),
    );
  }
}
