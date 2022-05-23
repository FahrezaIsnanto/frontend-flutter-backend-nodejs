import 'package:flutter/material.dart';
import 'package:myown/pages/splash_page.dart';
import 'package:myown/pages/user_add_page.dart';
import 'package:myown/pages/user_page.dart';
import 'package:myown/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>UserProvider())
      ],
      // ignore: prefer_const_constructors
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // ignore: prefer_const_constructors
        routes: {
          '/': (context)=>const SplashPage(),
          '/home': (context)=>const UserPage(),
          '/user_add': (context)=>const UserAddPage(),
        },
      ),
      );
  }
}
