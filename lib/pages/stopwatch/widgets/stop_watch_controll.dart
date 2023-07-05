import 'package:fen_timer/pages/stopwatch/controllers/stop_watch_controller.dart';
import 'package:fen_timer/public/constants.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
class StopWatchControll extends StatefulWidget {
  const StopWatchControll({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _StopWatchControllState();
}

class _StopWatchControllState extends State<StopWatchControll> {
  final stopWatchController = Get.put(StopWatchController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StopWatchController>(
      builder: (_) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () => _.resetTime(),
                icon: Icon(
                  Icons.refresh,
                  size: width / 12.0,
                ),
            ),
            ElevatedButton(
                onPressed: () => _.play(),
                // duration: const Duration(milliseconds: 200),
                child: Icon(
                  _.isRunning ? Icons.pause : Icons.play_arrow,
                  size: width / 12.0,
                ),
                // padding: EdgeInsets.all(width / 22.5),
              //   style: NeumorphicStyle(
              //     shape: NeumorphicShape.convex,
              //     boxShape: const NeumorphicBoxShape.circle(),
              //     depth: 10.0,
              //     intensity: .18,
              //     surfaceIntensity: .5,
              //     color: Theme.of(context).scaffoldBackgroundColor,
              // ),
            ),
            IconButton(
              // onPressed: () => _.saveCurrentTime(),
              onPressed: () => {},
              icon: Icon(
                Icons.add_alarm_rounded,
                size: width / 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}