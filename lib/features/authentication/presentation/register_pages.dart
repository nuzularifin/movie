import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcase/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:testcase/features/authentication/presentation/bloc/register_bloc.dart';
import 'package:testcase/features/movie/presentation/movie_detail_pages.dart';

class RegisterPages extends StatefulWidget {
  const RegisterPages({Key? key}) : super(key: key);

  @override
  State<RegisterPages> createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {
  final TextEditingController _textUsername = TextEditingController();
  final TextEditingController _textPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailedState) {
          BotToast.showText(text: state.message);
        } else if (state is RegisterSuccessState) {
          BotToast.showText(text: 'Register Berhasil');
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Daftar akun"),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_rounded)),
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                            BlocProvider.of<RegisterBloc>(context).add(
                                RequestRegisterEvent(
                                    password: _textPassword.text,
                                    username: _textUsername.text));
                          },
                          child: Text('Daftar')),
                    )
                ],
              ),
            ));
      },
    );
  }
}
