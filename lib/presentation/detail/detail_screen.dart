import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/post/post_entity.dart';

class PostDetailScreen extends StatelessWidget {
  final PostEntity post;

  const PostDetailScreen({super.key, required this.post});

  String getFormattedDate(String dateTime) {
    final date = DateTime.parse(dateTime);
    return DateFormat('MMM d, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 300,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.surface.withAlpha(70),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Theme.of(context).colorScheme.onSurface,
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(post.photoUrl ?? '', fit: BoxFit.contain),
                    // const DecoratedBox(
                    //   decoration: BoxDecoration(
                    //     gradient: LinearGradient(
                    //       begin: Alignment.topLeft,
                    //       end: Alignment.bottomRight,
                    //       colors: [Colors.transparent, Colors.black54],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
        
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                constraints: BoxConstraints(maxWidth: 480),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage('https://picsum.photos/50/50?random=1'),
                          radius: 24,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.name ?? '-',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              getFormattedDate(post.createdAt ?? '-'),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
        
                    // Description
                    Text(
                      post.description ?? '-',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(height: 1.4),
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
