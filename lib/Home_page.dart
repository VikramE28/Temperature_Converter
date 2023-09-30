import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double val = 0.0;
  int groupValue = 0;
  String finalAnswer = '';

  handleTemperature(int value) {
    setState(() {
      if (value == 1) {
        //fahrenheit to celsius
        groupValue = 1;
        var ans = (val! - 32.0) / 1.8;
        finalAnswer = "$ans \u2103";
      } else if (value == 2) {
        //celsius to fahrenheit
        groupValue = 2;

        var ans = (val! * 1.8) + 32;
        finalAnswer = '$ans \u2109';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.thermostat_outlined,
                size: 200,
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Temperature Converter',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Enter value',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide:
                            const BorderSide(width: 3, color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide:
                            const BorderSide(width: 3, color: Colors.black))),
                onChanged: (String value) {
                  if (value.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please Enter Something')));
                    finalAnswer = '';
                    return;
                  } else {
                    val = double.parse(value);
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                          handleTemperature(1);
                        },
                        child: const Text('\u2109 to \u2103')),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          padding: const EdgeInsets.all(8),
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      child: const Text('Clear'),
                      onPressed: () {
                        setState(() {
                          finalAnswer = '';
                        });
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          handleTemperature(2);
                        },
                        child: const Text('\u2103 to \u2109')),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  finalAnswer == null ? '' : finalAnswer,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
