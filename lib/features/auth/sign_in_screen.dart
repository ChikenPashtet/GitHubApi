import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/onboarding.dart';
import 'package:test_app/core/router/routes.dart';
import 'package:test_app/core/static/colors.dart';
import 'package:test_app/core/static/style.dart';
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
      backgroundColor: LibraryColors.backGround,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () { Navigator.pop(context); },
        ),
        backgroundColor: LibraryColors.backGround,
        toolbarHeight: 48,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'GitHub social',
              style: TextStyles.bold34,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text('Enter nickname on github',
                style: TextStyles.medium17
                    .copyWith(color: LibraryColors.unactiveText)),
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
                  color: LibraryColors.label,
                ),
                hintText: 'Enter nickname',
                hintStyle: TextStyle(
                    color: LibraryColors.hint,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Center(
                      child: Image.asset(
                        'assets/images/fifth.png',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 17),
                      child: const Text(
                        'User with this nickname',
                        style: TextStyles.medium24,
                      ),
                    ),
                    const Text(
                      'not found!',
                      style: TextStyles.medium24,
                    ),
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
          const Spacer(),
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
                  style: TextStyles.bold17,
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('By signing in, I agree with ',
                    style: TextStyle(
                        color: LibraryColors.hint,
                        fontWeight: FontWeight.w500,
                        fontSize: 13)),
                const Text(
                  'Terms of Use',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 13),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('and ',
                      style: TextStyle(
                          color: LibraryColors.hint,
                          fontWeight: FontWeight.w500,
                          fontSize: 13)),
                  const Text('Privacy Policy',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 13)),
                ],
              ),
            ),
          ),
          //const SizedBox(height: 65),
        ],
      ),
    );
  }
}
