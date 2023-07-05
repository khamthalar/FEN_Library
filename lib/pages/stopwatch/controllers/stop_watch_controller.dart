import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:developer' as dev;

class StopWatchController extends GetxController {
  StreamController<DateTime> currentTime = StreamController<DateTime>.broadcast();
  ScrollController scrollController = ScrollController();
  DateTime dateTime = DateTime(0, 0, 0, 0, 0, 0);
  Timer? timer;
  double percent = .0;
  bool isRunning = false;
  List<DateTime> dateTimes = [];

  formatTime(input) {
    if (input < 10) {
      return '0$input';
    }
    return input.toString();
  }

  play() {
    isRunning ? stopTimer() : startTimer();
  }

  updateTime(h, m, s) {
    currentTime.add(dateTime);
  }

  startTimer() {
    isRunning = true;
    dev.log(dateTime.second.toString());
    update();
    timer = Timer.periodic(const Duration(milliseconds: 17), (timer) {
      dateTime = dateTime.add(const Duration(milliseconds: 17));
      // dateTime = dateTime.subtract(const Duration(milliseconds: 17));
      // if (dateTime == DateTime(0, 0, 0, 0, 0, 0)) {
      //   // dateTime = DateTime(0, 0, 0, 0, 0, 0); // Ensure dateTime doesn't go below zero
      //   isRunning = false; // Set isRunning to false when the countdown reaches zero
      //   timer.cancel(); // Stop the timer
      // }
      currentTime.add(dateTime);
      percent = dateTime.second / 60.0;
      update();
    });
  }

  stopTimer() {
    timer?.cancel();
    isRunning = false;
    update();
  }

  saveCurrentTime() {
    if (isRunning) {
      dateTimes.insert(0, dateTime);
      scrollController.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
      update();
    }
  }

  resetTime() {
    dateTime = DateTime(0, 0, 0, 0, 0, 0);
    timer?.cancel();
    currentTime.add(dateTime);
    dateTimes.clear();
    dateTimes.add(DateTime(0, 0, 0, 0, 0, 0));
    percent = .0;
    isRunning = false;
    update();
  }
}