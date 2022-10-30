import 'dart:convert';
import 'dart:io';
import 'package:election/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

class addNewCandidate extends StatefulWidget {
  // const addNewVoter({Key? key}) : super(key: key);

  @override
  State<addNewCandidate> createState() => _addNewCandidateState();
}

class _addNewCandidateState extends State<addNewCandidate> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone= TextEditingController();
  TextEditingController faculty= TextEditingController();
  TextEditingController gender= TextEditingController();
  TextEditingController agenda= TextEditingController();



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
                         style: ElevatedButton.styleFrom(
                  primary: Colors.purple
                ),
                        onPressed: () {
                        pickImage(ImageSource.camera);
                        },
                        icon: const Icon(Icons.camera),
                        label: const Text("CAMERA"),
                      ),
                      ElevatedButton.icon(
                         style: ElevatedButton.styleFrom(
                  primary: Colors.purple
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

  Future<void>insertrecord() async{

List<int> imageBytes = pickedImage?.readAsBytesSync() as List<int>;
      String baseimage = base64Encode(imageBytes);

        var url="$uri/voting/php/registerCandidate.php/"; 
        // var url="http://192.168.1.69/voting/php/registerCandidate.php/"; 
         final response=await http.post(Uri.parse(url),
          body: {  
          'name': name.text,
          'email': email.text,
          'phone':phone.text,
          'faculty':faculty.text,
          'gender':gender.text,
          'agenda':agenda.text,
          'image':baseimage          
        }
        );

        var data=json.decode(json.encode(response.body));
        if(data!= "data insertion Success"){
          print(data);
    
        }else{
          print("Success");
        }
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: 
          AppBar(
              title: const Text('Insert Candidate'),
                centerTitle: true,
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
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple, width: 5),
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
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0ZChrtBZL4xbqg8OXqPpFlVFFDTKQuBJ6vg&usqp=CAU',
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
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                 style: ElevatedButton.styleFrom(
                  primary: Colors.purple
                ),
                  onPressed: imagePickerOption,
                  icon: const Icon(Icons.add_a_photo_sharp),
                  label: const Text('UPLOAD IMAGE')),
            )
          ],
              ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text('Enter the Name'),
                      ), 
                    ),
                  ),
        
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: email,
                      decoration:const InputDecoration(
                        border: OutlineInputBorder(), label: Text('Enter the Email')), 
                        keyboardType: TextInputType.emailAddress,
                         validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please a Enter';
                          }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(email)) {
                              return 'Please a valid Email';
                          }
                    return null;
                  },
                      ),
                  ),
                    Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), label: Text('Enter the Phone number')), 
                      ),
                    ),
                
                    Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: gender,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), label: Text('Enter the Gender')), 
                      ),
                    ),
        
                    Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: faculty,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), label: Text('Enter the faculty')), 
                      ),
                    ),
                    Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: agenda,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), label: Text('Enter the Agenda')), 
                      ),
                    ), 
                    Container(
                      margin:const  EdgeInsets.all(10),
                      child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                  primary: Colors.purple
                ),
                onPressed: (){
                        insertrecord();
                      },
                      child: const Text('Insert',),
                      ),
                    ),
                    
                    ]),
        ),
    );
  }
}
