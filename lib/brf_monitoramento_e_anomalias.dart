import 'package:asyncstate/asyncstate.dart';
import 'package:brf_monitoramento_e_anomalias/pages/validation_page.dart';
import 'package:brf_monitoramento_e_anomalias/shared/theme/theme.dart';
import 'package:flutter/material.dart';

class BrfMonitoramentoEAnomalias extends StatefulWidget {
  const BrfMonitoramentoEAnomalias({Key? key}) : super(key: key);

  @override
  _BrfMonitoramentoEAnomaliasState createState() =>
      _BrfMonitoramentoEAnomaliasState();
}

class _BrfMonitoramentoEAnomaliasState
    extends State<BrfMonitoramentoEAnomalias> {
  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      builder: (asyncNavigatorObserver) {
        return MaterialApp(
          title: 'BRF Monitoramento E Anomalias',
          theme: BrfMonitoramentoEAnomaliasTheme.themeData,
          navigatorObservers: [asyncNavigatorObserver],
          initialRoute: '/',
          routes: {
            '/': (context) => const ValidationPage(),
          },
        );
      },
    );
  }
}
