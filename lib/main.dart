import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme (
         headline1: TextStyle(fontSize: 20, color:Colors.lightBlue, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 15, color:Colors.lightBlue,fontWeight: FontWeight.bold),
          headline3: TextStyle(fontSize: 10, color:Colors.lightBlue)
      ),
      ),
      home: const MyCustomForm(title: 'Todo List'),

    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController_title = TextEditingController();
  final myController_description = TextEditingController();

  List <Map> todo_list=[];

void todo_add(){
  Map todo_map = {};
  setState(() {
    todo_map["title"] = myController_title.text;
    todo_map["description"]= myController_description.text;
    todo_list.add(todo_map);

  });
}
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController_title.dispose();
    myController_description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
                child:TextField(
                  controller: myController_title,
                  style:Theme.of(context).textTheme.headline1,
                  decoration:const InputDecoration(
                      hintText: "Title"),
                ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: TextField(
                controller: myController_description,
                style:Theme.of(context).textTheme.headline1,
                decoration:const InputDecoration(
                    hintText: "Description"),
              ),
            ),

            Expanded(
                child:
                ListView.separated(
                  itemCount: todo_list.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Todo - ${index+1}', style:Theme.of(context).textTheme.headline2),
                            Text('Title: ${todo_list[index]['title']}',style:Theme.of(context).textTheme.headline3),
                            Text('Description: ${todo_list[index]['description']}',style:Theme.of(context).textTheme.headline3)
                          ],
                        ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index)=>const Divider(height: 5),
                ),)
            //Text(todo_list[0]['title']),
          ]
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: todo_add,
      ),
    );
  }
}
