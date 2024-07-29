import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

void showLoading() async {
  BotToast.showCustomLoading(
      toastBuilder: (_) => const CircularProgressIndicator.adaptive());
}

void hideLoading() async {
  BotToast.closeAllLoading();
}

void showToast(String title, {int seconds = 10}) {
  BotToast.showSimpleNotification(
      title: title, duration: Duration(seconds: seconds));
}
