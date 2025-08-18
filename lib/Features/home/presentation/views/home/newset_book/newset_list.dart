import 'package:book_app/Features/home/presentation/view_model/newset_book/newestbook_cubit.dart';
import 'package:book_app/Features/home/presentation/views/home/newset_book/newset_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsetList extends StatelessWidget {
  const NewsetList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestbookCubit, NewestbookState>(
      builder: (context, state) {
        if (state is NewestbookFail) {
          return const Text('there is error');
        }
        if (state is NewestbookSuccess) {
          return ListView.builder(
              // shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: NewsetItem(model: state.books[index]),
                );
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
    // return BlocBuilder<NewestbookCubit, NewestbookState>(
    //   builder: (context, state) {
    //    if (state is NewestbookFail) {
    //       return const Text('there is error');
    //     }
    //     if (state is NewestbookSuccess) {
    //       print('hhi');
    //       return ListView.builder(
    //           physics: const NeverScrollableScrollPhysics(),
    //           padding: EdgeInsets.zero,
    //           itemCount: state.books.length,
    //           itemBuilder: (context, index) {
    //             return Padding(
    //               padding:
    //                   const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    //               child: NewsetItem(
    //                 model: state.books[index],
    //               ),
    //             );
    //           });
    //     }  else {
    //       return const Center(child: CircularProgressIndicator());
    //     }
    //   },
    // );
  }
}
