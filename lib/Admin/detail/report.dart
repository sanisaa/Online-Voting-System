// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:pie_chart/pie_chart.dart';
// import 'package:http/http.dart' as http;
// import '../../api.dart';

// class Report extends StatefulWidget {
//   @override
//   State<Report> createState() => _ReportState();
// }

// class _ReportState extends State<Report> {
//   late Map<String, double> map;

//   _getData() async {
//     var url = "$uri/voting/php/report.php";
//     final response = await http.get(Uri.parse(url));
//         var data = json.decode(json.encode(response.body));
//         print(data);
//     Map<String, dynamic> map = jsonDecode(response.body);
//     return map;
//   }

//   Map<String, double> dataMap = {
//     "Flutter": 5,
//     "React": 3,
//     "Xamarin": 2,
//     "Ionic": 2,
//   };
//   @override
//     void initState(){
//     _getData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Pie Chart"),
//         centerTitle: true,
//         backgroundColor: Colors.green[700],
//         brightness: Brightness.dark,
//       ),
//       body: Container(
//         child: Center(
//           child: PieChart(
//             dataMap: map,
//             chartRadius: MediaQuery.of(context).size.width / 1.7,
//             legendOptions: LegendOptions(
//               legendPosition: LegendPosition.bottom,
//             ),
//             chartValuesOptions: ChartValuesOptions(
//               showChartValuesInPercentage: true,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
