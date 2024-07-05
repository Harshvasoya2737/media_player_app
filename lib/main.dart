import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_player_app/provider/music_provider.dart';
import 'package:media_player_app/view/home_page.dart';
import 'package:media_player_app/view/login_page.dart';
import 'package:media_player_app/view/song/music_list.dart';
import 'package:media_player_app/view/song/music_page.dart';
import 'package:media_player_app/view/song2/music_list_2.dart';
import 'package:media_player_app/view/song2/music_list_3.dart';
import 'package:media_player_app/view/song2/music_list_4.dart';
import 'package:media_player_app/view/song2/music_list_5.dart';
import 'package:media_player_app/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MusicPlayerProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "splash_screen",
        routes: {
          "splash_screen": (context) => Splashscreen(),
          "login": (context) => Loginpage(),
          "home": (context) => Homepage(),
          "music":(context) => music_show(),
          "music_play":(context) => MusicPlayerScreen(),
          "music_2":(context) => music_show_2(),
          "music_3":(context) => music_show_3(),
          "music_4":(context) => music_show_4(),
          "music_5":(context) => music_show_5(),

        },
      ),
    );
  }
}
