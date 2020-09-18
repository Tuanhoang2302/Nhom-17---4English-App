import 'package:english_app/Model/model.dart';
import 'package:english_app/Redux/Actions/actions.dart';
import 'package:english_app/Screens/Home/Body/shortcut_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "4English",
          style: TextStyle(color: Colors.blue[700], fontSize: 25),
        ),
        actions: <Widget>[
          Container(
            child: IconButton(
              icon: Icon(Icons.file_download),
              color: Colors.black,
              onPressed: () {
                //print("hello");
              },
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: IconButton(
              icon: Icon(Icons.favorite),
              color: Colors.black,
              onPressed: () {
                //print("hello");
              },
            ),
          ),

        ],
      ),
      /*body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, listState) {
          return Column(
            children: [
              Text(

                listState.listfolder[1]
              ),

            ],
          );
        },
      ),

      floatingActionButton: new StoreConnector<AppState, VoidCallback>(
        converter: (store) {
          // Return a `VoidCallback`, which is a fancy name for a function
          // with no parameters. It only dispatches an Increment action.
          return () {
            store.dispatch(AddFolder(item: "Hello"));
            int lastIndex = store.state.listfolder.length - 1;
          };
        },
        builder: (context, callback) {
          return new FloatingActionButton(
            // Attach the `callback` to the `onPressed` attribute
            onPressed: callback,
            tooltip: 'Increment',
            child: new Icon(Icons.add),
          );
        },
      ),*/
      body: ShortcutList(),
    );
  }
}
