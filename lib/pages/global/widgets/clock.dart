import 'dart:math';
import 'package:fen_timer/public/constants.dart';
import 'package:fen_timer/public/size_config.dart';
// import 'package:fen_timer/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'clock_painter.dart';
import 'package:flutter/cupertino.dart';

class Clock extends StatelessWidget {
  final DateTime dateTime;
  Clock({required this.dateTime});
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    color: kShadowColor.withOpacity(0.14),
                    blurRadius: 64,
                  ),
                ],
              ),
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  painter: ClockPainter(context, dateTime),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: height * .182,
          left: 0,
          right: 0,
          child: IconButton(
            icon: Icon(
              CupertinoIcons.moon,
              // ThemeService().getThemeMode() == ThemeMode.dark
              //     ? CupertinoIcons.moon
              //     : CupertinoIcons.sunrise,
              // color: Theme.of(context).primaryColor,
              color: Theme.of(context).primaryColor,
              size: getProportionateScreenWidth(26),
            ),
            onPressed: () => {},
            // onPressed: () => ThemeService().changeThemeMode(),
          ),
        ),
      ],
    );
  }
}