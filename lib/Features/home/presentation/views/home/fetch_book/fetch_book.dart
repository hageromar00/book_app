import 'package:book_app/Features/home/presentation/view_model/fetch_book/fetchbook_cubit.dart';
import 'package:book_app/Features/home/presentation/views/home/widget/Custom_image.dart';
import 'package:book_app/core/utils/help_launch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchBook extends StatelessWidget {
  const FetchBook({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchbookCubit, FetchbookState>(
      builder: (context, state) {
        if (state is FetchbookSuccess) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * .3,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      launchCustomURL(context, state.books[index].previewLink);
                      // final Uri _url = Uri.parse(
                      //     state.books[index].volumeInfo!.previewLink!);
                      // if (!await launchUrl(_url)) {
                      //   throw Exception('Could not launch $_url');
                      // }
                      // GoRouter.of(context).push(AppRouter.ksimilar,extra: state.books[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomImage(
                        image: state.books[index].image ?? '',
                      ),
                    ),
                  );
                }),
          );
        } else if (state is FetchbookFail) {
          return const Text('there is error');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
