import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepository {
  UserRepository(SupabaseClient supabase):
  _supabase = supabase;
  
  final SupabaseClient _supabase;

  Future<User?> getUser() async {
    final current_user = _supabase.auth.currentUser;
    if (current_user != null) return current_user;
    return null;
  }
}
