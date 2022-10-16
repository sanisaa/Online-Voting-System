import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

class DetailView extends StatefulWidget {
  DetailView({Key? key}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
} 

class _DetailViewState extends State<DetailView> {

 List userdata=[];
  Future<void> getrecord() async{
    String uri = "http://192.168.1.69/voting/php/user_detail.php/"; 
    try{
      var response= await http.get(Uri.parse(uri));
      setState((){
      userdata = jsonDecode(response.body);
      });
    }catch(e){print(e);}
  }
     @override
  void initState(){
    getrecord();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: 
          AppBar(
              title: const Text('Detail'),
                centerTitle: true,
                backgroundColor: Colors.purple,
          ),
        body: Container(
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
                            child :Image.network(
                             // 'http://192.168.1.69/voting/$image',
                                 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
                                  width: 170,
                                  height: 170,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Text( 'Name:', textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20.0, 
                      fontWeight: FontWeight.bold,)),
                    ),
                  
                    Container(
                      margin: EdgeInsets.all(10),
                       child: Text('Email:',
                        style: TextStyle(fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                    ),
                      Container(
                      margin: EdgeInsets.all(10),
                      child:  Text('Phone number:',
                       style: TextStyle(fontSize: 20.0,
                       fontWeight: FontWeight.bold)),
                      ),
                  
                      Container(
                      margin: EdgeInsets.all(10),
                       child: Text('Gender:',
                        style: TextStyle(fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                      ),
                  
                      Container(
                      margin: EdgeInsets.all(10),
                       child: Text('Faculty:',
                       style: TextStyle(fontSize: 20.0,
                       fontWeight: FontWeight.bold)),
                      ), 
                      Container(
                      margin: EdgeInsets.all(10),
                       child: Text('Agenda:',
                        style: TextStyle(fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                      ), 
                     ]),
                    ),
    );
  }
}
