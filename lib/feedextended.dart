 import 'package:flutter/material.dart';

class Song {
  final String imageUrl;
  final String title;
  final String description;

  Song({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

class FeedScreen extends StatelessWidget {
  final List<Song> songs = [
    Song(
      imageUrl: 'assets/images/music_suggestion_3.jpg',
      title: 'Song Title 1',
      description: 'Song Description 1',
    ),
    Song(
      imageUrl: 'assets/images/music_suggestion_2.jpg',
      title: 'Song Title 2',
      description: 'Song Description 2',
    ),
    Song(
      imageUrl: 'assets/images/music_suggestion_4.jpg',
      title: 'Song Title 3',
      description: 'Song Description 3',
    ),
    // Add more songs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
 
          return Container(
             
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                ClipRRect(
                 
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    song.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  song.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  song.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
