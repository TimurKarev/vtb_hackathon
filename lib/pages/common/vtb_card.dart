import 'package:flutter/material.dart';
import 'package:vtb_hackathon/pages/styles.dart';

class VTBCard extends StatelessWidget {
  const VTBCard({
    Key? key,
    required this.file,
    required this.header,
    required this.text,
  }) : super(key: key);
  final String file;
  final String header;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Image.asset("assets/png/$file.png"),
          ),
          Flexible(
            flex: 5,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    header,
                    style: Styles.productHeaderText,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    text,
                    style: Styles.smallText,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Image.asset("assets/png/Union.png"),
          ),
        ],
      ),
    );
  }
}