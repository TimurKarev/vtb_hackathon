import 'package:flutter/material.dart';

class TopOffsetWidget extends StatelessWidget {
  const TopOffsetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).padding.top,
      color: Colors.transparent,
    );
  }
}
