import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:election/Admin/home.dart';
import 'package:election/api.dart';
import 'package:election/widget/adminnavbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../lists/candiates.dart';
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
  TextEditingController controllerAgenda = new TextEditingController();
  //TextEditingController controlleragenda = new TextEditingController();
  File? pickedImage;
  String imagePath = "";
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
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                    ),
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                    ),
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
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                    ),
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
    try {
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
    var url = "$uri/voting/php/editcandidate.php/";
    // var url="http://192.168.1.66/voting/php/edit.php/";
    final response = await http.post(Uri.parse(url), body: {
      "rid": widget.list[widget.index]['rid'],
      "uid": widget.list[widget.index]['uid'],
      "name": controllerName.text,
      "email": controllerEmail.text,
      "phone": controllerPhone.text,
      "gender": controllerGender.text,
      "faculty": controllerFaculty.text,
      "agenda": controllerAgenda.text,
      'image': baseimage
    });
    var data = json.decode(json.encode(response.body));
    print(data);
    if (data.compareTo("Successful")==0) {
      print(data);
      showSuccessSnackBar(Text("Detail Edited successfully"));
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new CandidateList()));
    } else {
      print("Success");
      showSuccessSnackBar(Text("Failed to update detail"));
    }
  }

  @override
  void initState() {
    controllerName =
        new TextEditingController(text: widget.list[widget.index]['name']);
    controllerEmail =
        new TextEditingController(text: widget.list[widget.index]['email']);
    controllerAgenda =
        new TextEditingController(text: widget.list[widget.index]['agenda']);
    controllerPhone =
        new TextEditingController(text: widget.list[widget.index]['phone']);
    controllerGender =
        new TextEditingController(text: widget.list[widget.index]['gender']);
    controllerFaculty =
        new TextEditingController(text: widget.list[widget.index]['faculty']);

    super.initState();
  }

  showSuccessSnackBar(message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: message,
      backgroundColor: Colors.purple,
      //margin: EdgeInsets.all(20),
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("EDIT DATA"),
        backgroundColor: Colors.purple,
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
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: ClipOval(
                        child: pickedImage != null
                            ? Image.file(
                                pickedImage!,
                                //if pickked image is null then the default image is shown whose link is given,
                                //otherwise picked image is shown
                                width: 170,
                                height: 170,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                '$uri/voting/${widget.list[widget.index]['image']}',
                                //  '$uri/voting/${widget.list[widget.index]['image']}',

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
                          color: Colors.purple,
                          size: 30,
                        ),
                      ),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(primary: Colors.purple),
                      onPressed: imagePickerOption,
                      icon: const Icon(Icons.add_a_photo_sharp),
                      label: const Text('UPLOAD IMAGE')),
                )
              ],
            ),
             Column(
              children: <Widget>[
                 TextField(
                  controller: controllerName,
                  decoration:  const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      labelText: "Name"),
                ),
                 TextField(
                  controller: controllerAgenda,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      labelText: "Agenda"),
                ),
                 TextField(
                  controller: controllerEmail,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      labelText: "Email"),
                ),
                 TextField(
                  controller: controllerPhone,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      labelText: "Phone_number"),
                ),
                 TextField(
                  controller: controllerGender,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      labelText: "Gender"),
                ),
                 TextField(
                  controller: controllerFaculty,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      labelText: "Faculty"),
                ),
                 const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                 ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.purple),
                  child: const Text("EDIT DATA"),
                  onPressed: () {
                    editData();

                    // Navigator.of(context).push(new MaterialPageRoute(
                    //     builder: (BuildContext context) =>
                    //         new CandidateList()));
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
