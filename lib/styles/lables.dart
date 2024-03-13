import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colours.dart';

//black
final TextStyle black14Style = TextStyle(fontSize: 14.sp, color: Colors.black);
final TextStyle black14w600dStyle = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.black);
final TextStyle black16Style = TextStyle(fontSize: 16.sp, color: Colors.black);
final TextStyle black17Style = TextStyle(fontSize: 17.sp, color: Colors.black);
final TextStyle black20Style = TextStyle(fontSize: 20.sp, color: Colors.black);

//white
final TextStyle white6Style = TextStyle(fontSize: 6.sp, color: Colors.white);
final TextStyle white7Style = TextStyle(fontSize: 7.sp, color: Colors.white);
final TextStyle white9Style = TextStyle(fontSize: 9.sp, color: Colors.white);
final TextStyle white10Style = TextStyle(fontSize: 10.sp, color: Colors.white);
final TextStyle white10w600Style = TextStyle(fontSize: 10.sp, color: Colors.white, fontWeight: FontWeight.w600);
final TextStyle white11Style = TextStyle(fontSize: 11.sp, color: Colors.white);
final TextStyle white12Style = TextStyle(fontSize: 12.sp, color: Colors.white);
final TextStyle white12w400Style = TextStyle(fontSize: 12.sp, color: Colors.white, fontWeight: FontWeight.w400);
final TextStyle white13Style = TextStyle(fontSize: 13.sp, color: Colors.white);
final TextStyle white14Style = TextStyle(fontSize: 14.sp, color: Colors.white);
final TextStyle white14w600Style = TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600);
final TextStyle white14lightStyle = TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400);
final TextStyle white15Style = TextStyle(fontSize: 15.sp, color: Colors.white);
final TextStyle white15w600Style = TextStyle(fontSize: 15.sp, color: Colors.white, fontWeight: FontWeight.w600);
final TextStyle white16Style = TextStyle(fontSize: 16.sp, color: Colors.white);
final TextStyle white16w600Style = TextStyle(fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w600);
final TextStyle white17Style = TextStyle(fontSize: 17.sp, color: Colors.white);
final TextStyle white18Style = TextStyle(fontSize: 18.sp, color: Colors.white);
final TextStyle white18w600Style = TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.w600);
final TextStyle white20Style = TextStyle(fontSize: 20, color: Colors.white);
final TextStyle white20w500Style = TextStyle(fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.w500);
final TextStyle white20w600Style = TextStyle(fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.w600);
final TextStyle white12w600Style = TextStyle(fontSize: 12.sp, color: Colors.white, fontWeight: FontWeight.w600);
final TextStyle white24w600Style = TextStyle(fontSize: 24.sp, color: Colors.white, fontWeight: FontWeight.w600);
final TextStyle white26w600Style = TextStyle(fontSize: 26.sp, color: Colors.white, fontWeight: FontWeight.w600);
final TextStyle white30w600Style = TextStyle(fontSize: 30.sp, color: Colors.white, fontWeight: FontWeight.w600);
final TextStyle white26w500Style = TextStyle(fontSize: 26.sp, color: Colors.white, fontWeight: FontWeight.w500);
final TextStyle white30w500Style = TextStyle(fontSize: 30.sp, color: Colors.white, fontWeight: FontWeight.w500);

//input hint
final TextStyle inputHint16Style =
TextStyle(fontSize: 16.sp, color: Colours.color_A5A7A6, textBaseline: TextBaseline.ideographic);
final TextStyle inputHint14Style =
TextStyle(fontSize: 14.sp, color: Colours.color_A5A7A6, textBaseline: TextBaseline.ideographic);
final TextStyle inputHint12Style =
TextStyle(fontSize: 12.sp, color: Colours.color_A5A7A6, textBaseline: TextBaseline.ideographic);

//hint
final TextStyle hint10Style = TextStyle(fontSize: 10.sp, color: Colours.color_959595);
final TextStyle hint11Style = TextStyle(fontSize: 11.sp, color: Colours.color_959595);
final TextStyle hint12Style = TextStyle(fontSize: 12.sp, color: Colours.color_959595);
final TextStyle hint13Style = TextStyle(fontSize: 13.sp, color: Colours.color_959595);
final TextStyle hint14Style = TextStyle(fontSize: 14.sp, color: Colours.color_959595);
final TextStyle hint15Style = TextStyle(fontSize: 15.sp, color: Colours.color_959595);
final TextStyle hint16Style = TextStyle(fontSize: 16.sp, color: Colours.color_959595);

//cbcbcb
final TextStyle cbcbcb20Style = TextStyle(fontSize: 20, color: Color(0xFFCBCBCB));
final TextStyle cbcbcb14Style = TextStyle(fontSize: 14.sp, color: Color(0xFFCBCBCB));
final TextStyle cbcbcb16Style = TextStyle(fontSize: 16.sp, color: Color(0xFFCBCBCB));

//mainColor
final TextStyle active10Style = TextStyle(fontSize: 10.sp, color: Colours.activeColor);
final TextStyle active11Style = TextStyle(fontSize: 11.sp, color: Colours.activeColor);
final TextStyle active12Style = TextStyle(fontSize: 12.sp, color: Colours.activeColor);
final TextStyle active12w500Style = TextStyle(fontSize: 12.sp, color: Colours.activeColor, fontWeight: FontWeight.w500);
final TextStyle active12w400Style = TextStyle(fontSize: 12.sp, color: Colours.activeColor, fontWeight: FontWeight.w400);
final TextStyle active12w300Style = TextStyle(fontSize: 12.sp, color: Colours.activeColor, fontWeight: FontWeight.w100);
final TextStyle active12w600Style = TextStyle(fontSize: 12.sp, color: Colours.activeColor, fontWeight: FontWeight.w600);
final TextStyle active14Style = TextStyle(fontSize: 14.sp, color: Colours.activeColor);
final TextStyle active20Style = TextStyle(fontSize: 20.sp, color: Colours.activeColor);
final TextStyle active24w600Style = TextStyle(fontSize: 24.sp, color: Colours.activeColor, fontWeight: FontWeight.w600);

// status
final TextStyle statusGreen10Style = TextStyle(fontSize: 10.sp, color: Colours.statusGreen);
final TextStyle statusGreen11Style = TextStyle(fontSize: 11.sp, color: Colours.statusGreen);
final TextStyle statusGreen12Style = TextStyle(fontSize: 12.sp, color: Colours.statusGreen);
final TextStyle statusGrey12Style = TextStyle(fontSize: 12.sp, color: Colours.statusGrey);
final TextStyle statusRed10Style = TextStyle(fontSize: 10.sp, color: Colours.statusRed);
final TextStyle statusRed12Style = TextStyle(fontSize: 12.sp, color: Colours.statusRed);
final TextStyle statusYellow12Style = TextStyle(fontSize: 12.sp, color: Colours.statusYellow);
final TextStyle statusYellow11Style = TextStyle(fontSize: 11.sp, color: Colours.statusYellow);

final TextStyle a7a5a814Style = TextStyle(fontSize: 14.sp, color: Colours.color_A7A5A8);

//认证页
final TextStyle authHint14Style = TextStyle(fontSize: 14.sp, color: Colours.color_9291A5);
