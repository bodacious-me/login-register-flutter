import 'package:chat_app_tut/services/auth/auth_gate.dart';
import 'package:chat_app_tut/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://fwidydevzbbjxemvitol.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ3aWR5ZGV2emJianhlbXZpdG9sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ0Mjk0MDQsImV4cCI6MjA1MDAwNTQwNH0.3s3lMRBoKif2b81Y8W4nx-wO3gb21v96Sau-ukwYyEE",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
      theme: lightMode,
    );
  }
}
