import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'flashlight_controller.dart';

class FlashlightWidget extends StatelessWidget {
  const FlashlightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashlightController>(
      builder: (context, controller, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Nút đèn pin chính
            GestureDetector(
              onTap: () => controller.toggleLight(),
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller.isEnabled ? Colors.yellow : Colors.grey,
                  boxShadow: controller.isEnabled
                      ? [
                          BoxShadow(
                            color: Colors.yellow.withOpacity(0.6),
                            blurRadius: 20,
                            spreadRadius: 5,
                          )
                        ]
                      : null,
                ),
                child: Icon(
                  Icons.power_settings_new,
                  size: 50,
                  color: controller.isEnabled ? Colors.black : Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // Các chế độ đèn pin
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildModeButton(
                  context,
                  FlashlightMode.normal,
                  Icons.flashlight_on,
                  controller,
                ),
                _buildModeButton(
                  context,
                  FlashlightMode.strobe,
                  Icons.flash_on,
                  controller,
                ),
                _buildModeButton(
                  context,
                  FlashlightMode.sos,
                  Icons.sos,
                  controller,
                ),
                _buildModeButton(
                  context,
                  FlashlightMode.music,
                  Icons.music_note,
                  controller,
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Thanh điều chỉnh tốc độ nhấp nháy
            if (controller.currentMode == FlashlightMode.strobe)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Text('Strobe Speed'),
                    Slider(
                      value: controller.strobeSpeed,
                      min: 100,
                      max: 1000,
                      onChanged: controller.setStrobeSpeed,
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildModeButton(
    BuildContext context,
    FlashlightMode mode,
    IconData icon,
    FlashlightController controller,
  ) {
    final isSelected = controller.currentMode == mode;
    return GestureDetector(
      onTap: () => controller.setMode(mode),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.grey[800],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.black : Colors.white,
        ),
      ),
    );
  }
} 