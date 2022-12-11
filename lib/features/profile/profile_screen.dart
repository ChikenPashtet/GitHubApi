import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/static/style.dart';
import 'package:test_app/features/auth/cubit/auth_cubit.dart';

class Profile extends StatefulWidget {
  const Profile(
    this.login, {
    super.key,
  });

  final String login;

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is! AuthLoaded) {
          return const SizedBox.shrink();
        }

        final user = state.user;

        return SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(side: BorderSide(width: 0)),
                        backgroundColor: Color(0xFFF0F0F0),
                      ),
                      onPressed: () {},
                      child:
                          const Icon(Icons.settings, color: Color(0xFF202020))),
                  SizedBox(
                    width: 254,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(side: BorderSide(width: 0)),
                          backgroundColor: Color(0xFFF0F0F0)),
                      onPressed: () {},
                      child: const Icon(
                        Icons.notifications,
                        color: Color(0xFF202020),
                      )),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(165),
                child: Image.network(
                  //'https://www.befunky.com/images/prismic/0cd24dfa-814b-49cb-9205-f1652f492acb_features-photo-enhancer.png?auto=avif,webp&format=jpg&width=420',
                  user.avatarUrl,
                  width: 165,
                  height: 165,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                user.login,
                style: TextStyles.bold34,
              ),
              Text(
                //'123456',
                user.id.toString(),
                style: TextStyles.medium17.copyWith(color: Color(0xFFA1A1A2)),
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    _ProfileCard('My following', Icons.heart_broken),
                    SizedBox(
                      height: 18,
                    ),
                    _ProfileCard('My followers', Icons.heart_broken),
                    SizedBox(
                      height: 18,
                    ),
                    _ProfileCard('My badges', Icons.sports_golf),
                    SizedBox(
                      height: 18,
                    ),
                    _ProfileCard('My organizatios', Icons.money)
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard(this.str, this.icon, {super.key});

  final String str;
  final IconData icon;

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
          SizedBox(width: 30),
          Icon(icon),
          SizedBox(
            width: 10,
          ),
          Text(
            str,
            style: TextStyles.medium17,
          )
        ],
      ),
    );
  }
}
