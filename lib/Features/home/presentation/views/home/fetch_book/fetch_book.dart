import 'package:book_app/Features/home/domain/entity/book_entity.dart';
import 'package:book_app/Features/home/presentation/view_model/fetch_book/fetchbook_cubit.dart';
import 'package:book_app/Features/home/presentation/views/home/widget/Custom_image.dart';
import 'package:book_app/core/utils/help_launch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchBook extends StatefulWidget {
  const FetchBook({super.key, required this.books});
  final List<BookEntity> books;
  @override
  State<FetchBook> createState() => _FetchBookState();
}

class _FetchBookState extends State<FetchBook> {
  late List<BookEntity> book = [];
  late ScrollController scrollController;
  int NextPage = 1;
  bool isLoad = false;
  @override
  void initState() {
    book = widget.books;
    scrollController = ScrollController();
    scrollController.addListener(() {
      var currentPosition = scrollController.position.pixels;
      var MaxScrollLength = scrollController.position.maxScrollExtent;
      if (currentPosition >= MaxScrollLength * .7) {
        if (!isLoad) {
          isLoad = true;
          BlocProvider.of<FetchbookCubit>(context)
              .FetchFeatureBook(pageNumber: NextPage++);
          isLoad = false;
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .3,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: book.length,
          controller: scrollController,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                 launchCustomURL(context,book[index].previewLink);
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
                  image: book[index].image ?? '',
                ),
              ),
            );
          }),
    );
    ;
  }
}
// class FetchBook extends StatelessWidget {
//   const FetchBook({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FetchbookCubit, FetchbookState>(
//       builder: (context, state) {
//         if (state is FetchbookSuccess) {
//           return SizedBox(
//             height: MediaQuery.sizeOf(context).height * .3,
//             child: ListView.builder(
//                 physics: const BouncingScrollPhysics(),
//                 scrollDirection: Axis.horizontal,
//                 itemCount: state.books.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () async {
//                       launchCustomURL(context, state.books[index].previewLink);
//                       // final Uri _url = Uri.parse(
//                       //     state.books[index].volumeInfo!.previewLink!);
//                       // if (!await launchUrl(_url)) {
//                       //   throw Exception('Could not launch $_url');
//                       // }
//                       // GoRouter.of(context).push(AppRouter.ksimilar,extra: state.books[index]);
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: CustomImage(
//                         image: state.books[index].image ?? '',
//                       ),
//                     ),
//                   );
//                 }),
//           );
//         } else if (state is FetchbookFail) {
//           return const Text('there is error');
//         } else {
//           return const Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }
