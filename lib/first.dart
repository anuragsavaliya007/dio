import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  // API Calling : Application Programming Interface

  // API ,Method Type (GET ,POST), Parameter

  bool status = false;
  List l = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  loadData() async {

    // http with GET Method

    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      print('Response body: ${response.body}');

      l = jsonDecode(response.body);

      print(l);
    }
    setState(() {
      status = true;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: status
          ? (l.length > 0
              ? ListView.builder(
                  itemCount: l.length,
                  itemBuilder: (context, index) {

                    Map map = l[index];

                    User user = User.fromJson(map);

                    return ListTile(
                      leading: Text("${user.id}"),
                      title: Text("${user.title}"),
                      subtitle: Text("${user.body}"),
                    );
                  },
                )
              : Center(child: Text("No data found")))
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class User {
  int? userId;
  int? id;
  String? title;
  String? body;

  User({this.userId, this.id, this.title, this.body});

  User.fromJson(Map json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
