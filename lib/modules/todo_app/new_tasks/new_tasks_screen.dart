import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/components/components.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';

class NewTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // We add "Consumer" without "Build" coz we already add it in home page
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).newTasks;
        return tasksBuilder(tasks: tasks);
        // ConditionalBuilder(
        //   condition: tasks.length > 0,
        //   builder: (context) => ListView.separated(
        //     itemBuilder: (context, index) =>
        //         buildTaskItem(tasks[index], context),
        //     separatorBuilder: (context, index) => Padding(
        //       padding: const EdgeInsetsDirectional.only(
        //         start: 20.0,
        //       ),
        //       child: Container(
        //         width: double.infinity,
        //         height: 1.0,
        //         color: Colors.grey[300],
        //       ),
        //     ),
        //     itemCount: tasks.length,
        //   ),
        //   fallback: (context) => Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Icon(
        //           Icons.menu,
        //           size: 100,
        //           color: Colors.grey,
        //         ),
        //         Text(
        //           'There is No Tasks Yet, Please Add a New Task',
        //           style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //             fontSize: 16,
        //             color: Colors.grey,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // );
      },
    );
  }
}
