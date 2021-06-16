import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextStyle style;

  const SearchField({Key? key, required this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(
              Icons.search,
              size: 25,
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: style.copyWith(color: Colors.grey),
                  hintText: 'Search For Tests/Labs/Packages'),
            ),
          ),
        ],
      ),
    );
  }
}
