import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/di/injection_container.dart';
import 'package:flutter_steps_tracker/features/intro/presentation/manager/auth_status/auth_status_cubit.dart';
import 'package:flutter_steps_tracker/utilities/locale/cubit/locale_cubit.dart';
import 'package:flutter_steps_tracker/utilities/locale/theme_data.dart';
import 'package:flutter_steps_tracker/utilities/routes/router.dart';
import 'package:flutter_steps_tracker/utilities/routes/routes.dart';

// TODO: It's not good to do many workarounds as I did in this project
// but I had to do that because currently, I don't have server-side service

Future<void> main() async {
  await _initialize();
  runApp(const MyApp());
}

Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await configure();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocaleCubit>(
          lazy: false,
          create: (context) {
            final cubit = LocaleCubit();
            cubit.getCurrentLocale();
            return cubit;
          },
        ),
        BlocProvider<AuthStatusCubit>(
          lazy: false,
          create: (context) {
            final cubit = getIt<AuthStatusCubit>();
            cubit.checkAuthStatus();
            return cubit;
          },
        ),
      ],
      child: GestureDetector(
        onTap: () {
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        },
        child: Builder(builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Steps Tracker',
            theme: themeData(context),
            onGenerateRoute: onGenerate,
            initialRoute: AppRoutes.landingPageRoute,
          );
        }),
      ),
    );
  }
}
