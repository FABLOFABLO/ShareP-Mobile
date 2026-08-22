import 'package:flutter/material.dart';
import 'package:share_prompt/constants/app_color.dart';
import 'package:share_prompt/constants/app_text_style.dart';

class AppBottomNavigationbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavigationbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 70,
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Positioned(
                left: -45,
                right: -45,
                top: 0,
                bottom: -40,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.gray10,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(80),
                      topRight: Radius.circular(80),
                    ),
                    border: Border.all(
                      width: 1,
                      color: AppColor.gray50,
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _item(
                    index: 0,
                    icon: Icons.search,
                    label: '검색',
                  ),

                  const SizedBox(width: 33),

                  _item(
                    index: 1,
                    icon: currentIndex == 1
                        ? Icons.home
                        : Icons.home_outlined,
                    label: '홈',
                  ),

                  const SizedBox(width: 40),

                  _item(
                    index: 2,
                    icon: currentIndex == 2
                        ? Icons.person_2
                        : Icons.person_2_outlined,
                    label: '마이페이지',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _item({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final selected = currentIndex == index;
    final color = selected
        ? AppColor.primary
        : AppColor.gray50;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(index),
      child: SizedBox(
        width: 80,
        height: 80,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 33,
            ),
            Text(
              label,
              style: AppTextStyles.body4.copyWith(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}