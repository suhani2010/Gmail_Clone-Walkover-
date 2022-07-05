import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FormModel {
  String emailFrom;
  String emailTo;
  String emailCc;
  String emailBcc;
  String emailSub;
  String emailDesc;

  FormModel({
    this.emailFrom = "1",
    this.emailTo = "",
    this.emailCc = "",
    this.emailBcc = "",
    this.emailDesc = "",
    this.emailSub = "",
  });
}

class Compose extends StatefulWidget {
  const Compose({Key? key}) : super(key: key);

  @override
  ComposeState createState() {
    return ComposeState();
  }
}

class ComposeState extends State<Compose> {
  final textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var model = FormModel();
  bool status = true;

  _dropDown() {
    if (status == true) {
      setState(() {
        status = false;
      });
    } else {
      setState(() {
        status = true;
      });
    }
  }

  _presed() {
    // print(model.emailFrom);
    // print(model.emailTo);
    // print(model.emailCc);
    // print(model.emailBcc);
    // print(model.emailSub);
    // print(model.emailDesc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Compose',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.attachment),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _presed,
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: 'admin@gmail.com',
                      decoration: InputDecoration(
                        labelText: 'From',
                      ),
                      onChanged: (val) => {
                        // print(val),
                        model.emailFrom = val,
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.keyboard_arrow_down),
                    color: Colors.black,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'To',
                      ),
                      onChanged: (val) => {
                        model.emailTo = val,
                        // print(val),
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: _dropDown,
                    icon: Icon(Icons.keyboard_arrow_down),
                    color: Colors.black,
                  ),
                ],
              ),
              // Visibility(
              //   maintainSize: false,
              //   maintainAnimation: false,
              //   maintainState: true,
              //   visible: status,
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //       labelText: 'Cc',
              //     ),
              //   ),
              // ),
              Offstage(
                offstage: status,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Cc',
                  ),
                  onChanged: (val) => {
                    model.emailCc = val,
                  },
                ),
              ),
              Offstage(
                offstage: status,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Bcc',
                  ),
                  onChanged: (val) => {
                    model.emailBcc = val,
                  },
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Subject',
                ),
                onChanged: (val) => {
                  model.emailSub = val,
                },
              ),
              Expanded(
                child: TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  expands: true,
                  decoration: InputDecoration(
                    hintText: 'Compose email',
                    border: InputBorder.none,
                  ),
                  onChanged: (val) => {
                    model.emailDesc = val,
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
