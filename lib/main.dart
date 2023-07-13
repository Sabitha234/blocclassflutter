import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'CounterBloc.dart';
import 'CounterEvents.dart';
import 'CounterStates.dart';
import 'NextPage.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBlocs(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home:LoginPage(),
      ),
    );
  }
}


class LoginPage extends StatefulWidget {
  const LoginPage({super.key, });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Bloc')
      ),
      body: BlocBuilder<CounterBlocs, CounterStates>(
        builder: (context, state){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.counter.toString(),
                  style: TextStyle(fontSize: 30),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){
                      BlocProvider.of<CounterBlocs>(context).add(Increment());
                    },
                        child: Icon(Icons.add)),
                    SizedBox(width: 20,),

                    ElevatedButton(onPressed: (){
                      BlocProvider.of<CounterBlocs>(context).add(Decrement());
                    },
                        child: Icon(Icons.remove)),
                  ],
                ),

                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NextPage(counter: state.counter,)));
                }, child: Text('NextPage'))
              ],
            ),
          );
        },
      ),
    );
  }
}