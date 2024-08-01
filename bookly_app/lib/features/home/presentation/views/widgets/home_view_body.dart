import 'package:bookly_app/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_listview.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedbooks();
        return BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks();
      },
      color: Colors.white,
      backgroundColor: Colors.transparent,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppbar(),
                  const FeaturedListView(),
                  SizedBox(height: 40.h),
                  Text("Newest Books",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:
                SizedBox(height: 1.54.sh, child: const NewestBooksListview()),
          ),
        ],
      ),
    );
  }
}
