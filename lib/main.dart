import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import './utils/colours.dart';

import './responsive/responsive_layout_screen.dart';
import './responsive/web_screen_layout.dart';
import './responsive/mobile_screen_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Ensures Flutter widgets have been initialised
  if (kIsWeb) {
    // Code
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBuYWBCyLoIykhMvwEViACu706n_MkPkss', 
        appId: '1:979169217305:web:4a0a3db74e4de25d435388', 
        messagingSenderId: '979169217305', 
        projectId: 'instagram-clone-38b55',
        storageBucket: 'instagram-clone-38b55.appspot.com' 
      ),
    );  // Initialises Firebase (Web)
  } else {
    // Code
    await Firebase.initializeApp();  // Initialises Firebase
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor
      ),
      home: const ResponsiveLayout(mobileScreenLayout: MobileScreenLayout(), webScreenLayout: WebScreenLayout(),),
    );
  }
}
