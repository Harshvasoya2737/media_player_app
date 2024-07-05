import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:video_player/video_player.dart';
import '../../list/musiclist.dart';

class music_show_3 extends StatefulWidget {
  const music_show_3({super.key});

  @override
  State<music_show_3> createState() => _music_show_3State();
}

class _music_show_3State extends State<music_show_3> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.shade900, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          title: Text(
            'Audio & Video',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            AudioPage(),
            VideoPlayerScreen(),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.black,
          child: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.audiotrack, color: Colors.white),
                text: 'Audio',
              ),
              Tab(
                icon: Icon(Icons.video_collection, color: Colors.white),
                text: 'Video',
              ),
            ],
          ),
        ),
      ),
    );

  }
}

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  List<Map<String, dynamic>> foundUser = [];

  final int startIndex = 12;
  final int endIndex = 18;

  @override
  void initState() {
    foundUser = musicList.sublist(startIndex, endIndex);
    super.initState();
  }

  void runFilter(String enteredKey) {
    List<Map<String, dynamic>> results = [];
    if (enteredKey.isEmpty) {
      results = musicList.sublist(startIndex, endIndex);
    } else {
      results = musicList.sublist(startIndex, endIndex).where((element) =>
      element["title"]?.toLowerCase().contains(enteredKey.toLowerCase()) ?? false).toList();
    }
    setState(() {
      foundUser = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    final String? imagePath = args?['imagePath'];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade900, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  children: [
                    SizedBox(width: 15),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Listen The Hit Musics",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  onChanged: (value) {
                    runFilter(value);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white24,
                    hintText: "🔍  Search",
                    hintStyle: TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              CarouselSlider(
                items: List.generate(
                  foundUser.length,
                      (index) {
                    final music = foundUser[index];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        music['img'],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeFactor: 0.3,
                  enlargeCenterPage: true,
                  autoPlayInterval: Duration(seconds: 2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: List.generate(
                    foundUser.length,
                        (index) {
                      final music = foundUser[index];
                      return Card(
                        color: Colors.white12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          leading: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                music['img'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            music['title']!,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            music['artist']!,
                            style: TextStyle(color: Colors.white70),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, "music_play",
                                arguments: music);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController? _controller;
  ChewieController? _chewieController;
  int _currentVideoIndex = 0;

  List<Map<String, String>> videos = [

    {
      "url":
      "https://videos.pexels.com/video-files/4553936/4553936-hd_1920_1080_30fps.mp4",
      "title": "Video 1"
    },

    {
      "url":
      "https://videos.pexels.com/video-files/3890521/3890521-hd_1920_1080_25fps.mp4",
      "title": "Video 2"
    },
    {
      "url":
      "https://videos.pexels.com/video-files/4971196/4971196-sd_640_360_25fps.mp4",
      "title": "Video 3"
    },
    {
      "url":
      "https://videos.pexels.com/video-files/852400/852400-sd_640_360_24fps.mp4",
      "title": "Video 4"
    },
    {
      "url":
      "https://videos.pexels.com/video-files/3890521/3890521-sd_640_360_25fps.mp4",
      "title": "Video 5"
    },
  ];
  @override
  void initState() {
    super.initState();
    // Initialize the first video to play
    playNetworkVideo(videos[_currentVideoIndex]['url']!);
  }

  void playNetworkVideo(String url) {
    _controller?.dispose();
    _controller = VideoPlayerController.network(url)
      ..initialize().then((_) {
        setState(() {
          if (_controller != null) {
            _chewieController = ChewieController(
              videoPlayerController: _controller!,
              autoPlay: true,
              looping: false,
            );
          }
        });
      });
  }

  @override
  void dispose() {
    _controller?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          _chewieController != null &&
              _chewieController!.videoPlayerController.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller!.value.aspectRatio,
            child: Chewie(
              controller: _chewieController!,
            ),
          )
              : Container(
            height: 200,
            color: Colors.black,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    title: Text(
                      videos[index]['title']!,
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      setState(() {
                        _currentVideoIndex = index;
                        playNetworkVideo(videos[index]['url']!);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
