import 'package:flutter/material.dart';
import 'package:go_economy/style/pallet.dart';

class Style {
  static TextStyle bigBoldText = const TextStyle(
    color: Pallet.secondary,
    fontFamily: 'Poppins',
    fontSize: 24,
    height: 1.5,
    fontWeight: FontWeight.w600,
  );
  static TextStyle boldText = const TextStyle(
    color: Colors.white,
    fontFamily: 'Poppins',
    fontSize: 20,
    height: 1.5,
    fontWeight: FontWeight.w700,
  );
  static TextStyle headingText = const TextStyle(
    color: Pallet.textStyleColor,
    fontFamily: 'Poppins',
    fontSize: 18,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );

  static TextStyle lightText = const TextStyle(
    color: Colors.white,
    fontFamily: 'Poppins',
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w300,
  );

  static TextStyle h18 = const TextStyle(
    color: Pallet.textStyleColor,
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static TextStyle h20 = const TextStyle(
    color: Pallet.primary,
    fontFamily: 'Poppins',
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static TextStyle h16 = const TextStyle(
    color: Pallet.textStyleColor,
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle h15 = const TextStyle(
    color: Pallet.textStyleColor,
    fontFamily: 'Poppins',
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  static TextStyle h14 = const TextStyle(
    color: Pallet.textStyleColor,
    fontFamily: 'Poppins',
    fontSize: 14,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  static TextStyle h13 = const TextStyle(
    color: Pallet.textStyleColor,
    fontFamily: 'Poppins',
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static TextStyle h12 = const TextStyle(
    color: Pallet.textStyleColor,
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle h11 = const TextStyle(
    color: Pallet.textStyleColor,
    fontFamily: 'Poppins',
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );

  static TextStyle h10 = const TextStyle(
    color: Pallet.textStyleColor,
    fontFamily: 'Poppins',
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

  static TextStyle h8 = const TextStyle(
    color: Pallet.textStyleColor,
    fontFamily: 'Poppins',
    fontSize: 8,
    fontWeight: FontWeight.w400,
  );

  static TextStyle smallText = const TextStyle(
    color: Pallet.textStyleColor,
    fontFamily: 'Poppins',
    fontSize: 12,
    height: 1.5,
    fontWeight: FontWeight.w300,
  );

  static TextStyle body = const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  static BoxShadow containerBoxShadow = const BoxShadow(
    color: Color(0x0c000000),
    blurRadius: 60,
    offset: Offset(0, 4),
  );

  static BoxShadow kContainerBoxShadow = const BoxShadow(
    color: Color(0x0c000000),
    blurRadius: 60,
    offset: Offset(0, 4),
  );

  static TextStyle kInactiveButtonTextStyle = const TextStyle(
      color: Color(0xFF0C0F15),
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.5);

  static TextStyle kTextFieldInputTextStyle = const TextStyle(
      color: Pallet.textFieldColor,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.5);
  static TextStyle kSmallInactiveButtonTextStyle = const TextStyle(
      color: Color(0xFF0C0F15),
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.5);
  static TextStyle kActiveButtonTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );
  static BoxDecoration kActiveButtonContainerStyle = BoxDecoration(
      color: Pallet.primary,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      boxShadow: [kContainerBoxShadow]);
  static BoxDecoration kActiveButtonContainerBlueStyle = BoxDecoration(
      color: Pallet.secondary,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      boxShadow: [kContainerBoxShadow]);
  static TextStyle kActiveButtonOutlineTextStyle = const TextStyle(
      color: Pallet.primary,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.5);
  static BoxDecoration kActiveButtonOutlineContainerStyle = BoxDecoration(
      border: const Border(
        top: BorderSide(color: Pallet.primary),
        bottom: BorderSide(color: Pallet.primary),
        left: BorderSide(color: Pallet.primary),
        right: BorderSide(color: Pallet.primary),
      ),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      boxShadow: [kContainerBoxShadow]);

  static TextStyle kAppBarTitleStyle = const TextStyle(
      color: Pallet.primary,
      fontWeight: FontWeight.w600,
      fontSize: 18,
      height: 1.5);

  static TextStyle kSubtitleTextStyle = const TextStyle(
      color: Color(0xFF232C63),
      fontSize: 18,
      fontWeight: FontWeight.w400,
      height: 1.5);
  static BoxDecoration kTabbedHeadingBlue = BoxDecoration(
      color: Pallet.secondary,
      borderRadius: const BorderRadius.all(Radius.circular(42)),
      boxShadow: [kContainerBoxShadow]);
  static BoxDecoration kTabbedHeadingWhite = BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(42)),
      boxShadow: [kContainerBoxShadow]);
  static TextStyle kFunnelScreenHeadingTextStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 24,
      height: 1.5,
      color: Pallet.primary);
  static BoxDecoration kDataContainerStyle = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      color: Colors.white,
      boxShadow: [kContainerBoxShadow]);

  static TextStyle kBlueButtonText = const TextStyle(
      color: Pallet.secondary,
      fontWeight: FontWeight.w300,
      fontSize: 12,
      height: 1.5);

  static TextStyle kNavBarText = const TextStyle(
      color: Color(0xFF232C63),
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.5);
  static TextStyle kAppBarTitleBlackStyle = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 18,
      height: 1.5);
  static TextStyle errorStyle =
      const TextStyle(color: Colors.redAccent, fontSize: 18,fontFamily: "Poppins");
  static TextStyle greyText = const TextStyle(
    fontFamily: "Poppins",
    color: Colors.grey,
    fontSize: 16,
  );
  static TextStyle thinGreyText = const TextStyle(
    fontFamily: "Poppins",
    color: Colors.grey,
    fontSize: 18,
    fontWeight: FontWeight.w100
  );
  static TextStyle underlineBoldStyle = const TextStyle(
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.bold,
    color: Pallet.primary,
  );
  static TextStyle greenBold = const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Pallet.green,
                    fontSize: 25,
                  );

}
