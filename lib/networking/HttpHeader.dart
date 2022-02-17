import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
    // Send authorization headers to the backend.
    headers: {
      HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
    },
  );
  final responseJson = jsonDecode(response.body);

  return Album.fromJson(responseJson);
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('发起 HTTP 认证授权请求'),
        ),
        body: const DataWidget(),
      ),
    );
  }
}

class DataWidget extends StatefulWidget {
  const DataWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DataWidgetState();
  }
}

class _DataWidgetState extends State<DataWidget> {
  var data = '点我获取数据';

  void _request() {
    fetchAlbum().then(
      (value) => {
        setState(
          () {
            data = value as String;
          },
        )
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _request();
            },
            child: const Text('点我'),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(data)
        ],
      ),
    );
  }
}
