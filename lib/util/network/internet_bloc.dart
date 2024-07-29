import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

class InternetBloc extends Cubit<bool> {
  bool isInternetAvailable = true;

  InternetBloc() : super(true);

  Future<void> updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      isInternetAvailable = false;
    } else {
      isInternetAvailable = true;
    }
    emit(isInternetAvailable);
  }

  Future<void> initConnectivity(Connectivity connectivity) async {
    late List<ConnectivityResult> result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException {
      return;
    }
    return updateConnectionStatus(result.first);
  }
}