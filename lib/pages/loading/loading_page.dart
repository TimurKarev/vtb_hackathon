import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vtb_hackathon/pages/8/start_page.dart';
import 'package:vtb_hackathon/pages/loading/loading_cubit.dart';
import 'package:vtb_hackathon/pages/loading/on_boarding_page.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoadingCubit(),
      child: BlocBuilder<LoadingCubit, LoadingState>(builder: (context, state) {
        if (state is LoadingInitial) {
          BlocProvider.of<LoadingCubit>(context).loadApp();
          return SvgPicture.asset('assets/svg/loading.svg');
        } else if (state is FirstTimeStart) {
          return const StartPage();
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Container()),
              (Route<dynamic> route) => false);
        }
        return SvgPicture.asset('assets/svg/loading.svg');
      }),
    );
  }
}
