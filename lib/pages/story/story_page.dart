import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtb_hackathon/pages/home/home_page.dart';
import 'package:vtb_hackathon/pages/story/models/story_page_model.dart';
import 'package:vtb_hackathon/pages/story/story_cubit.dart';
import 'package:vtb_hackathon/scor/scor_click.dart';
import 'package:vtb_hackathon/shared/no_blink_inkwell.dart';
import 'package:vtb_hackathon/shared/open_link.dart';
import 'package:vtb_hackathon/shared/top_offset_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  bool showSuggestion = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: BlocBuilder<StoryCubit, StoryPageModel>(
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Image.network(
                      state.image,
                      errorBuilder: (c, o, s) => Container(),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
              _bottomContent(state, context),
              _topContent(state, context),
            ],
          );
        },
      ),
    );
  }

  Widget _bottomContent(StoryPageModel state, BuildContext context) {
    if (state.type != null &&
        (state.type == "end" || state.type == "division")) {
      return Column(
        children: [
          Expanded(child: Container()),
          Container(
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Expanded(
                    child: Center(
                        child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          state.text,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ))),
                NoBlinkInkWell(
                  onTap: () async {
                    analitEventClick(TypeClick.PageCount);
                    if (state.type == "division") {
                      if (state.result == "advanced") {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool("isNovice", false);
                      } else if (state.result == "novice") {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool("isNovice", true);
                      }
                      //если это сегментирующий экран, записывает сегментацию
                    }
                    //переходит на главный экран, до этого возможно какие-то данные отправляет

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => const HomePage()),
                      (route) => false,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue,
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: const Center(
                      child: Text("продолжить",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                NoBlinkInkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (c) => BlocProvider(
                            create: (_c) => StoryCubit(
                                BlocProvider.of<StoryCubit>(context).storyId),
                            child: const StoryPage(),
                          ),
                        ),
                        (route) => false);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue,
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Center(
                      child: Text("пройти заново",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    }

    if (state.type == null) {
      return Column(
        children: [
          Expanded(child: Container()),
          Container(
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                _speakerName(state),
                _textOrOptions(state, context),
              ],
            ),
          )
        ],
      );
    }
    return Container();
  }

  Widget _speakerName(StoryPageModel state) {
    return Row(
      children: [
        state.speakerName == null
            ? Container(
                padding: const EdgeInsets.all(10),
                child: const Text(''),
              )
            : Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue,
                ),
                child: Text(
                  state.speakerName!,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
      ],
    );
  }

  Widget _textOrOptions(StoryPageModel state, BuildContext context) {
    if (state.options == null) {
      return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: AutoSizeText(state.text),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  NoBlinkInkWell(
                    onTap: () {
                      analitEventClick(TypeClick.PageCount);
                      BlocProvider.of<StoryCubit>(context).loadNext();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue,
                      ),
                      child: const Text(
                        'далее',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: state.options!
            .map(
              (e) => NoBlinkInkWell(
                onTap: () {
                  BlocProvider.of<StoryCubit>(context)
                      .loadNamed(e.nextPageName);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue,
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(e.displayName,
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _topContent(StoryPageModel state, BuildContext context) {
    if (state.type == "end") {
      if (state.suggestion != null) {
        if (showSuggestion == false) {
          return Column(
            children: [
              const TopOffsetWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  NoBlinkInkWell(
                    onTap: () {
                      analitEventClick(TypeClick.Info);
                      setState(() {
                        showSuggestion = true;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue,
                      ),
                      child: const Text(
                        "показать предложение",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: Colors.blue.shade800,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const TopOffsetWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      NoBlinkInkWell(
                        onTap: () {
                          setState(() {
                            showSuggestion = false;
                          });
                        },
                        child: const Text(
                          'закрыть',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Container(height: 10),
                  Text(
                    state.suggestion!,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Container(height: 10),
                  NoBlinkInkWell(
                    onTap: () {
                      openLink(context, state.suggestionLink!);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Перейти',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }
    }
    return Container();
  }
}
