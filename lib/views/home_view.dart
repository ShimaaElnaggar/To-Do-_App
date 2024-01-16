
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff239B97),
        title: const Text("To-Do App",style: TextStyle(color: Colors.white),),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff239B97),
        child: const Icon(Icons.add,color: Colors.white,),
        onPressed: () {  },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xff239B97),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: "Done",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined),
            label: "Archived",
          ),
        ],
      ),
    );
  }
}
