import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/constants/size_constants.dart';
import '../../common/extensions/size_extension.dart';
import '../../common/screenutil/screenutil.dart';
import 'logo.dart';

class MovieAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil.statusBarHeight + Sizes.dimen_4,
        left: Sizes.dimen_16.w,
        right: Sizes.dimen_16.w,
      ),
      child: Row(
        children: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/svgs/menu.svg",
              height: Sizes.dimen_12.h,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          Expanded(
            child: const Logo(
              height: Sizes.dimen_14,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: Sizes.dimen_12.h,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
