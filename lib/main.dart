import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wordsearch_game/gridformation.dart';
import 'package:wordsearch_game/helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final b = RegExp(r'^[0-9]+$');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Word Search"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Enter No. of Rows',
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter";
                    } else if (!b.hasMatch(value)) {
                      return "Only Number Allowed";
                    } else if (int.parse(value) < 1) {
                      return "Only Positive Number Allowed";
                    } else {
                      return null;
                    }
                  },
                  textAlign: TextAlign.center,
                  controller: AllData.row,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 30),
                const Text("Enter No. Of Column"),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter";
                    } else if (!b.hasMatch(value)) {
                      return "Only Number Allowed";
                    } else if (int.parse(value) < 1) {
                      return "Only Positive Number Allowed";
                    } else {
                      return null;
                    }
                  },
                  textAlign: TextAlign.center,
                  controller: AllData.column,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 30),
                MaterialButton(
                  onPressed: (() {
                    final isValid = _formKey.currentState!.validate();
                    if (!isValid) {
                      return;
                    }
                    _formKey.currentState!.save();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GridFomation(),
                    ));
                    log(AllData.row.text);
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    height: 60,
                    width: 100,
                    child: const Center(
                        child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
