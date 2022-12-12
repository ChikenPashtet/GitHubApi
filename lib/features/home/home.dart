import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/di/di_container.dart';
import 'package:test_app/core/static/colors.dart';
import 'package:test_app/features/auth/cubit/auth_cubit.dart';
import 'package:test_app/features/followers/cubit/followers_cubit.dart';
import 'package:test_app/features/followers/followers_screen.dart';
import 'package:test_app/features/following/cubit/following_cubit.dart';
import 'package:test_app/features/following/followings_list.dart';
import 'package:test_app/features/profile/profile_screen.dart';
import '../../core/static/style.dart';
import '../repositories/cubit/repositories_cubit.dart';
import '../repositories/repositories_list.dart';

class Home extends StatefulWidget {
  const Home({
    required this.login,
    super.key,
  });

  final String login;

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  var _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom navigation',
      home: Scaffold(
        body: IndexedStack(
          index: _currentPage,
          children: [
            home(),
            BlocProvider(
              create: (context) => FollowersCubit(getIt()),
              child: FollowersScreen(widget.login),
            ),
            BlocProvider(
              create: (context) => FollowersCubit(getIt()),
              child: FollowersScreen(widget.login),
            ),
            Profile(widget.login),
          ],
        ),
        bottomNavigationBar: _BottomBar(
          currentPage: _currentPage,
          onTap: (int intIndex) {
            setState(() => _currentPage = intIndex);
          },
        ),
      ),
    );
  }

  Widget home() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const _BioInfo(),
            const SizedBox(height: 17),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(),
            ),
            const SizedBox(height: 11),
            BlocProvider(
              create: (context) => FollowingCubit(getIt()),
              child: FollowingList(widget.login),
            ),
            const SizedBox(height: 11),
            BlocProvider(
              create: (context) => RepositoriesCubit(getIt()),
              child: RepositoriesList(widget.login),
            ),
          ],
        ),
      ),
    );
  }
}

class _BioInfo extends StatelessWidget {
  const _BioInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is! AuthLoaded) {
          return const SizedBox.shrink();
        }

        final user = state.user;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  FittedBox(
                    child: Text(
                      user.name,
                      style: TextStyles.bold34.copyWith(
                        color: const Color(0xFF2B2B2B),
                      ),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 2,
                      ),
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.add,
                          size: 12,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Follow on github',
                          style: TextStyles.bold10.copyWith(
                            color: const Color(0xFFF6F7FA),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                'Company - ${user.company}',
                style: TextStyles.medium17.copyWith(
                  color: LibraryColors.hint,
                ),
              ),
              Text(
                'Email - ${user.email}',
                style: TextStyles.medium17.copyWith(
                  color: LibraryColors.hint,
                ),
              ),
              Text(
                'Bio - ${user.bio}',
                style: TextStyles.medium17.copyWith(
                  color: LibraryColors.hint,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    required this.currentPage,
    required this.onTap,
  });

  final int currentPage;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Colors.black,
      unselectedItemColor: LibraryColors.label,
      unselectedLabelStyle: const TextStyle(color: LibraryColors.label),
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Followers',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.telegram),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        )
      ],
      currentIndex: currentPage,
      onTap: onTap,
    );
  }
}
