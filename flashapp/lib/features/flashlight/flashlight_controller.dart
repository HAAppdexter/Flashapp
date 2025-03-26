import 'dart:async';
import 'package:flutter/material.dart';
import '../../services/flashlight_service.dart';

enum FlashlightMode {
  normal,
  strobe,
  sos,
  music
}

class FlashlightController extends ChangeNotifier {
  final FlashlightService _flashlightService;
  Timer? _strobeTimer;
  Timer? _sosTimer;
  FlashlightMode _currentMode = FlashlightMode.normal;
  bool _isEnabled = false;
  double _strobeSpeed = 500; // milliseconds

  FlashlightController(this._flashlightService);

  bool get isEnabled => _isEnabled;
  FlashlightMode get currentMode => _currentMode;
  double get strobeSpeed => _strobeSpeed;

  Future<void> toggleLight() async {
    await _flashlightService.toggleFlash();
    _isEnabled = _flashlightService.isFlashOn;
    notifyListeners();
  }

  void setMode(FlashlightMode mode) {
    if (_currentMode == mode) return;
    _stopAllTimers();
    _currentMode = mode;
    
    switch (mode) {
      case FlashlightMode.strobe:
        _startStrobeMode();
        break;
      case FlashlightMode.sos:
        _startSOSMode();
        break;
      case FlashlightMode.music:
        // Will be implemented later
        break;
      case FlashlightMode.normal:
        break;
    }
    
    notifyListeners();
  }

  void setStrobeSpeed(double speed) {
    _strobeSpeed = speed;
    if (_currentMode == FlashlightMode.strobe) {
      _stopAllTimers();
      _startStrobeMode();
    }
    notifyListeners();
  }

  void _startStrobeMode() {
    _strobeTimer = Timer.periodic(
      Duration(milliseconds: _strobeSpeed.toInt()),
      (_) => _flashlightService.toggleFlash(),
    );
  }

  void _startSOSMode() {
    const dotDuration = Duration(milliseconds: 200);
    const dashDuration = Duration(milliseconds: 600);
    const signalGap = Duration(milliseconds: 200);
    const letterGap = Duration(milliseconds: 600);
    const wordGap = Duration(milliseconds: 1400);

    Future<void> playSOSPattern() async {
      // S (...)
      for (int i = 0; i < 3; i++) {
        await _flashlightService.toggleFlash();
        await Future.delayed(dotDuration);
        await _flashlightService.toggleFlash();
        if (i < 2) await Future.delayed(signalGap);
      }
      await Future.delayed(letterGap);

      // O (---)
      for (int i = 0; i < 3; i++) {
        await _flashlightService.toggleFlash();
        await Future.delayed(dashDuration);
        await _flashlightService.toggleFlash();
        if (i < 2) await Future.delayed(signalGap);
      }
      await Future.delayed(letterGap);

      // S (...)
      for (int i = 0; i < 3; i++) {
        await _flashlightService.toggleFlash();
        await Future.delayed(dotDuration);
        await _flashlightService.toggleFlash();
        if (i < 2) await Future.delayed(signalGap);
      }
      await Future.delayed(wordGap);
    }

    _sosTimer = Timer.periodic(
      const Duration(seconds: 4),
      (_) => playSOSPattern(),
    );
  }

  void _stopAllTimers() {
    _strobeTimer?.cancel();
    _sosTimer?.cancel();
    _flashlightService.turnOff();
    _isEnabled = false;
  }

  @override
  void dispose() {
    _stopAllTimers();
    super.dispose();
  }
} 