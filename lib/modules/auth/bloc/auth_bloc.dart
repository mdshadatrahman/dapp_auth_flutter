import 'dart:async';
import 'dart:developer' as developer show log;
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginButtonPressed>(authLoginButtonPressed);
  }
  var _session;
  var _uri;
  final connector = WalletConnect(
    bridge: 'https://bridge.walletconnect.org',
    clientMeta: const PeerMeta(
      name: 'My App',
      description: 'An app for converting pictures to NFT',
      url: 'https://walletconnect.org',
      icons: ['https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'],
    ),
  );
  Future<void> loginUsingMetamask(BuildContext context) async {
    if (!connector.connected) {
      try {
        final session = await connector.createSession(
          onDisplayUri: (uri) async {
            _uri = uri;
            await launchUrlString(uri, mode: LaunchMode.externalApplication);
          },
        );
        _session = session;
      } catch (exp) {
        developer.log(exp.toString(), name: 'LoginController1');
      }
    }
  }

  FutureOr<void> authLoginButtonPressed(
    AuthLoginButtonPressed event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    await loginUsingMetamask(event.context);
    emit(AuthLoadedState());
  }
}
