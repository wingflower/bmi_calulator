import 'package:bmi_calulator/result/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bmiLoad();
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  Future save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('height', double.parse(_heightController.text));
    await prefs.setDouble('weight', double.parse(_weightController.text));
  }

  Future bmiLoad() async {
    final prefs = await SharedPreferences.getInstance();
    final double? height = prefs.getDouble('height');
    final double? weight = prefs.getDouble('weight');

    if (height != null && weight != null) {
      _heightController.text = '$height';
      _weightController.text = '$weight';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비만도 계산기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListView(
            children: [
              Image.asset('assets/images/body_fat.png'),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      controller: _heightController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '키',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '키를 입력하세요';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _weightController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '몸무게',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '몸무게를 입력하세요';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() == false) {
                          return;
                        }

                        save();

                        context.push(
                          Uri(
                            path: '/result',
                            queryParameters: {
                              'height': _heightController.text,
                              'weight': _weightController.text,
                            },
                          ).toString(),
                        );
                      },
                      child: const Text('결과'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
