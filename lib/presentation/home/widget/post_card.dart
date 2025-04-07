import 'dart:math';

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../core/route/go_router_config.dart';
import '../../../core/utils/date_utils.dart';
import '../../../domain/entities/post/post_entity.dart';

class PostCard extends StatelessWidget {
  final PostEntity post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => context.pushNamed(
            AppRoute.detailStory.name,
            pathParameters: {'id': post.id ?? ''},
          ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        color: Theme.of(context).cardColor,

        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8),
                bottom: Radius.circular(8),
              ),
              child: CachedNetworkImage(
                imageUrl: post.photoUrl ?? '',
                width: double.infinity,

                height: 200,

                fit: BoxFit.cover,
                placeholder:
                    (context, url) => Center(
                      child: Lottie.asset(
                        'assets/lotties/rocket.json',
                        width: 32,
                        height: 32,
                      ),
                    ),
                errorWidget:
                    (context, url, error) => Image.asset(
                      'assets/images/placeholder.png',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/50/50?random=${Random().nextInt(100)}',
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.name ?? '-',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        timeAgoFromString(post.createdAt ?? '', context),
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: Text(
                post.description ?? '-',
                style: TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
