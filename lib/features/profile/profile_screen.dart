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
                        shape: const CircleBorder(side: BorderSide(width: 0)),
                        backgroundColor: const Color(0xFFF0F0F0),
                      ),
                      onPressed: () {},
                      child:
                          const Icon(Icons.settings, color: Color(0xFF202020))),
                  const Spacer(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(side: BorderSide(width: 0)),
                          backgroundColor: const Color(0xFFF0F0F0)),
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
                  user.avatarUrl,
                  width: 165,
                  height: 165,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                user.login,
                style: TextStyles.bold34,
              ),
              Text(
                user.id.toString(),
                style: TextStyles.medium17
                    .copyWith(color: const Color(0xFFA1A1A2)),
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const _ProfileCard('My following',
                        Icon(Icons.favorite, color: Colors.red)),
                    const SizedBox(
                      height: 18,
                    ),
                    const _ProfileCard('My followers',
                        Icon(Icons.favorite, color: Colors.red)),
                    const SizedBox(
                      height: 18,
                    ),
                    const _ProfileCard(
                        'My badges',
                        Icon(
                          Icons.badge,
                          color: Colors.amberAccent,
                        )),
                    const SizedBox(
                      height: 18,
                    ),
                    const _ProfileCard(
                        'My organizatios',
                        Icon(
                          Icons.money,
                          color: Colors.green,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(double.infinity, 58),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {},
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('View all',
                            style: TextStyles.medium17
                                .copyWith(color: Colors.white)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 15,
                        )
                      ],
                    ),
                  ),
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
  const _ProfileCard(this.str, this.icon);

  final String str;
  final Icon icon;

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
          const SizedBox(width: 30),
          icon,
          const SizedBox(
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
