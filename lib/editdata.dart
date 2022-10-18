
// ignore_for_file: unnecessary_new

import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import './voters.dart';
import 'package:image_picker/image_picker.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({required this.list, required this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {

  
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerPhone = new TextEditingController();
  TextEditingController controllerGender = new TextEditingController();
  TextEditingController controllerFaculty = new TextEditingController();
  //TextEditingController controlleragenda = new TextEditingController();
File? pickedImage;
String imagePath="";
    void imagePickerOption() {
        Get.bottomSheet(
          SingleChildScrollView(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: Container(
                color: Colors.white,
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        
                        "Pic Image From",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                        pickImage(ImageSource.camera);
                        },
                        icon: const Icon(Icons.camera),
                        label: const Text("CAMERA"),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                        pickImage(ImageSource.gallery);
                        },
                        icon: const Icon(Icons.image),
                        label: const Text("GALLERY"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.close),
                        label: const Text("CANCEL"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
      Future<void> pickImage(ImageSource gallery) async {
  try{
      var photo = await ImagePicker().pickImage(source: gallery);
      setState(() {
        pickedImage = File(photo!.path);
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
   }

  Future<void> editData() async {
    List<int> imageBytes = pickedImage?.readAsBytesSync() as List<int>;
     String baseimage = base64Encode(imageBytes);
    var url="http://192.168.1.69/voting/php/edit.php/";
   final response = await http.post(Uri.parse(url),
   body: {
      "uid": widget.list[widget.index]['uid'],
      "name": controllerName.text,
      "email": controllerEmail.text,
      "phone": controllerPhone.text,
      "gender": controllerGender.text,
      "faculty": controllerFaculty.text,
       'image':baseimage 
    });
     var data=json.decode(json.encode(response.body));
        if(data!= "Edit Success"){
          print(data);
    
        }else{
          print("Success");
        }
  }


  @override
    void initState() {
      
      controllerName= new TextEditingController(text: widget.list[widget.index]['name'] );
      controllerEmail= new TextEditingController(text: widget.list[widget.index]['email'] );
      controllerPhone= new TextEditingController(text: widget.list[widget.index]['phone'] );
      controllerGender= new TextEditingController(text: widget.list[widget.index]['gender'] );
      controllerFaculty= new TextEditingController(text: widget.list[widget.index]['faculty'] );
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDIT DATA"),
      ),
      body: SingleChildScrollView(
       
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                  const SizedBox(
                    height: 50,
                  ),
                   Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.indigo, width: 5),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
            child: ClipOval(
                          child: pickedImage!= null 
                          ?Image.file(
                            pickedImage!,               
                            //if pickked image is null then the default image is shown whose link is given, 
                            //otherwise picked image is shown
                            width: 170,
                            height: 170,
                            fit:BoxFit.cover,
                            )
                          
                           :Image.network(
                             'http://192.168.1.69/voting/${widget.list[widget.index]['image']}',
                                //'https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
                                width: 170,
                                height: 170,
                                fit: BoxFit.cover,
                              ),
                      ),
            ),
            Positioned(
                      bottom: 0,
                      right: 5,
                      child: IconButton(
                      onPressed: imagePickerOption,
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                  )
                      ]),),
                      const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                  onPressed: imagePickerOption,
                  icon: const Icon(Icons.add_a_photo_sharp),
                  label: const Text('UPLOAD IMAGE')),
            )],),
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerName,
                  decoration: new InputDecoration(
                      hintText: "Name", labelText: "Name"),
                ),
                new TextField(
                  controller: controllerEmail,
                  decoration: new InputDecoration(
                      hintText: "Email", labelText: "Email"),
                ),
                new TextField(
                  controller: controllerPhone,
                  decoration: new InputDecoration(
                      hintText: "Phone_number", labelText: "Phone_number"),
                ),
                new TextField(
                  controller: controllerGender,
                  decoration: new InputDecoration(
                      hintText: "Gender", labelText: "Gender"),
                ),
                 new TextField(
                  controller: controllerFaculty,
                  decoration: new InputDecoration(
                      hintText: "Faculty", labelText: "Faculty"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("EDIT DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context)=>new VotersList()
                      )
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
