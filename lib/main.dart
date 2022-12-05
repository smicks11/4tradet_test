import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_test/shared/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/locator/locator.dart';
import 'core/navigation/router.dart';
import 'core/navigation/routes.dart';
import 'core/service-injector/service_injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    _init();
    // // The preferred screen orientation
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ]).then((_) {});
    super.initState();
  }

  Future<void> _init() async {
    await si.init();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.black,
        systemNavigationBarColor: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(logicalWidth(), logicalHeight()),
        builder: (context, Widget? child) {
          return MultiProvider(
            providers: allProviders,
            child: MaterialApp(
              title: 'Interview Test',
              debugShowCheckedModeBanner: false,
              initialRoute: Routes.loginRoute,
              onGenerateRoute: generateRoute,
              theme: ThemeData(
                fontFamily: 'Mulish',
              ),
            ),
          );
        });
  }
}
