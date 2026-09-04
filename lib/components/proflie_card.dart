import 'package:flutter/material.dart';
import 'package:share_prompt/constants/app_color.dart';
import 'package:share_prompt/constants/app_text_style.dart';

class ProflieCard extends StatefulWidget {
  final String name;
  final int promptCount;
  final int followerCount;
  final int followingCount;

  const ProflieCard({
    super.key,
    required this.name,
    required this.promptCount,
    required this.followerCount,
    required this.followingCount,
  });

  @override
  State<ProflieCard> createState() => _ProflieCardState();
}

class _ProflieCardState extends State<ProflieCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Container(
        child: Row(
          children: [
            CircleAvatar(
              radius: 45,
              backgroundColor: AppColor.gray50,
              child: Icon(Icons.person, size: 70, color: AppColor.white),
            ),
            const SizedBox(width: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [Text(widget.name, style: AppTextStyles.title3)]),
                const SizedBox(height: 5),
                Row(
                  spacing: 30,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('프롬프트', style: AppTextStyles.body5),
                        Text(
                          '${widget.promptCount}개',
                          style: AppTextStyles.body3Bold,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('팔로워', style: AppTextStyles.body5),
                        Text(
                          '${widget.followerCount}명',
                          style: AppTextStyles.body3Bold,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('팔로잉', style: AppTextStyles.body5),
                        Text(
                          '${widget.followingCount}명',
                          style: AppTextStyles.body3Bold,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
