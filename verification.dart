// Future<void> notify() async {
//   var url = "$uri/smtpmail/notification.php/";
//   final response = await http.post(Uri.parse(url), body: {
//     //'email': email.text,
//   });

//   var data = json.decode(json.encode(response.body));

//   print(data);
//   print(data.compareTo("Success"));
//   print(data.compareTo("Failed"));

//   if ((data.compareTo("Success") == 1)) {
//     print("Mail sent");
//     showSuccessSnackBar(Text("Mail Sent"));
//   } else {
//     print("failed");
//     showSuccessSnackBar(Text("There was an error"));
//   }
// }
