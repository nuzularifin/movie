import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav_router/nav_router.dart';
import 'package:testcase/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:testcase/features/authentication/presentation/login_pages.dart';
import 'package:testcase/features/movie/presentation/movie_list_pages.dart';
import 'injection_container.dart' as di;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    BlocProvider.of<AuthenticationBloc>(context)
        .add(CheckingStatusLoginEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: 'assets/images/product_image_placeholder.jpeg',
        nextScreen: BlocConsumer<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
          if (state is OpenDashboardState) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => MovieListPages()));
          } else {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const LoginPages()));
          }
        }, builder: (context, state) {
          return BlocProvider(
            create: (_) => di.sl<AuthenticationBloc>(),
            child: state is OpenDashboardState
                ? MovieListPages()
                : const LoginPages(),
          );
        }),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white);
  }
}
