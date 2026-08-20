import 'package:flutter/material.dart';
import 'package:share_prompt/constants/app_assets.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          return Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.hardEdge,
            children: [
              Positioned(
                top: height * 0.14,
                left: 0,
                width: width * 0.75,
                child: const _BackgroundAsset(
                  path: AppAssets.background2
                ),
              ),
              Positioned(
                top: height * 0.075,
                right: -width * 0.04,
                width: width * 0.72,
                child: const _BackgroundAsset(
                  path: AppAssets.background1
                ),
              ),
              Positioned.fill(
                child: SafeArea(child: body),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _BackgroundAsset extends StatelessWidget {
  const _BackgroundAsset({required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ExcludeSemantics(
        child: Image.asset(path, fit: BoxFit.contain),
      ),
    );
  }
}
