// import 'package:flutter/material.dart';
// import 'package:pharmacy_app/provider/appData.dart';
// import 'package:pharmacy_app/utils/color.dart';
// import 'package:provider/provider.dart';

// class QtyButton extends StatefulWidget {
//   final int? index;

//   const QtyButton({this.index});
//   @override
//   _QtyButtonState createState() => _QtyButtonState();
// }

// class _QtyButtonState extends State<QtyButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       width: 100,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           GestureDetector(
//             onTap: () {
//               context.read<AppData>().removeQty(widget.index!);
//             },
//             child: Container(
//               width: 25,
//               height: 25,
//               decoration: BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.circular(5)),
//               child: Icon(
//                 Icons.remove,
//                 color: Colors.white,
//                 size: 20,
//               ),
//             ),
//           ),
//           Text(!context.watch<AppData>().qty.length.isNaN ? '0' : context.watch<AppData>().qty[widget.index!].toString()),
//           GestureDetector(
//             onTap: () {
//               context.read<AppData>().addQty(widget.index!);
//             },
//             child: Container(
//               width: 25,
//               height: 25,
//               decoration: BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.circular(5)),
//               child: Icon(
//                 Icons.add,
//                 color: Colors.white,
//                 size: 20,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
