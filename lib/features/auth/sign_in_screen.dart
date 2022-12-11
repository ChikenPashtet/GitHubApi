import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/router/routes.dart';
import 'package:test_app/features/auth/cubit/auth_cubit.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        backgroundColor: const Color(0xFFFCFCFC),
        toolbarHeight: 48,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'GitHub social',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 34,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Enter nickname on github',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: Color(0xFF7A7A7A),
              ),
            ),
          ),
          const SizedBox(height: 46),
          Padding(
            padding: const EdgeInsets.only(
              left: 14,
              right: 18,
            ),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.only(top: 32, left: 15, right: 47, bottom: 28),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide.none),
                isDense: true,
                labelText: 'Nickname',
                labelStyle: TextStyle(
                  color: Color(0xFFAEAEB2),
                ),
                hintText: 'Enter nickname',
                hintStyle: TextStyle(
                    color: Color(0xFFB0B0B0),
                    fontSize: 36,
                    fontWeight: FontWeight.w500),
                filled: true,
                fillColor: Color(0xFFF0F0F0),
              ),
            ),
          ),
          BlocConsumer<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthError) {
                return Column(
                  children: [
                    const SizedBox(height: 40),
                    SvgPicture.asset(
                      'assets/images/fourth.svg',
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 17),
                      child: const Text(
                        'User with this nickname',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFE73A40),
                            fontSize: 24),
                      ),
                    ),
                    const Text(
                      'not found!',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFE73A40),
                          fontSize: 24),
                    ),
                    const Spacer(),
                  ],
                );
              }

              return const Spacer();
            },
            listener: (context, state) {
              if (state is AuthLoaded) {
                Navigator.of(context).pushNamed(
                  Routes.home,
                  arguments: state.user.login,
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(double.infinity, 58),
                backgroundColor: Colors.orange,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).onAuthUser(
                  _controller.text.trim(),
                );
              },
              child: const Center(
                child: Text(
                  'Search',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    color: Color(0xFFF6F7FA),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          //TODO: сделать
          const Center(
            child: Text('By signing in, I agree with Terms of Use'),
          ),
          const SizedBox(height: 65),
        ],
      ),
    );
  }
}
