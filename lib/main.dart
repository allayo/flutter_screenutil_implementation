import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sca_ui_imp/shared/navigation/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(394, 854),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child){
      return MaterialApp(
        navigatorKey: AppRouter.navKey,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(scrolledUnderElevation: 0),
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        title: 'Flutter Demo',
        initialRoute: AppRouterString.onboardingScreen,
      );}
    );
  }
}
