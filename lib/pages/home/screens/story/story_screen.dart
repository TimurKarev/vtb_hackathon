import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import 'package:vtb_hackathon/cubit_scoring/cubit_bloc.dart';
import 'package:vtb_hackathon/pages/home/screens/story/bloc_pageview.dart';
import 'package:vtb_hackathon/pages/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtb_hackathon/pages/story/story_cubit.dart';
import 'package:vtb_hackathon/pages/story/story_page.dart';
import 'package:vtb_hackathon/pages/styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class StoryScreen extends StatefulWidget {
  const StoryScreen({Key? key}) : super(key: key);

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  final PageController controller = PageController(initialPage: 0);
  int _selectedValue = 0;
  late PageViewCubit _bloc;

  @override
  void initState() {
    _bloc = PageViewCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      CupertinoSlidingSegmentedControl(
          padding: EdgeInsets.only(top: 5),
          children: <int, Widget>{
            0: Container(
              height: 60,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                color:
                    _selectedValue == 0 ? Colors.blue : CupertinoColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                border: Border.all(
                  color: Colors.blue,
                  width: 1.5,
                ),
              ),
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(left: 9, top: 10),
              child: Center(
                  child: Text('Новичок',
                      style: TextStyle(
                        fontSize: 24,
                        color: _selectedValue == 1
                            ? Colors.blue
                            : CupertinoColors.white,
                      ))),
            ),
            1: Container(
              height: 60,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: const Radius.circular(10),
                  bottomRight: const Radius.circular(10),
                ),
                color:
                    _selectedValue == 1 ? Colors.blue : CupertinoColors.white,
                border: Border.all(
                  color: Colors.blue,
                  width: 1.5,
                ),
              ),
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(right: 9, top: 10),
              child: Center(
                  child: Text('Годзила',
                      style: TextStyle(
                        fontSize: 24,
                        color: _selectedValue == 0
                            ? Colors.blue
                            : CupertinoColors.white,
                      ))),
            ),
          },
          onValueChanged: (value) {
            setState(() {
              _selectedValue = value as int;
              // if (value == 0) {
              //   _bloc.emit(EventJunior as PageViewState);
              // }else {
              //   _bloc.emit(EventPro as PageViewState);
              // }
            });
          }),
      Container(
        margin: EdgeInsets.only(top: 70),
        child: BlocListener<PageViewCubit, PageViewState>(
            bloc: _bloc,
            listener: (context, state) {
              // if (state is ErrorAllOrders)
              //   ErrorBar(context: context, message: state.errorMsg);
            },
            child: BlocBuilder<PageViewCubit, PageViewState>(
                bloc: _bloc,
                builder: (context, state) {
                  if (state is EventJunior) {
                    return Container(
                        child: Column(children: <Widget>[
                      Expanded(
                          child: ListView.builder(
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Container(color: Colors.blue);
                              })),
                    ]));
                  } else if (state is EventPro) {
                    return Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Container(color: Colors.blue);
                            }));
                  } else if (state is EventNoStates) {
                    return Container(
                      child: Center(
                        child: Text("Error"),
                      ),
                    );
                  }

                  return Center(
                    child: //CupertinoActivityIndicator(),
                        Column(
                      children: [
                        TextButton(
                          child: Text("Новичек 1"),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => BlocProvider(
                                        create: (state) => StoryCubit("novice1"),
                                        child: const StoryPage(),
                                      )),
                              (route) => false,
                            );
                          },
                        ),
                        TextButton(
                          child: Text("Новичек "),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => BlocProvider(
                                    create: (state) => StoryCubit("novice2"),
                                    child: const StoryPage(),
                                  )),
                                  (route) => false,
                            );
                          },
                        ),
                        TextButton(
                          child: Text("Продвинутый "),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => BlocProvider(
                                    create: (state) => StoryCubit("advanced1"),
                                    child: const StoryPage(),
                                  )),
                                  (route) => false,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                })),
      )
    ]);
    // Stack(
    //   children: [
    //     PageView(

    //       /// [PageView.scrollDirection] defaults to [Axis.horizontal].
    //       /// Use [Axis.vertical] to scroll vertically.
    //       scrollDirection: Axis.horizontal,
    //       controller: controller,
    //       children: const <Widget>[
    //         Center(
    //           child: Text('First Page'),
    //         ),
    //         Center(
    //           child: Text('Second Page'),
    //         ),
    //       ],
    //     ),
    //     Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       //crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         SizedBox(
    //           width: double.infinity,
    //           child: Align(
    //             alignment: Alignment.center,
    //             child: SmoothPageIndicator(
    //               controller: controller,
    //               count: 2,
    //               effect: const SlideEffect(
    //                 dotWidth: 7,
    //                 dotHeight: 7,
    //                 activeDotColor: Styles.primaryColor,
    //                 dotColor: Styles.primaryLightColor,
    //               ),

    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ],

    // );
  }

  _listItem(BuildContext context, int index) {
    return Row(
      children: [
        //Изображение
        Container(
          width: 150,
          height: 100,
          child: FittedBox(
              fit: BoxFit.fill,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    topLeft: Radius.circular(100)),
                child: Image.network(
                    'https://wf.cdn.gmru.net/wiki/images/a/a1/Challenge_badge_firstPlacePTBPyramid3.png'),
              )),
        ),

        //Текст
        Column(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Title",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            )),
            Expanded(
                child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Content",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            )),
            Spacer(),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text(
                      "XP",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Title",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
