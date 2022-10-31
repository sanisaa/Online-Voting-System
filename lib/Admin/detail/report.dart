// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:pie_chart/pie_chart.dart';
// import 'package:http/http.dart' as http;
// import '../../api.dart';

// class Report extends StatelessWidget {
//   List map = [];
//   _getData() async {
//     var url = "$uri/voting/php/report.php";
//     final response = await http.get(Uri.parse(url));
//     Map<String, double> map = jsonDecode(response.body);
//     return map;
//   }
// //  static List<charts.Series<Report, int>> dataList(Map<String, dynamic> apiData) {
// //       List<Report> list = new List();

// //       for(int i=0; i<apiData['data'].length; i++)
// //         list.add(new Report(i, apiData['data'][i]));

// //       return [
// //         new charts.Series<Report, int>(
// //           id: 'Sales',
// //           domainFn: (Report sales, _) => sales.year,
// //           measureFn: (Report sales, _) => sales.sales,
// //           data: list,
// //           labelAccessorFn: ( row, _) => '${row.year}: ${row.sales}',
// //         )
// //       ];
// //     }

//   Map<String, double> dataMap = {
//     "Flutter": 5,
//     "React": 3,
//     "Xamarin": 2,
//     "Ionic": 2,
//   };

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
