
import 'package:bmi/provider/select_rice_type_provider.dart';
import 'package:bmi/screen/login/login.dart';
import 'package:bmi/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async{
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider<SelectRiceTypeProvider>(
            create: (_) => SelectRiceTypeProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

