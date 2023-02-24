import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_overlay_app/over_lay_page.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //if(!kIsWeb) {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //}

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OverLayPage()
    );
  }
}