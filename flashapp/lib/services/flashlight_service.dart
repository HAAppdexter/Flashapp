import 'package:torch_light/torch_light.dart';
import 'package:flutter/services.dart';

class FlashlightService {
  bool _isFlashOn = false;
  
  bool get isFlashOn => _isFlashOn;

  Future<bool> hasFlashlight() async {
    try {
      return await TorchLight.isTorchAvailable();
    } on PlatformException catch (_) {
      return false;
    }
  }

  Future<void> toggleFlash() async {
    try {
      if (_isFlashOn) {
        await TorchLight.disableTorch();
      } else {
        await TorchLight.enableTorch();
      }
      _isFlashOn = !_isFlashOn;
    } on PlatformException catch (_) {
      // Handle error
      _isFlashOn = false;
    }
  }

  Future<void> turnOff() async {
    try {
      await TorchLight.disableTorch();
      _isFlashOn = false;
    } on PlatformException catch (_) {
      _isFlashOn = false;
    }
  }
} 