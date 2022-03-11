import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcase/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:testcase/features/authentication/presentation/register_pages.dart';
import 'package:testcase/features/movie/presentation/movie_detail_pages.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({Key? key}) : super(key: key);

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  TextEditingController _textUsername = TextEditingController();
  TextEditingController _textPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationFailedState) {
          BotToast.showText(text: state.message);
        } else if (state is AuthenticationSuccessState) {
          BotToast.showText(text: 'Login Berhasil');
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20),
                      )),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: _textUsername,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      obscureText: true,
                      controller: _textPassword,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  spaceVertical(8),
                  Container(
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const RegisterPages()));
                        },
                        child: Text('Daftar')),
                  ),
                  spaceVertical(4),
                  if (state is AuthenticationLoadingState)
                    Container(
                      child: const Center(child: CircularProgressIndicator()),
                    )
                  else
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<AuthenticationBloc>(context).add(
                                RequestLoginEvent(
                                    _textUsername.text, _textPassword.text));
                          },
                          child: Text('Login')),
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
