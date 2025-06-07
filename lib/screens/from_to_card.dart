// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';


// class FromToCard extends StatelessWidget {
//   final String fromAddress;
//   final String toAddress;

//   const FromToCard({
//     Key? key,
//     required this.fromAddress,
//     required this.toAddress,
//   }) : super(key: key);

//   void openMapWithQuery(String query) async {
//     final Uri url = Uri.parse('https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(query)}');
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url, mode: LaunchMode.externalApplication);
//     } else {
//       print('Could not open the map.');
//     }
//   }

//   Widget buildAddressRow(Color dotColor, String label, String address) {
//     return Row(
//       children: [
//         Icon(Icons.circle, color: dotColor, size: 12),
//         SizedBox(width: 8),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(label,
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
//               SizedBox(height: 2),
//               Text(address, style: TextStyle(fontSize: 14)),
//             ],
//           ),
//         ),
//         IconButton(
//           icon: Icon(Icons.map_outlined, color: Colors.black87),
//           onPressed: () {
//             openMapWithQuery(address);
//           },
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 20),
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(24),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           buildAddressRow(
//               Colors.green, 'From', fromAddress), 
//           Divider(height: 28, color: Colors.grey[300]),
//           buildAddressRow(
//                Color.fromARGB(255, 255, 102, 0), 'To', toAddress), 
//         ],
//       ),
//     );
//   }
// }
