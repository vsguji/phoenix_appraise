/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2023-09-13 20:09:03
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-09-24 22:09:43
 * @FilePath: /phoenix_appraise/lib/appraise_emoji_list_view.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2023-09-13 20:09:03
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-09-24 21:54:30
 * @FilePath: /phoenix_appraise/lib/appraise_emoji_list_view.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';

import 'appraise_emoji_item.dart';
import 'appraise_interface.dart';

/// 描述: 表情评价列表
///       最多支持5个表情，默认也是5个，支持选择任意个数，
///       传入@indexes就可以选择想要的任意位置的表情了
//ignore: must_be_immutable
class AppraiseEmojiListView extends StatefulWidget {
  /// 所需表情包的index列表，index最大值为4
  final List<int> indexes;

  /// 自定义文案，list长度为5，不足5个时请在对应位置补空字符串
  List<String>? titles;

  /// 点击回调
  final AppraiseIconClick? onTap;

  /// create BrnAppraiseEmojiListView
  AppraiseEmojiListView(
      {Key? key, this.indexes = const [0, 1, 2, 3, 4], this.titles, this.onTap})
      : assert(indexes.isNotEmpty),
        super(key: key) {
    titles ??= BrnIntl.currentResource.appriseLevel;
    assert(titles != null && titles!.length == 5);
  }

  @override
  _AppraiseEmojiListViewState createState() =>
      _AppraiseEmojiListViewState();
}

class _AppraiseEmojiListViewState extends State<AppraiseEmojiListView> {
  /// 未选中表情，灰色
  final List _unselectedIcons = [
    BaseAsset.iconAppraiseBadUnselected,
    BaseAsset.iconAppraiseNotGoodUnselected,
    BaseAsset.iconAppraiseOkUnselected,
    BaseAsset.iconAppraiseGoodUnselected,
    BaseAsset.iconAppraiseSurpriseUnselected,
  ];

  /// 默认表情，黄色
  final List _defaultIcons = [
    BaseAsset.iconAppraiseBadDefault,
    BaseAsset.iconAppraiseNotGoodDefault,
    BaseAsset.iconAppraiseOkDefault,
    BaseAsset.iconAppraiseGoodDefault,
    BaseAsset.iconAppraiseSurpriseDefault,
  ];

  /// 选中表情，gif
  final List _selectedIcons = [
    BaseAsset.iconAppraiseBadSelected,
    BaseAsset.iconAppraiseNotGoodSelected,
    BaseAsset.iconAppraiseOkSelected,
    BaseAsset.iconAppraiseGoodSelected,
    BaseAsset.iconAppraiseSurpriseSelected,
  ];

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    if (widget.indexes.isEmpty) {
      return const SizedBox.shrink();
    }

    List<AppraiseEmojiItem> list = [];
    for (int i = 0; i < widget.indexes.length; i++) {
      list.add(AppraiseEmojiItem(
        selectedName: _selectedIcons[widget.indexes[i]],
        unselectedName: _unselectedIcons[widget.indexes[i]],
        defaultName: _defaultIcons[widget.indexes[i]],
        index: i,
        padding:
            EdgeInsets.symmetric(horizontal: 7.0 * (6 - widget.indexes.length)),
        selectedIndex: _selectedIndex,
        title: widget.titles![widget.indexes[i]],
        onTap: (index) {
          _selectedIndex = index;
          if (widget.onTap != null) {
            widget.onTap!(_selectedIndex);
          }
        },
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list,
    );
  }
}
