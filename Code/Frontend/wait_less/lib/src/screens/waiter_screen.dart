import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'waiter/completed_screen.dart';
import 'waiter/current_screen.dart';
import 'waiter/createTask_screen.dart';

class WaiterPage extends StatefulWidget { // class for Manager Page
  @override
  _WaiterPage createState() => _WaiterPage();
}

class _WaiterPage extends State<WaiterPage>{
  // list of pages 
  final List<Widget> pagesTasks =[CurrentTasks(), CompletedTasks()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar( // to edit anything in the appbar
        backgroundColor: Colors.transparent, // no background color
        iconTheme: new IconThemeData(color: Colors.black),
        elevation: 0, // provides the appbar with 40 elevation to remove the shadow
        title: new Center(child: new Text("Wait Less", style: TextStyle(color: Colors.black, fontFamily: "Poppins-Bold"))), // center the name of the app
        //leading: Icon(Icons.menu),

        actions: <Widget>[ // for the menu and the notifications center
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 36,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text("1")), // once notifications are implemented we can increase and decrease the counter accordingly and implement this
            ),
          )

        ],
      ),
      drawer: new Drawer( // this is for the navBar or the sideBar, don't edit unless you want to edit something on the menu
        child: new ListView(
          children: <Widget>[ // Drawer class for the navbar and edit User Header if needed to change anything on the User Header Section (Image)
            new UserAccountsDrawerHeader(accountName: new Text("Harsh Gupta", style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: "Poppins-Medium")), accountEmail: new Text("1024023", style: TextStyle(color: Colors.black, fontSize: 15.0, fontFamily: "Poppins-Medium",)), decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/task4.jpg"),

                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(Colors.red.withOpacity(0.1), BlendMode.darken)
                )
            ),
            ),

            new Divider(), // like a padding divides the image with the options in the menu

            new ListTile( // these are options for the drawer
              title: new Text("Current Task"),
              trailing: new Icon(Icons.assignment),
              // edit to change what happens on tap
              onTap: (){Navigator.push(context, MaterialPageRoute(builder : (context) => WaiterPage()));},
            ),
            new ListTile(
              title: new Text("Completed Task"),
              trailing: new Icon(Icons.assignment_turned_in),
              // edit to change what happens on tap
              onTap: (){Navigator.push(context, MaterialPageRoute(builder : (context) => WaiterPage()));},
            ),
            new ListTile(
              title: new Text("Call Manager"),
              trailing: new Icon(Icons.call),
              // edit to change what happens on tap
            ),
            new ListTile(
              title: new Text("Logout"),
              trailing: new Icon(Icons.cancel),
              // edit to change what happens on tap
            ),
          ],
        ),
      ),
      body: PageView.builder(itemCount: pagesTasks.length, // page view builder will run for each item in the list, edit the function for changes
      itemBuilder: (context, index) => pagesTasks[index],),
      floatingActionButton: SpeedDial( // this is the floating point button for creating tasks
        backgroundColor: Colors.red, // sets the background color
        closeManually: false, // toggle to switch between manual closing or on tap
        overlayColor: Colors.redAccent, // change the color to make the background have an overlay
        curve: Curves.bounceIn, // for animations of the labels
        overlayOpacity: 0.4, // overlay opacity edit it to make it more transparent
        animatedIcon: AnimatedIcons.menu_close, // icon for the button
        children: [
          SpeedDialChild( // options each will be a child

            child: Icon(Icons.assignment), // icon for create task
            label: "Create Task",
            onTap: (){
              showDialog(context: context,
              builder: (BuildContext context){
                return Dialog(
                  child: CreateTask(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                );
              });
            }
          )
        ],
      ),

    );
  }
}