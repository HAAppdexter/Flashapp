import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';
import 'package:provider/provider.dart';
import 'package:flashapp/providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isTorchOn = false;
  bool _hasFlash = false;

  @override
  void initState() {
    super.initState();
    _checkFlash();
  }

  Future<void> _checkFlash() async {
    try {
      _hasFlash = await TorchLight.isTorchAvailable();
      setState(() {});
    } catch (e) {
      _hasFlash = false;
      setState(() {});
    }
  }

  Future<void> _toggleTorch() async {
    try {
      if (_isTorchOn) {
        await TorchLight.disableTorch();
      } else {
        await TorchLight.enableTorch();
      }
      setState(() {
        _isTorchOn = !_isTorchOn;
      });
    } catch (e) {
      _showError('Error toggling flashlight');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flash App'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              themeProvider.setThemeMode(
                isDark ? ThemeMode.light : ThemeMode.dark,
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_hasFlash)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'No flashlight available on this device',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            GestureDetector(
              onTap: _hasFlash ? _toggleTorch : null,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isTorchOn ? Colors.yellow : Colors.grey,
                  boxShadow: _isTorchOn
                      ? [
                          BoxShadow(
                            color: Colors.yellow.withOpacity(0.6),
                            spreadRadius: 20,
                            blurRadius: 30,
                          ),
                        ]
                      : null,
                ),
                child: Icon(
                  Icons.flashlight_on,
                  size: 100,
                  color: _isTorchOn ? Colors.black : Colors.white54,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _isTorchOn ? 'Tap to turn off' : 'Tap to turn on',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
} 