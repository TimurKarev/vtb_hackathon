import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtb_hackathon/pages/8/start_page.dart';
import 'package:vtb_hackathon/pages/home/home_page.dart';
import 'package:vtb_hackathon/pages/loading/loading_viewmodel.dart';
import 'package:vtb_hackathon/pages/loading/on_boarding_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingPage extends ConsumerWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final viewModel = watch(loadingVMProvider);
    if (viewModel.loadState == LoadingStateEnum.loading) {
      return SvgPicture.asset('assets/svg/loading.svg');
    } else if (viewModel.loadState == LoadingStateEnum.multiTime) {
      return const HomePage();
    } else {
      return const OnBoardingPage();
    }
  }
}
