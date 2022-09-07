import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class thirdpage extends StatefulWidget {
  const thirdpage({Key? key}) : super(key: key);

  @override
  State<thirdpage> createState() => _thirdpageState();
}

class _thirdpageState extends State<thirdpage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    // dio with GET Method

    // API  // https://jsonplaceholder.typicode.com/comments
    // Method Type (GET)
    // Parameter (postId  May be 1,2,3,4,....)

    // https://jsonplaceholder.typicode.com/comments?key1=value1&key2=value2&key3=value3

    int value1 = 20;
    var response = await Dio()
        .get('https://jsonplaceholder.typicode.com/comments?postId=$value1');
    print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
