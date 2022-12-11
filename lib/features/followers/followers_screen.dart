import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/static/style.dart';
import 'package:test_app/features/following/data/following.dart';

import 'cubit/followers_cubit.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen(this.login, {super.key});

  final String login;

  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  @override
  void initState() {
    BlocProvider.of<FollowersCubit>(context).getFollowers(
      widget.login,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Followers',
              style: TextStyles.bold34,
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none),
                isDense: true,
                hintText: 'Search...',
                hintStyle: TextStyles.medium17
                    .copyWith(color: const Color(0xFFA1A1A1)),
                filled: true,
                fillColor: const Color(0xFFF0F0F0),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(child: BlocBuilder<FollowersCubit, FollowersState>(
              builder: (context, state) {
                if (state is FollowersLoaded) {
                  return ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const Divider(),
                      ...state.followings
                          .map((e) => _FollowerCard(following: e))
                          .toList(),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ))
          ],
        ),
      ),
    );
  }
}


class _FollowerCard extends StatelessWidget {
  const _FollowerCard({required this.following, super.key});
  final Following following;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(58),
            child: Image.network(
              following.avatarUrl,
              width: 60,
              height: 60,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                following.login,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                following.id.toString(),
                style: TextStyles.medium17,
              ),
            ],
          )
        ],
      ),
    );
  }
}
