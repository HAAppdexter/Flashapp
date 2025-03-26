import 'dart:async';
import 'dart:math' as math;
import 'package:sensors_plus/sensors_plus.dart';

class CompassService {
  StreamController<double>? _compassController;
  StreamSubscription? _magnetometerSubscription;

  Stream<double> get compassStream => _compassController!.stream;

  void startListening() {
    _compassController = StreamController<double>();
    _magnetometerSubscription = magnetometerEvents.listen((event) {
      // Tính góc từ dữ liệu cảm biến từ trường
      double angle = math.atan2(event.y, event.x) * (180 / math.pi);
      // Chuẩn hóa góc về khoảng 0-360
      angle = (angle + 360) % 360;
      _compassController?.add(angle);
    });
  }

  void dispose() {
    _magnetometerSubscription?.cancel();
    _compassController?.close();
  }
} 