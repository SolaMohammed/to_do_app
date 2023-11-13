import 'package:flutter/material.dart';
import 'package:to_do_app/theme.dart';
import 'package:to_do_app/ui/screens/tabs/list_tab.dart';
import 'package:to_do_app/ui/screens/tabs/settings_tab.dart';
import 'package:to_do_app/ui/widgets/bottom_sheet.dart';
import 'package:to_do_app/ui/widgets/to_do_item.dart';
class HomeScreen extends StatefulWidget {
  static const routeName="home";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndexClick=0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To Do List")),
      floatingActionButton: buildFAB(),
      bottomNavigationBar: buildBottomNav(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: currentIndexClick ==0 ?ListTab() : SettingsTab()
    );
  }

  Widget buildBottomNav(){
    return BottomAppBar(
      notchMargin: 8,
      clipBehavior: Clip.hardEdge,
      shape: CircularNotchedRectangle(),
      child: BottomNavigationBar(
        onTap: (index){
          currentIndexClick=index;
          setState(() {
          });
        },
        currentIndex: currentIndexClick ,
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.menu),label: ""),
          BottomNavigationBarItem(icon:Icon(Icons.settings),label: "")
        ],
      ),
    );
  }

  Widget buildFAB(){
    return FloatingActionButton(
    onPressed: () {
      showModalBottomSheet(context: context,isScrollControlled: true,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: BottomSheetWidget(),
      )

      );
  },
    child: Icon(Icons.add),
    shape: StadiumBorder(side: BorderSide(color: Colors.white,width: 4)),
  );
  }
}
