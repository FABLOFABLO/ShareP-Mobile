import 'package:flutter/material.dart';

class OnBording1 extends StatelessWidget {
  const OnBording1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: AlignmentGeometry.topCenter,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/on_bording_logo.png'),
                    const SizedBox(height: 30),
                    const Text(
                      '좋은 프롬프트를 나누고,\nAI와 함께 더 멋진 결과물을 만들어요',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF4B5563)),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('●', style: TextStyle(color: Color(0xFF6B4EFE), fontSize: 20),),
                      Text('●', style: TextStyle(color: Color(0xFFE5E7EB), fontSize: 20), ),
                      Text('●', style: TextStyle(color: Color(0xFFE5E7EB), fontSize: 20),),
                      Text('●', style: TextStyle(color: Color(0xFFE5E7EB), fontSize: 20),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                          color: const Color(0xFF6B4EFE),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            '다음',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
