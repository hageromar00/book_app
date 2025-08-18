import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/Features/home/presentation/view_model/similar_book/similarbook_cubit.dart';
import 'package:book_app/Features/home/presentation/views/home/details_book/fetch_newset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsViews extends StatefulWidget {
  const DetailsViews({super.key,required this.model});
  final BookModel model;

  @override
  State<DetailsViews> createState() => _DetailsViewsState();
}

class _DetailsViewsState extends State<DetailsViews> {
  @override
  void initState() {
    BlocProvider.of<SimilarbookCubit>(context).SimilarBooks(cate: widget.model.volumeInfo!.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsBookBody(model: widget.model,),
    );
  }
}
