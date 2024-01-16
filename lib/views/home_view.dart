
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff239B97),
        title: const Text("To-Do App",style: TextStyle(color: Colors.white),),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff239B97),
        child: Icon(Icons.add,color: Colors.white,),
        onPressed: () {  },
      ),
    );
  }
}
