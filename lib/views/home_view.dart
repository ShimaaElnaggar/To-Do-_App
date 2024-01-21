
import 'package:flutter/material.dart';
import 'package:to_do_app/sql_db.dart';
import 'package:to_do_app/views/archived_tasks_view.dart';
import 'package:to_do_app/views/done_tasks_view.dart';
import 'package:to_do_app/views/new_task_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  IconData fabIcon = Icons.edit;
  bool isBottomSheetOPend = false;
  var scaffoldKey=GlobalKey<ScaffoldState>();
  SqlDatabase sqlDatabase =SqlDatabase();
  int currentIndex = 0;
  List<Widget> views = [
    const NewTasksView(),
    const DoneTasksView(),
    const ArchivedTasksView(),
  ];

  List<String> headers = [
    " New Tasks ",
    " Done Tasks ",
    " Archived Tasks ",
  ];

  @override
  void initState() {
    super.initState();
    sqlDatabase.initialDatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xff239B97),
        title: Text( headers [currentIndex],style: const TextStyle(color: Colors.white),),
      ),
      body: views[currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff239B97),
        child: Icon(fabIcon,color: Colors.white,),
        onPressed: () {
          if( isBottomSheetOPend){
            Navigator.pop(context);
            isBottomSheetOPend = false;
            setState(() {
              fabIcon = Icons.edit;
            });
          }else{
            scaffoldKey.currentState!.showBottomSheet((context) {
              return Container(
                color: Colors.blue,
                width: double.infinity,
                height: 100,
              );
            });
            isBottomSheetOPend = true;
            setState(() {
              fabIcon = Icons.add;
            });
          }

          sqlDatabase.insertData('''
              INSERT INTO TASKS(
              title,
              date,
              time,
              status,),
              
              VALUES(
              "FIRST TASK",
              "21/1/2024",
              "4:30 PM",
              "NEW",),
              ''');
          print("insert done");
        },
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
