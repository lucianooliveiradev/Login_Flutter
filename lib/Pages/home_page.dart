import 'package:flutter/material.dart';
import 'package:ola_mundo/Models/user.dart';
import 'package:ola_mundo/app_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int count = 0;

  bool isDarkTheme = false;

  List<User> users = [
    new User(name: "Luciano", isEnable: true),
    new User(name: "José", isEnable: false),
    new User(name: "Juliana", isEnable: true),
    new User(name: "Fábio", isEnable: false),
    new User(name: "João", isEnable: false),
    new User(name: "Ana", isEnable: true)
  ];

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          CustomSwitcher(),
          Icon(Icons.access_alarm),
        ],
      ),
    );
  }

  Widget gestureDetectorWidget() {
    return GestureDetector(
      child: Text(
        "$count",
        style: Theme.of(context).textTheme.display1,
      ),
      onTap: increment,
    );
  }

  Widget buttonWidget() {
    return RaisedButton(
      child: const Text('Clique aqui'),
      color: Colors.blue,
      elevation: 1.0,
      splashColor: Colors.lightBlue,
      onPressed: () {
        increment();
      },
    );
  }

  Widget textFieldWidget() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Digite aqui...",
      ),
    );
  }

  Widget listViewOnTextWidget() {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: users[index].isEnable
              ? Text("User: " + users[index]?.name)
              : null,
          onTap: () {},
        );
      },
    );
  }

  Widget listViewOnListTileWidget() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemExtent: 20.0,
        itemBuilder: (BuildContext ctx, int idx) {
          return ListTile(
            title: Text(
              "Linha: $idx",
              style: TextStyle(color: Colors.black),
            ),
          );
        });
  }

  Widget floatingButtonWidget() {
    return FloatingActionButton(
      onPressed: increment,
      tooltip: "Add",
      child: Icon(Icons.add),
    );
  }
}

class CustomSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: AppController.instance.isDartTheme,
        onChanged: (value) {
          AppController.instance.changeTheme();
        });
  }
}
