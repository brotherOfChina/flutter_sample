import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirstPageState();
  }
}

class _FirstPageState extends State<FirstPage>
    {
  @override
  void initState() {
    print("first page initState");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    super.build(context);
    return SafeArea(
        child: Container(
      color: Colors.lightBlueAccent,
      child: Center(
        child: Text("1"),
      ),
    ));
  }

}
