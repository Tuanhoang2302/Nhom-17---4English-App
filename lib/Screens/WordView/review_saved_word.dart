import 'package:english_app/Model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ReviewSavedWord extends StatefulWidget {
  String word;
  ReviewSavedWord({this.word});

  @override
  _ReviewSavedWordState createState() => _ReviewSavedWordState();
}

class _ReviewSavedWordState extends State<ReviewSavedWord> {
  TextEditingController _controller = TextEditingController();
  dynamic folderValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.text = "${widget.word}";
  }

  Widget build(BuildContext context) {
    //print(widget.word);
    return StoreConnector<AppState, Store>(
      converter: (store) => store,
      builder: (context, store) {
        if(folderValue == null) {
          folderValue = store.state.listfolder[0];
        }
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            backgroundColor: Colors.white,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                    ),
                  ),
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Word",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(bottom: 20, top: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey[300]),
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    controller: _controller,
                    onChanged: (String text) {

                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 16, bottom: 10),
                      //hintText: "Search for a word",
                      border: InputBorder.none,
                    ),

                  ),
                ),

                Text(
                  "Folder",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[300],
                      border: Border.all()),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<dynamic>(
                        isExpanded: true,
                        value: folderValue,
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Icon(Icons.arrow_downward),
                        ),
                        iconSize: 20,
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),

                        onChanged: (dynamic newValue) {
                          setState(() {
                            folderValue = newValue;
                          });
                        },
                        items: store.state.listfolder
                            .map<DropdownMenuItem<dynamic>>((dynamic value) {
                          return DropdownMenuItem<dynamic>(
                            value: value,
                            child: Row(
                              children: [
                                Icon(Icons.folder, color: Colors.orangeAccent, ),
                                Container(
                                  margin: EdgeInsets.only(left: 12),
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
