import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/constant/general_state.dart';
import '../../core/route/go_router_config.dart';
import '../../domain/entities/post/post_entity.dart';
import '../auth/bloc/auth_bloc.dart';
import '../shared/bloc/theme/theme_bloc.dart';
import '../shared/widget/custom_button.dart';
import 'bloc/post_list_bloc.dart';
import 'widget/post_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostListBloc>().add(PostListEvent.getPosts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Story Share'),
        actions: [
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
                      title: Text('Logout'),
                      content: Text('Are you sure you want to logout?'),
                      actions: [
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            context.pop();
                          },
                        ),
                        TextButton(
                          child: Text('Logout'),
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
            context.read<PostListBloc>().add(PostListEvent.getPosts());
          }
        },
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 480),
            child: BlocBuilder<PostListBloc, PostListState>(
              builder: (context, state) {
                return switch (state.status) {
                  GeneralState.loading => const CircularProgressIndicator(),
                  GeneralState.success => ListView.separated(
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      PostEntity post = state.posts[index];
                      return Container(
                        padding: const EdgeInsets.all(8.0),
                        child: PostCard(post: post),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                  ),
                  _ => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.message.isEmpty
                              ? 'Initial state'
                              : state.message,
                        ),
                        SizedBox(
                          width: 200,
                          child: CustomButton(
                            text: 'Retry',
                            onPressed: () {
                              context.read<PostListBloc>().add(
                                PostListEvent.getPosts(),
                              );
                            },
                            buttonType: ButtonType.outline,
                          ),
                        ),
                      ],
                    ),
                  ),
                };
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(AppRoute.addStory.name);
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add_a_photo_outlined,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
