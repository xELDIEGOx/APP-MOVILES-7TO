import 'package:flutter/material.dart';
import 'package:flutter_car_run/services/mockapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Velocidades Cars',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MockApi _api = MockApi();

  int _ferrariVal = 0;
  int _hyundaiVal = 0;
  int _fisherPriceVal = 0;

  bool _isFerrariCarga = false;
  bool _isHyundaiCarga = false;
  bool _isFisherPriceCarga = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Velocidades Cars'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                _iniciarAnimacion('ferrari');
                final value = await _api.getFerrariInteger();
                _pararAnimacion('ferrari');
                setState(() {
                  _ferrariVal = value;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Ferrari'),
            ),
            if (_isFerrariCarga)
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
            const SizedBox(height: 20),
            Text(
              'Valor: $_ferrariVal',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                _iniciarAnimacion('hyundai');
                final value = await _api.getHyundaiInteger();
                _pararAnimacion('hyundai');
                setState(() {
                  _hyundaiVal = value;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
              ),
              child: const Text('Hyundai'),
            ),
            if (_isHyundaiCarga)
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
                ),
              ),
            const SizedBox(height: 20),
            Text(
              'Valor: $_hyundaiVal',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                _iniciarAnimacion('fisherPrice');
                final value = await _api.getFisherPriceInteger();
                _pararAnimacion('fisherPrice');
                setState(() {
                  _fisherPriceVal = value;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Fisher Price'),
            ),
            if (_isFisherPriceCarga)
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            const SizedBox(height: 20),
            Text(
              'Valor: $_fisherPriceVal',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  void _iniciarAnimacion(String button) {
    setState(() {
      if (button == 'ferrari') {
        _isFerrariCarga = true;
      } else if (button == 'hyundai') {
        _isHyundaiCarga = true;
      } else if (button == 'fisherPrice') {
        _isFisherPriceCarga = true;
      }
    });
  }

  void _pararAnimacion(String button) {
    setState(() {
      if (button == 'ferrari') {
        _isFerrariCarga = false;
      } else if (button == 'hyundai') {
        _isHyundaiCarga = false;
      } else if (button == 'fisherPrice') {
        _isFisherPriceCarga = false;
      }
    });
  }
}