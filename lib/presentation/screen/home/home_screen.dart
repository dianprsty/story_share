import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/model/post.dart';
import '../upload/add_new_post_screen.dart';
import 'widget/post_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Post> posts = [
    Post(
      id: 'story-1',
      name: 'Dimas',
      description: 'Exploring the beauty of nature!',
      photoUrl: 'https://picsum.photos/400/400?random=1',
      avatarUrl: 'https://picsum.photos/50/50?random=1',
      createdAt: '2022-01-08T06:34:18.598Z',
      lat: -10.212,
      lon: -16.002,
    ),
    Post(
      id: 'story-2',
      name: 'Sari',
      description: 'A great day at the beach!',
      photoUrl: 'https://picsum.photos/400/400?random=2',
      avatarUrl: 'https://picsum.photos/50/50?random=2',
      createdAt: '2022-02-10T08:20:15.123Z',
      lat: -7.7956,
      lon: 110.3695,
    ),
    Post(
      id: 'story-3',
      name: 'Rizky',
      description: 'Delicious homemade food!',
      photoUrl: 'https://picsum.photos/400/400?random=3',
      avatarUrl: 'https://picsum.photos/50/50?random=3',
      createdAt: '2022-03-12T10:45:30.456Z',
      lat: -6.2088,
      lon: 106.8456,
    ),
    Post(
      id: 'story-4',
      name: 'Ayu',
      description: 'Sunset at the mountain!',
      photoUrl: 'https://picsum.photos/400/400?random=4',
      avatarUrl: 'https://picsum.photos/50/50?random=4',
      createdAt: '2022-04-15T14:25:10.654Z',
      lat: -8.3405,
      lon: 115.0920,
    ),
  ];

  String timeAgo(String dateTime) {
    final date = DateTime.parse(dateTime);
    return DateFormat('MMM d, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Story Share')),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 480),
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return PostCard(post: posts[index], timeAgo: timeAgo);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewPostScreen()),
          );
        },
        child: Icon(Icons.add_a_photo_outlined),
      ),
    );
  }
}
