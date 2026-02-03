import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/ui/home/home_view_model.dart';
import 'package:tasks/ui/detail/to_do_detail_page.dart';
import 'package:tasks/domain/entity/to_do_entity.dart';
import 'package:tasks/ui/home/widgets/to_do_view_item.dart';

class TodoView extends ConsumerWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    return ListView.builder(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 200),
      itemCount: state.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TodoDetailPage(id: state[index].id),
              ),
            );
          },
          child: TodoViewitem(id: state[index].id),
        );
      },
    );
  }
}
