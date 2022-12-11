import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/di/di_container.dart';
import 'package:test_app/core/router/router.dart';
import 'package:test_app/core/router/routes.dart';
import 'package:test_app/features/auth/cubit/auth_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItSetup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt()),
      child: const MaterialApp(
        title: 'Flutter Demo',
        initialRoute: Routes.onboarding,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
