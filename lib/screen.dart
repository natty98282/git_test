import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<String> getdata() async {
    var url = 'https://jsonplaceholder.typicode.com/todos/1';
    var response = await http.get(Uri.parse(url));
    var data = jsonEncode(response.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<String>(
          future: getdata(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Text(snapshot.data.toString()),
              );
            } else {
              return const Center(
                child: Text('loading...'),
              );
            }
          },
        ));
  }
}
