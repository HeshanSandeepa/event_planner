import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:event_planner/bloc_provider.dart';
import 'package:event_planner/home_page.dart';
import 'package:event_planner/src/core/router/router.dart';
import 'package:event_planner/src/core/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:event_planner/src/features/auth/presentation/welcome_page.dart';
import 'package:event_planner/src/features/auth/presentation/bloc/authenticate_bloc.dart';
import 'package:event_planner/src/features/auth/presentation/login_page.dart';

import 'firebase_options.dart';
import 'locator.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: createBlocProviders(context),
      child: MaterialApp(
        title: 'Flutter Firebase Auth Clean Architecture',
        debugShowCheckedModeBanner: false,
        theme: EventTheme.getTheme(context),
        onGenerateRoute: AppRouter.generateRoute,
        home: BlocBuilder<AuthenticateBloc, AuthenticateState>(
          builder: (context, state) {
            if (state is InitialAuthenticated) {
              return WelcomePage();
            } else if (state is Authenticated) {
              return HomePage();
            } else {
              return LoginPage();
            }
          },
        ),
      ),
    );
  }
}
