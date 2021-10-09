import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtb_hackathon/pages/story/models/story_page_model.dart';
import 'package:vtb_hackathon/pages/story/story_cubit.dart';

class StroryPage extends StatefulWidget {
  const StroryPage({Key? key}) : super(key: key);

  @override
  _StroryPageState createState() => _StroryPageState();
}

class _StroryPageState extends State<StroryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<StoryCubit, StoryPageModel>(builder: (context, state) {
      return Stack(
        children: [
          Column(
            children: [
              Text(state.text),
            ],
          )
        ],
      );
    }));
  }
}
