import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  AuthenticationRepository(SupabaseClient supabase):
  _supabase = supabase;

  final _controller = StreamController<AuthenticationStatus>.broadcast();
  AuthenticationStatus _currentStatus = AuthenticationStatus.unknown;

  AuthenticationStatus get currentStatus => _currentStatus;
  final SupabaseClient _supabase;

  Stream<AuthenticationStatus> get status async* {
    debugPrint('AuthenticationRepository: Starting status stream');
    yield _currentStatus;
    debugPrint('AuthenticationRepository: Initial status: $_currentStatus');

    final currentUser = _supabase.auth.currentUser;
    if (currentUser != null) {
      _currentStatus = AuthenticationStatus.authenticated;
      debugPrint(
        'AuthenticationRepository: Current user found      listenWhen: (previous, current) => previous.status != current.status,, emitting authenticated',
      );
      yield _currentStatus;
    } else {
      _currentStatus = AuthenticationStatus.unauthenticated;
      debugPrint(
        'AuthenticationRepository: No current user, emitting unauthenticated',
      );
      yield _currentStatus;
    }

    await for (final status in _controller.stream) {
      debugPrint('AuthenticationRepository: New status from stream: $status');
      _currentStatus = status;
      yield status;
    }
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    try {
      final AuthResponse res = await _supabase.auth.signInWithPassword(
        email: username,
        password: password,
      );
      if (res.user != null) {
        debugPrint(
          'AuthenticationRepository: Login successful, emitting authenticated',
        );
        _currentStatus = AuthenticationStatus.authenticated;
        _controller.add(_currentStatus);
      } else {
        debugPrint('AuthenticationRepository: Login failed, no user returned');
        _currentStatus = AuthenticationStatus.unauthenticated;
        _controller.add(_currentStatus);
        throw Exception('Login failed: No user returned');
      }
    } catch (e) {
      debugPrint('AuthenticationRepository: Login error: $e');
      _currentStatus = AuthenticationStatus.unauthenticated;
      _controller.add(_currentStatus);
      rethrow;
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    try {
      final AuthResponse res = await _supabase.auth.signUp(
        email: email,
        password: password,
      );
      if (res.user != null) {
        debugPrint(
          'AuthenticationRepository: Sign up successful, emitting authenticated',
        );
        _currentStatus = AuthenticationStatus.authenticated;
        _controller.add(_currentStatus);
      } else {
        debugPrint(
          'AuthenticationRepository: Sign up failed, no user returned',
        );
        _currentStatus = AuthenticationStatus.unauthenticated;
        _controller.add(_currentStatus);
        throw Exception('Sign up failed: No user returned');
      }
    } catch (e) {
      debugPrint('AuthenticationRepository: Sign up error: $e');
      _currentStatus = AuthenticationStatus.unauthenticated;
      _controller.add(_currentStatus);
      rethrow;
    }
  }

  void logOut() {
    _currentStatus = AuthenticationStatus.unauthenticated;
    _controller.add(_currentStatus);
  }

  void dispose() => _controller.close();
}
