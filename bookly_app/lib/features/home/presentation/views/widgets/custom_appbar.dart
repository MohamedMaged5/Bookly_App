import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Row(
        children: [
          Image(
            image: const AssetImage(AssetsData.logo),
            height: 16.h,
            width: 75.w,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const SearchView();
                },
              ));
            },
            icon: Icon(
              Icons.search,
              size: 25.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
