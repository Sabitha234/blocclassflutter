import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  final counter;
  const NextPage({Key? key,required this.counter}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState(counter);
}

class _NextPageState extends State<NextPage> {
  final counter;
  _NextPageState(this.counter);

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter Value"),automaticallyImplyLeading: false,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("counter:",style: TextStyle(fontSize: 25),),
              Text(counter.toString(),style: TextStyle(fontSize: 25)),
            ],
          ),
        ],
      ),
    );
  }
}
