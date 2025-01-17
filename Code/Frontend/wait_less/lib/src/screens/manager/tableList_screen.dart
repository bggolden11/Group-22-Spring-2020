import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/HTTPClient/http_client.dart';
import 'package:flutter_app/src/models/dining_table_model.dart';
import 'package:flutter_app/src/models/list_dining_table_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final Dio httpClient = new HTTPClient().dio;

List<DiningTable> diningTableList = [];

Future getDiningTables() async {
  try {

    final Response response = await httpClient.get("https://waitless-functions-2.azurewebsites.net/api/Get-All-Dining-Tables?code=Xz204yaUqCMLaAMHHOYgXAsFER99G3EjVkF6sLhXd3DUlaa9fJ7UGA==");


    diningTableList = DiningTableList.diningTableListFromJSON('{ "result" : ${response.data.toString()} }').diningTableList;

    diningTableList.forEach((e) => print('ID: ${e.diningTableId}'));

    return diningTableList;
  } on DioError catch (e){
    print(e.response.toString());
    print(e.response.statusCode);
  }
  return null;
}

Widget _buildDiningTableList() {
  return FutureBuilder(
    future: getDiningTables(),
    builder: (context, snapshot) {
      return snapshot.hasData ?
      diningTableList.length == 0 ? new Container(child: Text('No Dining Tables!'))  // No tasks
          : GridView.count( // using GridView layout by flutter and you don't need to use scroll becuase it does it for us
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: new List.generate( // Has Tasks
                diningTableList.length,

                  (index) {
                    return getDiningTableCard(context, diningTableList[index]);
                  }

              ),

            )


          : new Center(child: SpinKitWave(color: Colors.cyan, size: 50)); //  Haven't gotten the tasks

    },

  );

}

Widget getDiningTableCard(BuildContext context, DiningTable table){
  return Card( // making a card for each using the card layout

    color: Colors.transparent,
    elevation: 0,
    child: InkWell(
      onTap: (){showDialog(context: context, builder: (context) => CustomDialog(
        title: table.diningTableId,
        description: 'Reservation: ${table.reservationName}', // you can change the description later
      ));},
      child: Container(
        decoration: BoxDecoration( // dimension of the box and the image
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: table.image,
                fit: BoxFit.cover
            )
        ),
//                          child: Transform.translate( // this is just for an optional icon we can use it to enhance capablities by showing it's pending, current or almost done
//                            // it's a future job
//                            offset: Offset(50, -50),
//                            child: Container(
//                              margin: EdgeInsets.symmetric(horizontal: 65, vertical: 63),
////                              decoration: BoxDecoration(
////                                  borderRadius: BorderRadius.circular(10),
////                                  color: Colors.white70
////                              ),
//                              //child: Icon(Icons.assignment, size: 30,), // you can change the icon if you want
//                              child: CircleAvatar(backgroundColor: Colors.white, child: Text("A2"),),
//                            ),
//                          ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.limeAccent.withOpacity(0.3), // adding opacity in order to increase visibility
                    Colors.redAccent.withOpacity(0.1),
                  ]
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[


              //SizedBox(height: 20,),
              Container(
                child: Transform.translate( // this is just for an optional icon we can use it to enhance capablities by showing it's pending, current or almost done
                  // it's a future job
                  offset: Offset(50, -50),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 65, vertical: 63),
//                                      decoration: BoxDecoration(
//                                          borderRadius: BorderRadius.circular(10),
//                                          color: Colors.white70
//                                      ),
                    child: CircleAvatar(backgroundColor: Colors.white70, child: Text(table.diningTableId, style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: "Poppins-Medium")),), // you can change the icon if you want

                  ),

                ),
              ),

            ],
          ),
        ),
      ),
    ),
  );
}

// class for tables info popup
class CustomDialog extends StatelessWidget{
  final String title, description, buttonText;
  final Image image;

  CustomDialog({this.title, this.description, this.buttonText, this.image});
  @override
  Widget build(BuildContext context){
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),

    );
  }
  dialogContent(BuildContext context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              top: 200,
              bottom: 16,
              left: 16,
              right: 16
          ),

          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.brown[600],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.black87,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),

                )
              ]
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,

                ),

              ),
              SizedBox(height: 16.0),
              Text(description,
                style: TextStyle(
                  fontSize: 16.0,
                ),),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),

                  ),
                  textColor: Colors.white,
                  color: Colors.red,
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    "Close",
                  ),
                ),
              )
            ],
          ),

        ),
        Positioned(
          top: 30,
          left: 30,
          right: 30,
          child: new Image(image: AssetImage('assets/tables.gif'), width: 350, height: 150, fit: BoxFit.cover,),
        )
      ],
    );
  }
}

class TablesList extends StatefulWidget { // class for Waiter Page
  @override
  _TablesList createState() => _TablesList();
}

class _TablesList extends State<TablesList>{
  // make a list of all the task.dart which can be updated with a call to the backend
  // for now I am implementing it with 8 of these tasks and populating the list with the same images but you can later add the
  // other functionality here
  // also this is a nice tutorial for the same, I couldn't understand it that well so I tried to implement as much as possible
  // All the images are from vecteezy, <a href="https://www.vecteezy.com/free-vector/food">Food Vectors by Vecteezy</a>
  final List<String> taskList = [
    'assets/task1.jpg','assets/task2.jpg','assets/task3.jpg','assets/task4.jpg','assets/task1.jpg','assets/task2.jpg','assets/task3.jpg','assets/task4.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea( // this is the main body and has bunch of containers
        //fit: StackFit.expand,
        child: Container(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[

                    new Align(alignment: Alignment.centerLeft, child: new Text(
                      'Occupied Tables', // for the area where the current tasks would be developed
                      style:TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black87, fontFamily: "Poppins-Medium"),
                    )),
                  ],
                ),
                Padding( // provide padding to create some space between the title and the buttons
                  padding: EdgeInsets.only(top: 1.0),

                ),
                SizedBox(height: 10,), // just for padding
                Column(
                  children: <Widget>[

//                    new Align(alignment: Alignment.centerLeft, child: new Text(
//                      'Current Tasks', // for the area where the current tasks would be developed
//                      style:TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black87, fontFamily: "Poppins-Medium"),
//                    )),
                  ],
                ),
                Expanded( // for the grid view, currently it goes through the list called task list and makes those many tasks, once we can populate the tasks you
                  // can change the image at line 166 to a fixed one and it will work
                    child: _buildDiningTableList()
                )
              ],
            ),


          ),



        ),

      ),

    );
  }
}

/*
Card( // making a card for each using the card layout

                        color: Colors.transparent,
                        elevation: 0,
                        child: InkWell(
                          onTap: (){showDialog(context: context, builder: (context) => CustomDialog(
                            title: item.name,
                            description: item.tasks, // you can change the description later
                          ));},
                          child: Container(
                            decoration: BoxDecoration( // dimension of the box and the image
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(item.image),
                                    fit: BoxFit.cover
                                )
                            ),
//                          child: Transform.translate( // this is just for an optional icon we can use it to enhance capablities by showing it's pending, current or almost done
//                            // it's a future job
//                            offset: Offset(50, -50),
//                            child: Container(
//                              margin: EdgeInsets.symmetric(horizontal: 65, vertical: 63),
////                              decoration: BoxDecoration(
////                                  borderRadius: BorderRadius.circular(10),
////                                  color: Colors.white70
////                              ),
//                              //child: Icon(Icons.assignment, size: 30,), // you can change the icon if you want
//                              child: CircleAvatar(backgroundColor: Colors.white, child: Text("A2"),),
//                            ),
//                          ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      colors: [
                                        Colors.limeAccent.withOpacity(0.3), // adding opacity in order to increase visibility
                                        Colors.redAccent.withOpacity(0.1),
                                      ]
                                  )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[


                                  //SizedBox(height: 20,),
                                  Container(
                                    child: Transform.translate( // this is just for an optional icon we can use it to enhance capablities by showing it's pending, current or almost done
                                      // it's a future job
                                      offset: Offset(50, -50),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 65, vertical: 63),
//                                      decoration: BoxDecoration(
//                                          borderRadius: BorderRadius.circular(10),
//                                          color: Colors.white70
//                                      ),
                                        child: CircleAvatar(backgroundColor: Colors.white70, child: Text(item.name, style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: "Poppins-Medium")),), // you can change the icon if you want

                                      ),

                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      )
 */