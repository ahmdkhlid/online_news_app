// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_projects/layout/news_app/cubit/cubit.dart';
import 'package:udemy_projects/layout/news_app/cubit/states.dart';
import 'package:udemy_projects/shared/components/components.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        dynamic list = NewsCubit.get(context).science;
        return articleBuilder(list, context);
      },
    );
  }
}
