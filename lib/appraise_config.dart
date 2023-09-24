/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2023-09-13 20:09:03
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-09-24 22:09:35
 * @FilePath: /phoenix_appraise/lib/appraise_config.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:phoenix_input/phoenix_input.dart';

import 'appraise_interface.dart';

class AppraiseConfig {
  /// 是否显示标题和关闭
  final bool showHeader;

  /// 标题的padding
  final EdgeInsets? headerPadding;

  /// 标题的最大行数
  final int titleMaxLines;

  /// 取消的回调
  final AppraiseCloseClickCallBack? onCancel;

  /// 所需表情包的index列表，index最大值为4
  final List<int> indexes;

  /// 展示的星星的数目
  final int count;

  /// 展示星星时的默认提示
  final String starAppraiseHint;

  /// 标签是否支持多选，默认为 true
  final bool multiSelect;

  /// 每行能显示的tag数目，默认为 2
  final int tagCountEachRow;

  ///是否显示输入框，默认为 true
  final bool showTextInput;

  ///输入框允许输入的最大长度，默认为 100
  final int maxLength;

  ///提示文案的最大行数，默认为1
  final int maxHintLines;

  /// 输入框默认输入文案
  final String? inputDefaultText;

  /// 输入框的最大高度，默认为 120
  final double inputMaxHeight;

  /// 是否显示确认按钮
  final bool showConfirmButton;

  /// 确认按钮的文案，默认 '提交'
  final String? confirmButtonText;

  /// 外部控制提交button的enable状态,null有效，不设置默认值
  final bool? isConfirmButtonEnabled;

  /// 点击icon的回调
  final AppraiseIconClick? iconClickCallback;

  /// 输入框改变的回调
  final InputTextChangeCallback? inputTextChangeCallback;

  /// 选择标签的回调
  final AppraiseTagClick? tagSelectCallback;

  /// create BrnAppraiseConfig
  const AppraiseConfig({
    this.showHeader = true,
    this.headerPadding,
    this.titleMaxLines = 1,
    this.onCancel,
    this.indexes = const [0, 1, 2, 3, 4],
    this.count = 5,
    this.starAppraiseHint = '',
    this.multiSelect = true,
    this.tagCountEachRow = 2,
    this.showTextInput = true,
    this.maxLength = 100,
    this.maxHintLines = 1,
    this.inputDefaultText,
    this.inputMaxHeight = 120,
    this.showConfirmButton = true,
    this.confirmButtonText,
    this.isConfirmButtonEnabled,
    this.iconClickCallback,
    this.inputTextChangeCallback,
    this.tagSelectCallback,
  });
}

/// 评价组件类型
enum AppraiseType {
  /// 表情包评价组件
  emoji,

  /// 星星评价组件
  star,
}
