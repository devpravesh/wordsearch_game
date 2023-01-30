import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wordsearch_game/helper.dart';
import 'package:wordsearch_game/searchtheword.dart';

class GridFomation extends StatefulWidget {
  const GridFomation({super.key});

  @override
  State<GridFomation> createState() => _GridFomationState();
}

var _local = AllData();

class _GridFomationState extends State<GridFomation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grid Formation")),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: int.parse(AllData.row.text),
              ),
              itemCount:
                  int.parse(AllData.column.text) * int.parse(AllData.row.text),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      onSubmitted: (value) {
                        if (value.length <= 1) {
                          _local.storeinlist(index, value);
                        }
                        log(_local.alphabet.toString());
                      },
                      maxLength: 1,
                      // onChanged: (value) {

                      //   // log(value);
                      // },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ));
              },
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Searchwords(
                        data: _local.alphabet,
                      )));
            },
            color: Colors.blue,
            child: const Text(
              "Form Grid",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
