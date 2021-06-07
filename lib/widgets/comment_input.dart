import 'package:flutter/material.dart';
import 'package:pharmacy_app/utils/color.dart';

class CommentInput extends StatelessWidget {
  final TextEditingController? controller;

  const CommentInput({this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.1, bottom: 10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: darkBlue, width: 1.5),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Add Comment or Inquiry",
          hintStyle: TextStyle(
            color: darkBlue,
          ),
        ),
      ),
    );
  }
}
