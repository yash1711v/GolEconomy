import 'package:flutter/material.dart';
import '../../style/pallet.dart';
import '../../style/styles.dart';

class NoNetwork extends StatefulWidget {
  const NoNetwork({super.key});
  static const id = "no-network";

  @override
  State<NoNetwork> createState() => _NoNetworkState();
}

class _NoNetworkState extends State<NoNetwork> {


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,

      child: Scaffold(
        backgroundColor: Pallet.white,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "No Internet",
                      style: Style.h20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Check your internet connection and try again",
                      style: Style.h15,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
