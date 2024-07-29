import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_bloc.dart';
import 'no_network_screen.dart';

class InternetHandler extends StatefulWidget {
  const InternetHandler({super.key, required this.child});
  final Widget child;

  @override
  State<InternetHandler> createState() => _InternetHandlerState();
}

class _InternetHandlerState extends State<InternetHandler> {
  late InternetBloc _internetBloc;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  @override
  void initState() {
    super.initState();
    _internetBloc = InternetBloc();
    _internetBloc.initConnectivity(_connectivity);
    _connectivitySubscription = _connectivity.onConnectivityChanged
        .listen((event) => _internetBloc.updateConnectionStatus(event.first));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetBloc, bool>(
      bloc: _internetBloc,
      builder: (context, internetAvailable) {
        return Stack(
          textDirection: TextDirection.ltr,
          children: [
            widget.child,
            if (!internetAvailable) const MaterialApp(
                debugShowCheckedModeBanner: false,
                home: NoNetwork()),
          ],
        );
      },
    );
  }
}
