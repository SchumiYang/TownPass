import 'package:flutter/material.dart';
import 'package:town_pass/gen/assets.gen.dart';
import 'package:town_pass/page/city_service/model/my_service_model.dart';
import 'package:town_pass/page/city_service/widget/official_service_card/official_service_card.dart';
import 'package:town_pass/util/tp_colors.dart';
import 'package:town_pass/util/tp_constant.dart';
import 'package:town_pass/util/tp_route.dart';
import 'package:town_pass/util/tp_text.dart';

/// 服務頁四卡左上：好行（HowGo 無障礙導航）。取代原本的「市政服務」卡。
///
/// 版面：主色底，左上「好行 / How GO?」，右下插圖。
class OfficialServiceCardTopLeft extends OfficialServiceCard {
  const OfficialServiceCardTopLeft({super.key});

  @override
  Widget layoutBuild(BuildContext context, BoxConstraints constraint) {
    final double cardHeight = constraint.maxWidth / goldenRatio;
    final double illustrationWidth = constraint.maxWidth * 0.58;

    return Semantics(
      button: true,
      label: '好行 How GO? 無障礙導航',
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () async => await TPRoute.openUri(
          uri: howGoUrl,
          forceTitle: '好行',
        ),
        child: Container(
          height: cardHeight,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: TPColors.primary500,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Positioned(
                right: 6.0,
                bottom: 8.0,
                width: illustrationWidth,
                child: Assets.image.howgoCard.image(
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomRight,
                ),
              ),
              const Positioned(
                left: 14.0,
                top: 14.0,
                child: Column(
                  spacing: 2.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TPText(
                      '好行',
                      style: TPTextStyles.h2SemiBold,
                      color: TPColors.white,
                    ),
                    TPText(
                      'How GO?',
                      style: TPTextStyles.bodyRegular,
                      color: TPColors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
