import 'package:brf_monitoramento_e_anomalias/pages/validation_page.dart';
import 'package:brf_monitoramento_e_anomalias/shared/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: BrfMonitoramentoEAnomaliasTheme.themeData,
      home: const ValidationPage(),
    );
  }
}
