import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MedHistory extends StatelessWidget {
  const MedHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 69.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.w),
          child: Text(
            "Orders History",
            style: GoogleFonts.nunito(
                fontSize: 25.sp, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
      ],
    );
  }
}
