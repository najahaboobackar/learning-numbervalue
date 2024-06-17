import 'package:flutter/material.dart';
import 'package:myapp/apis.dart'; // Assuming apis.dart contains your API integration logic

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ),
        // Assuming you are using Material 3.0
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _numberController = TextEditingController();
  String _resultText = "your result";

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 190, 190),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Learn Number Value",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cursive',
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 16),
              Image.asset(
                'assets/images/number.jpg',
                width: 200, // Adjust width as needed
                height: 200, // Adjust height as needed
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter number",
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  final String numberText = _numberController.text;
                  final int? number = int.tryParse(numberText);
                  if (number != null) {
                    final result = await getNumberfact(
                        number: number); // Implement getNumberfact function
                    setState(() {
                      _resultText = result.text ?? "No data available";
                    });
                  } else {
                    setState(() {
                      _resultText = "Invalid number";
                    });
                  }
                },
                child: Text("Get API"),
              ),
              const SizedBox(height: 16),
              Text(
                _resultText,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
