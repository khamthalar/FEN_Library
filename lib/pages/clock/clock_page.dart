import 'dart:developer' as dev;
import 'dart:math';
import 'package:fen_timer/pages/global/controllers/clock_controller.dart';
import 'package:fen_timer/pages/global/widgets/clock_painter.dart';
import 'package:fen_timer/public/constants.dart';
import 'package:fen_timer/public/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:lottie/lottie.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  final clockController = Get.put(ClockController());
  bool isOn = true;

  @override
  void initState() {
    super.initState();
    clockController.startTimer();
  }

  @override
  void dispose() {
    try{
      clockController.dispose();
    }catch(e){
      dev.log(e.toString());
    }
    super.dispose();
  }

  toggle() {
    setState(() {
      isOn = !isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 2),
        Stack(
          children: [
            CircularPercentIndicator(
              radius: width * .92,
              lineWidth: 35.0,
              percent: .5,
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: Theme.of(context).colorScheme.background,
              linearGradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
                  kPrimaryColor,
                  kSecondaryColor,
                ],
                tileMode: TileMode.mirror,
              ),
              animationDuration: 2000,
              addAutomaticKeepAlive: true,
              animateFromLastPercent: true,
              rotateLinearGradient: true,
              center: StreamBuilder(
                stream: clockController.currentDay.stream,
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return _buildClock(context, DateTime.now());
                  }
    
                  return _buildClock(context, snapshot.data);
                },
              ),
            ),
            Positioned(
              top: height * .186,
              left: 0,
              right: 0,
              child: IconButton(
                  icon: Icon(
                    CupertinoIcons.moon,
                    color: kPrimaryColor,
                    size: getProportionateScreenWidth(26),
                  ),
                  onPressed: () => {},
                  ),
            ),
            Positioned(
              top: 4,
              left: 0,
              right: 0,
              child: Icon(
                Icons.power_settings_new_sharp,
                color: Colors.white,
                size: width / 16.0,
              ),
            ),
            Positioned(
              bottom: 4,
              left: 0,
              right: 0,
              child: Icon(
                Icons.notifications_active,
                color: Colors.white,
                size: width / 16.0,
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: Lottie.asset('images/lotties/electric.json')
                    ),
          ],
        ),
      ],
    );
  }


  Widget _buildClock(context, dateTime) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 36.0,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
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
    );
  }

  // Widget _buildBottomTime(context, time, title, icon) {
  //   return Column(
  //     children: [
  //       Text(
  //         time,
  //         style: TextStyle(
  //           color: Theme.of(context).primaryColor,
  //           fontSize: width / 12.5,
  //           fontWeight: FontWeight.w600,
  //         ),
  //       ),
  //       const SizedBox(height: 8.0),
  //       Text(
  //         title,
  //         style: TextStyle(
  //           color: Theme.of(context).primaryColor,
  //           fontSize: width / 25.0,
  //           fontWeight: FontWeight.w600,
  //         ),
  //       ),
  //       const SizedBox(height: 6.0),
  //       Icon(
  //         icon,
  //         color: Theme.of(context).primaryColor,
  //         size: width / 14.0,
  //       ),
  //     ],
  //   );
  // }
}
