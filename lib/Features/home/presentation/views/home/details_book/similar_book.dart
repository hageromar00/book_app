import 'package:book_app/Features/home/presentation/view_model/similar_book/similarbook_cubit.dart';
import 'package:book_app/Features/home/presentation/views/home/widget/Custom_image.dart';
import 'package:book_app/core/utils/help_launch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBook extends StatelessWidget {
  const SimilarBook({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarbookCubit, SimilarbookState>(
      builder: (context, state) {
        if (state is SimilarbookSuccess) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * .199,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: GestureDetector(
                      onTap: () async {
                        // launchCustomURL(context,
                        //     state.books[index].volumeInfo!.previewLink!);
                      },
                      child: CustomImage(
                        image: state
                            .books[index].image ?? '',
                      ),
                    ),
                  );
                }),
          );
        } else if (state is SimilarbookIFail) {
          return const Text('there is arror');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
