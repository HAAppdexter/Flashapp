import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../services/compass_service.dart';

class CompassWidget extends StatefulWidget {
  const CompassWidget({super.key});

  @override
  State<CompassWidget> createState() => _CompassWidgetState();
}

class _CompassWidgetState extends State<CompassWidget> {
  final CompassService _compassService = CompassService();
  double _direction = 0;

  @override
  void initState() {
    super.initState();
    _compassService.startListening();
    _compassService.compassStream.listen((direction) {
      setState(() {
        _direction = direction;
      });
    });
  }

  @override
  void dispose() {
    _compassService.dispose();
    super.dispose();
  }

  String _getDirectionText(double direction) {
    if (direction >= 337.5 || direction < 22.5) return 'N';
    if (direction >= 22.5 && direction < 67.5) return 'NE';
    if (direction >= 67.5 && direction < 112.5) return 'E';
    if (direction >= 112.5 && direction < 157.5) return 'SE';
    if (direction >= 157.5 && direction < 202.5) return 'S';
    if (direction >= 202.5 && direction < 247.5) return 'SW';
    if (direction >= 247.5 && direction < 292.5) return 'W';
    if (direction >= 292.5 && direction < 337.5) return 'NW';
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[850],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              TweenAnimationBuilder(
                tween: Tween<double>(
                  begin: 0,
                  end: _direction * (math.pi / 180) * -1,
                ),
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                builder: (_, double angle, __) {
                  return Transform.rotate(
                    angle: angle,
                    child: CustomPaint(
                      size: const Size(120, 120),
                      painter: CompassPainter(),
                    ),
                  );
                },
              ),
              Text(
                _getDirectionText(_direction),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '${_direction.toStringAsFixed(1)}°',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

class CompassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Vẽ vòng tròn ngoài
    canvas.drawCircle(center, radius, paint);

    // Vẽ mũi tên chỉ hướng Bắc
    final northPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final southPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Vẽ mũi tên Bắc
    final northPath = Path()
      ..moveTo(center.dx, center.dy - radius)
      ..lineTo(center.dx - 10, center.dy)
      ..lineTo(center.dx + 10, center.dy)
      ..close();

    // Vẽ mũi tên Nam
    final southPath = Path()
      ..moveTo(center.dx, center.dy + radius)
      ..lineTo(center.dx - 10, center.dy)
      ..lineTo(center.dx + 10, center.dy)
      ..close();

    canvas.drawPath(northPath, northPaint);
    canvas.drawPath(southPath, southPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
} 