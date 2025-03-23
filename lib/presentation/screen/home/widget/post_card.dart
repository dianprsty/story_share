import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../data/model/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final String Function(String) timeAgo;

  const PostCard({super.key, required this.post, required this.timeAgo});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: CachedNetworkImage(
              imageUrl: post.photoUrl,
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
              placeholder:
                  (context, url) => Center(
                    child: Lottie.asset(
                      'assets/lotties/rocket.json',
                      width: 100,
                      height: 100,
                    ),
                  ),
              errorWidget:
                  (context, url, error) => Image.asset(
                    'assets/images/placeholder.png',
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(post.avatarUrl)),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      timeAgo(post.createdAt),
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(post.description, style: TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
