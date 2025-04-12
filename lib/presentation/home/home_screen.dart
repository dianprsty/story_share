import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/flavor_config.dart';
import '../../core/config/go_router_config.dart';
import '../../core/constant/general_state.dart';
import '../../core/extension/build_context_extension.dart';
import '../../domain/entities/post/post_entity.dart';
import '../../domain/entities/query_param/query_param.dart';
import '../auth/bloc/auth_bloc.dart';
import '../shared/bloc/theme/theme_bloc.dart';
import '../shared/widget/custom_button.dart';
import '../shared/widget/flag_icon_widget.dart';
import '../shared/widget/wavy_loading_indicator.dart';

import 'bloc/post_list_bloc.dart';
import 'widget/post_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    context.read<PostListBloc>().add(PostListEvent.getPosts(QueryParam()));

    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void _scrollListener() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent) {
      final postListState = context.read<PostListBloc>().state;
      if (postListState.status.isLoading) return;
      print('ruuun');
      final queryParam = postListState.queryParams;
      bool isMaxPage = postListState.isMaxPage;
      int incrementPage = isMaxPage ? 0 : 1;
      context.read<PostListBloc>().add(
        PostListEvent.getPosts(
          queryParam.copyWith(page: queryParam.page + incrementPage),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FlavorConfig.instance.values.titleApp),
        actions: [
          FlagIconWidget(),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              bool isDarkMode = state.themeMode == ThemeMode.dark;
              return IconButton(
                icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
                onPressed: () {
                  context.read<ThemeBloc>().add(ThemeEvent.toggleTheme());
                },
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: Text(context.l10n.logout),
                      content: Text(context.l10n.logoutConfirmation),
                      actions: [
                        TextButton(
                          child: Text(context.l10n.cancel),
                          onPressed: () {
                            context.pop();
                          },
                        ),
                        TextButton(
                          child: Text(context.l10n.logout),
                          onPressed: () async {
                            context.read<AuthBloc>().add(AuthEvent.logout());
                            await Future.delayed(Duration(milliseconds: 500));
                            if (context.mounted) {
                              context.goNamed(AppRoute.login.name);
                            }
                          },
                        ),
                      ],
                    ),
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1));
          if (context.mounted) {
            context.read<PostListBloc>().add(
              PostListEvent.getPosts(QueryParam()),
            );
          }
        },
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 480),
            child: BlocConsumer<PostListBloc, PostListState>(
              listener: (context, state) {
                if (state.status == GeneralState.error) {
                  context.showSnackBar(state.message);
                }

                if (state.status == GeneralState.success && state.isMaxPage) {
                  context.showSnackBar('No more data');
                }
              },
              builder: (context, state) {
                final isEmpty = state.posts.isEmpty;
                bool isFirstPage = state.queryParams.page == 1;
                return switch (state.status) {
                  GeneralState.loading || GeneralState.success =>
                    isEmpty && state.status.isSuccess
                        ? Center(child: Text(context.l10n.emptyStories))
                        : isFirstPage && state.status.isLoading
                        ? Center(child: WavyLoadingIndicator())
                        : Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                controller: scrollController,
                                itemCount: state.posts.length,
                                itemBuilder: (context, index) {
                                  PostEntity post = state.posts[index];
                                  return Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: PostCard(post: post),
                                  );
                                },
                                separatorBuilder:
                                    (context, index) => SizedBox(height: 10),
                              ),
                            ),
                            if (state.status.isLoading && !isFirstPage)
                              Center(child: WavyLoadingIndicator()),
                          ],
                        ),
                  GeneralState.error => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 16,
                      children: [
                        Text(
                          state.message.isEmpty
                              ? 'Stories not found'
                              : state.message,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(
                          width: 200,
                          child: CustomButton(
                            text: 'Retry',
                            onPressed: () {
                              context.read<PostListBloc>().add(
                                PostListEvent.getPosts(QueryParam()),
                              );
                            },
                            buttonType: ButtonType.outline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _ => SizedBox.shrink(),
                };
              },
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 8,
        children: [
          if (context.watch<PostListBloc>().state.posts.length > 10)
            FloatingActionButton(
              shape: CircleBorder(),
              mini: true,
              onPressed: () {
                scrollController.animateTo(
                  0,
                  duration: Durations.long1,
                  curve: Curves.easeInOut,
                );
              },
              heroTag: 'scrollToTop',
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: Icon(
                Icons.arrow_upward,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          FloatingActionButton(
            onPressed: () {
              context.goNamed(AppRoute.addStory.name);
            },
            heroTag: 'addStory',
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(
              Icons.add_a_photo_outlined,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
