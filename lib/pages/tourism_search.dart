import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jody/cubit/search_cubit.dart';
import 'package:jody/views/tourism_search_view.dart';

class TourismSearch extends StatelessWidget {
  const TourismSearch({super.key});
@override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        body: TourismSearchView(),
      ),
    );
  }
}
