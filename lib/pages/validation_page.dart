import 'dart:async';

import 'package:brf_monitoramento_e_anomalias/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_svg/svg.dart';
class ValidationPage extends StatefulWidget {
  const ValidationPage({super.key});

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  late StreamSubscription subscription;
  String conectado = '';
  bool carregando = false;

  final Widget iconSvgPlaneTrip = SvgPicture.asset(
    'lib/assets/icons/plane-trip.svg',
    semanticsLabel: 'Plane Trip Icon',
  );
  final Widget iconSvgSignal = SvgPicture.asset(
    'lib/assets/icons/signal.svg',
    semanticsLabel: 'Signal Icon',
  );
  final Widget iconSvgLocation = SvgPicture.asset(
    'lib/assets/icons/location.svg',
    semanticsLabel: 'Location Icon',
  );

  validarInternet() async {
    setState(() {
      conectado = 'start';
      carregando = true;
    });
    await Future.delayed(
      const Duration(seconds: 6),
    );

    setState(() {
      conectado = 'error';
    });
    await Future.delayed(
      const Duration(seconds: 2),
    );
    setState(() {
      conectado = 'start';
    });
    await Future.delayed(
      const Duration(seconds: 10),
    );
    setState(() {
      conectado = 'success';
      carregando = false;
    });
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Validação"),
          content: const Text("Validado com sucesso!"),
          actions: [
            TextButton(
              onPressed: () {

                Navigator.pop(context);
                Navigator.of(context).pushAndRemoveUntil(
                  PageRouteBuilder(
                      settings: const RouteSettings(name: '/auth/login'),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const LoginPage();
                      },
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      }),
                  (route) => false,
                );
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  initState() {
    super.initState();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      debugPrint(result.toString());
      if (result == ConnectivityResult.none) {
        // I am connected to a mobile network.
        // setState(() {
        //   conectado = true;
        // });
      }
    });
    validarInternet();
  }

// Be sure to cancel subscription after you are done
  @override
  dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 44,
            ),
            Center(
              child: Image.asset(
                'lib/assets/images/logo.png',
                width: 122,
                height: 58,
              ),
            ),
            const SizedBox(
              height: 56,
            ),
            const Text(
              'Aguarde, estamos validando...',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconSvgPlaneTrip,
                  const Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Modo avião'),
                          // Text('Desabilite o modo avião'),
                        ],
                      ),
                    ),
                  ),
                  conectado == 'start'
                      ? const SizedBox(
                          height: 36,
                          width: 36,
                          child: CircularProgressIndicator(),
                        )
                      : Icon(
                          conectado == 'success'
                              ? Icons.check_circle_outlined
                              : Icons.warning_amber_rounded,
                          color: conectado == 'success'
                              ? Colors.green.shade400
                              : Colors.red.shade400,
                          size: 36,
                        ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.only(left: 64, right: 23),
              height: 1,
              color: const Color(0xffEEF0F3),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  iconSvgSignal,
                  const Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Internet'),
                          // conectado ? Text('Verifique a internet') : Container(),
                        ],
                      ),
                    ),
                  ),
                  // Icon(
                  //   conectado ? Icons.place : Icons.check_circle_outline,
                  //   color:
                  //       !conectado ? Colors.green.shade400 : Colors.red.shade400,
                  //   size: 36,
                  // ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 64, right: 23),
              height: 1,
              color: const Color(0xffEEF0F3),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  iconSvgLocation,
                  const Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Localização'),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text('Vá em '),
                              Text(
                                'configuração',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Em '),
                              Text(
                                'Aplicativos, ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('procure por '),
                              Text(
                                'BRF',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Clique em '),
                              Text(
                                'Permissões / Localização',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('e '),
                              Text(
                                'Permitir o tempo todo.',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // conectado
                          //     ? const Text('Localização')
                          //     : const Text('Verifique a internet'),
                        ],
                      ),
                    ),
                  ),
                  // Icon(
                  //   conectado
                  //       ? Icons.check_circle_outline
                  //       : Icons.warning_amber_rounded,
                  //   color:
                  //       conectado ? Colors.green.shade400 : Colors.red.shade400,
                  //   size: 36,
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: TextButton(
                onPressed: () {
                  validarInternet();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.blue.shade900),
                ),
                child: carregando
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'Validar novamente',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
