import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:padora/ui/auth/provider/api_provider.dart';
import 'package:padora/utils/constants/app_constansts.dart';
import 'package:padora/utils/constants/route_constansts.dart';
import 'package:padora/utils/localization/localization.dart';
import 'package:padora/utils/navigation.dart';
import 'package:provider/provider.dart';

import 'ui/auth/provider/login_provider.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget{


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData themeData;
@override
  void initState() {
  getThemeFromApi().then((themeData){
    LoginProvider(themeData).SetTheme(themeData);
  });

  getThemeFromApia().then((theme){
    LoginProvider(themeData).SetTheme(theme);
    setState(() {
      themeData=theme;
    });
  });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
      builder: (_)=>LoginProvider(themeData),
      child: AppStart()
    );

  }
}


class AppStart extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final Theme = Provider.of<LoginProvider>(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
      ],
      child: MaterialApp(
        title: APP_NAME,
        theme: Theme.getThemeDate(),
        initialRoute: ROUTE_LOGIN,
        onGenerateRoute: NavigationUtils.generateRoute,
        localizationsDelegates: [
          const MyLocalizationsDelegate(),
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''),
          // const Locale('es', ''),
        ],
      ),
    );
  }
}
