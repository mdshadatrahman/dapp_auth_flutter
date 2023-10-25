import 'dart:developer' as developer show log;
import 'package:dapp_auth_flutter/main_development.dart';
import 'package:dapp_auth_flutter/modules/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        developer.log(state.runtimeType.toString(), name: 'LoginScreen1');
      },
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'assets/eth.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          AuthLoginButtonPressed(
                            context: context,
                          ),
                        );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black54,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
