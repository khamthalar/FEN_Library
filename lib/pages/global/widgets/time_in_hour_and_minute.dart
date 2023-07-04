import 'package:fen_timer/pages/global/controllers/clock_controller.dart';
import 'package:fen_timer/public/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class TimeInHourAndMinute extends StatelessWidget {
  TimeInHourAndMinute({
    Key? key,
    required this.timeOfDay,
    required this.showPeriod,
  }) : super(key: key);
  final TimeOfDay timeOfDay;
  final bool showPeriod;
  final clockController = Get.put(ClockController());

  @override
  Widget build(BuildContext context) {
    String _period = timeOfDay.period == DayPeriod.am ? "AM" : "PM";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${clockController.formatTime(timeOfDay.hourOfPeriod)}:${clockController.formatTime(timeOfDay.minute)}",
          style: Theme.of(context).textTheme.headline1,
        ),
        showPeriod
            ? Row(
                children: [
                  SizedBox(width: 5),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      _period,
                      style:
                          TextStyle(fontSize: getProportionateScreenWidth(18)),
                    ),
                  )
                ],
              )
            : Container(),
      ],
    );
  }
}