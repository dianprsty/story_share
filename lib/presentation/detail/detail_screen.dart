import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/constant/general_state.dart';
import '../../core/extension/build_context_extension.dart';
import '../../core/config/go_router_config.dart';
import '../../core/utils/date_utils.dart';
import '../../domain/entities/post/post_entity.dart';
import '../shared/widget/custom_button.dart';
import '../shared/widget/wavy_loading_indicator.dart';

import 'bloc/detail_bloc.dart';

class PostDetailScreen extends StatefulWidget {
  final String id;

  const PostDetailScreen({super.key, required this.id});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DetailBloc>().add(DetailEvent.getPostById(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if (state.status == GeneralState.loading) {
            return const Center(child: WavyLoadingIndicator());
          }

          if (state.status == GeneralState.error) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text(state.message)),
                SizedBox(
                  width: 200,
                  child: CustomButton(
                    text: 'Retry',
                    onPressed: () {
                      context.read<DetailBloc>().add(
                        DetailEvent.getPostById(widget.id),
                      );
                    },
                    buttonType: ButtonType.outline,
                  ),
                ),
              ],
            );
          }

          if (state.status == GeneralState.success && state.post == null) {
            return Center(child: Text(context.l10n.storyNotFound));
          }

          if (state.status == GeneralState.success && state.post != null) {
            PostEntity post = state.post!;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 300,
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      child: IconButton(
                        icon: const Icon(Icons.chevron_left),
                        color: Theme.of(context).colorScheme.onSurface,
                        onPressed: () {
                          context.goNamed(AppRoute.home.name);
                        },
                      ),
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          post.photoUrl ?? '',
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    constraints: BoxConstraints(maxWidth: 480),
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16,
                      children: [
                        Row(
                          spacing: 16,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://picsum.photos/50/50?random=1',
                              ),
                              radius: 24,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post.name ?? '-',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  timeAgoFromString(
                                    post.createdAt ?? '-',
                                    context,
                                  ),
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                        if (post.lat != null && post.lon != null)
                          CustomButton(
                            text: context.l10n.seeOnMap,
                            visualDensity: VisualDensity.compact,
                            leadingIcon: Icon(Icons.map_outlined),
                            onPressed: () {
                              context.pushNamed(
                                AppRoute.mapDetail.name,
                                queryParameters: {
                                  'id': post.id,
                                  'lat': post.lat.toString(),
                                  'lng': post.lon.toString(),
                                },
                              );
                            },
                            buttonType: ButtonType.outline,
                          ),

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
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
