import 'package:bookly_app/features/search/presentation/view_models/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_textfield.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_resault_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextfield(
            onSubmitted: (input) {
              if (input.isNotEmpty) {
                BlocProvider.of<SearchBooksCubit>(context)
                    .fetchSearchBooks(booktitle: input);
              }
            },
          ),
          SizedBox(height: 20.h),
          Text("search results",
              style: TextStyle(
                fontSize: 17.sp,
                color: Colors.grey,
              )),
          SizedBox(height: 10.h),
          const Expanded(
            child: SearchResaultListview(),
          ),
        ],
      ),
    );
  }
}
