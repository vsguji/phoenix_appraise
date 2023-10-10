/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2023-08-31 14:41:55
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-10-10 13:01:33
 * @FilePath: /phoenix_appraise/lib/appraise_star_list_view.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';

import 'extension/appraise_assets.dart';

/// 描述: 星级评价列表，默认支持5个

class AppraiseStarListView extends StatefulWidget {
  /// 展示的星星的数目
  final int count;

  /// 未选中时的提示
  final String? hint;

  /// 星星下面的文案，点击对应的星星会显示相应index的文案，titles长度不能比count小
  final List<String> titles;

  /// 点击回调
  final ValueChanged<int>? onTap;

  AppraiseStarListView(
      {Key? key, this.count = 5, required this.titles, this.hint, this.onTap})
      : assert(count > 0 && count <= 5),
        assert(titles.length >= count),
        super(key: key);

  @override
  _AppraiseStarListViewState createState() => _AppraiseStarListViewState();
}

class _AppraiseStarListViewState extends State<AppraiseStarListView> {
  final Image _star = PhoenixTools.getAssetImage(AppraiseAssets.iconStarSize,
      gaplessPlayback: true, package: 'phoenix_appraise');

  final Image _selectedStar = PhoenixTools.getAssetImage(
      AppraiseAssets.iconStarSizeSelected,
      gaplessPlayback: true,
      package: 'phoenix_appraise');

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    if (widget.titles.isEmpty) {
      return _buildStars();
    } else {
      Widget subWidget = Container();
      String? subTitle = widget.hint;
      if (_selectedIndex >= 0 && _selectedIndex < widget.titles.length) {
        subTitle = widget.titles[_selectedIndex];
      }
      if (subTitle?.isNotEmpty ?? false) {
        subWidget = Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            subTitle ?? '',
            style: TextStyle(
                fontSize: 12.0,
                color: BaseThemeConfig.instance
                    .getConfig()
                    .commonConfig
                    .colorTextSecondary,
                fontWeight: FontWeight.w600),
          ),
        );
      }
      return Column(
        children: <Widget>[
          _buildStars(),
          subWidget,
        ],
      );
    }
  }

  Widget _buildStars() {
    List<Widget> list = [];
    for (int i = 0; i < widget.count; i++) {
      Widget item = GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(left: 6, right: 6, top: 4),
          child: (i <= _selectedIndex) ? _selectedStar : _star,
        ),
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!(i);
          }
          _selectedIndex = i;
        },
      );
      list.add(item);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list,
    );
  }
}
