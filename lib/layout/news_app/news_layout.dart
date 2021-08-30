// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_projects/all_app_cubit/cubit.dart';
import 'package:udemy_projects/layout/news_app/cubit/cubit.dart';
import 'package:udemy_projects/layout/news_app/cubit/states.dart';
import 'package:udemy_projects/modules/news_app/search/search_Screen.dart';
import 'package:udemy_projects/shared/components/components.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text('Home News '),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(
                    context,
                    SearchScreen(),
                  );
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  AllAppCubit.get(context).changeAppMode();
                },
                icon: Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomItems,
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
