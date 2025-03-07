import 'package:bookia/core/constants/assets-manager.dart';
import 'package:bookia/core/extensions/navigator.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feature/home/presentation/pages/book_details.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookContainer extends StatelessWidget {
  const BookContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.pushTo(BookDetails());
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.borderColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Image.asset(
                AssetsManager.book,
              ),
            ),
            Gap(8),
            Expanded(
              flex: 1,
              child: Text(
                'The Republic',
                style: getSmallTextStyle(),
              ),
            ),
            Row(
              children: [
                Text(
                  '\$285',
                  style: getSmallTextStyle(),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: (){}, 
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 27),
                    backgroundColor: AppColors.darkColor,
                   shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                   ), 
                  ),
                  child: Text(
                    'Buy',
                    style: getSmallTextStyle().copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
