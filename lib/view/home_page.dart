import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:media_player_app/list/imagemap.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  color: Colors.black,
                  child: Opacity(
                    opacity: 0.7,
                    child: Image.asset(
                      "assets/images/mic.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 62,
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                        child: Center(
                            child: Text(
                          "Music".toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                        child: Center(
                            child: Text(
                          "Podcasts".toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      SizedBox(
                        width: 62,
                      ),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 250, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "STATION",
                        style: TextStyle(color: Colors.white54),
                      ),
                      Text(
                        "My Musictrack",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                      Row(
                        children: [
                          Text(
                            "Based on OneRepublic, Bensone Boone,\nLil Nas X and more...",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffFE6363),
                            ),
                            child: Icon(
                              Icons.play_arrow_rounded,
                              size: 50,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 40),
              child: Row(
                children: [
                  Text(
                    "All-Accesss ",
                    style: TextStyle(
                        color: Color(0xff65CED8),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Playlists",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                "Pick and play any song",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 17,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "music");
                        },
                        child: Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white38,
                          ),
                          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEaO9oNwP0hT6rCxrP1_xtB2Q_ORBTsB3cmw&s"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "music_2");
                        },
                        child: Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white38,
                          ),
                          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrj4nyWk0lgeBA94AVtzYvTkfVSCN_yi4C_A&s",fit: BoxFit.cover,),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "music_3");
                        },
                        child: Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white38,
                          ),
                          child: Image.network("https://img.wynk.in/unsafe/200x200/filters:no_upscale():strip_exif():format(jpg)/http://s3.ap-south-1.amazonaws.com/discovery-prod-zion/zion/1696452596410-B_Praak.png"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "music_3");
                        },
                        child: Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white38,
                          ),
                          child: Image.network("https://e0.pxfuel.com/wallpapers/413/64/desktop-wallpaper-hardy-sandhu.jpg",fit: BoxFit.cover,),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "music_4");
                        },
                        child: Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white38,
                          ),
                          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSezuWWE7EuQHUQuUMvuiW2IFQ-JyjYgbhc2w&s",fit: BoxFit.cover,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
