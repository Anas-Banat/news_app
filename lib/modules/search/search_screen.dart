import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/layout/news_app/cubit/cubit.dart';
import 'package:todo_app/layout/news_app/cubit/states.dart';
import 'package:todo_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    onChange: (value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Search must not be empty';
                      }
                      return null;
                    },
                    lable: 'Search',
                    prefix: Icons.search),
              ),
              Expanded(
                child: articleBuilder(NewsCubit.get(context).search, context),
              ),
            ],
          ),
        );
      },
    );
  }
}
