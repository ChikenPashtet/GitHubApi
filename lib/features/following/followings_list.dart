import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/static/style.dart';
import 'package:test_app/features/following/cubit/following_cubit.dart';
import 'package:test_app/features/following/data/following.dart';

class FollowingList extends StatefulWidget {
  const FollowingList(this.login, {super.key});

  final String login;

  @override
  State<FollowingList> createState() => _FollowingListState();
}

class _FollowingListState extends State<FollowingList> {
  @override
  void initState() {
    BlocProvider.of<FollowingCubit>(context).getFollowings(
      widget.login,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            'Following you',
            style: TextStyles.bold34,
          ),
        ),
        const SizedBox(height: 18),
        BlocBuilder<FollowingCubit, FollowingState>(
          builder: (context, state) {
            if (state is! FollowingLoaded) {
              return const SizedBox.shrink();
            }
            return SizedBox(
              height: 167,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => _FollowingCard(
                  following: state.followings[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 20),
                itemCount: state.followings.length,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _FollowingCard extends StatelessWidget {
  const _FollowingCard({
    required this.following,
  });

  final Following following;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            following.avatarUrl,
            width: 120,
            height: 120,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          following.login,
          style: TextStyles.medium17,
        ),
        Text(
          following.id.toString(),
        ),
      ],
    );
  }
}
