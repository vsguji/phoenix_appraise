import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';

import 'appraise.dart';
import 'appraise_config.dart';
import 'appraise_header.dart';
import 'appraise_interface.dart';

/// 描述: 评价组件bottom picker，
/// 对BrnAppraise做了一层封装，可直接使用在showDialog里面

class AppraiseBottomPicker extends StatefulWidget {
  /// 标题
  final String title;

  /// 标题类型
  final AppraiseHeaderType headerType;

  /// 评分组件类型，分为表情包和星星，默认星星
  final AppraiseType type;

  /// 自定义文案
  /// 若评分组件为表情，则list长度为5，不足5个时请在对应位置补空字符串
  /// 若评分组件为星星，则list长度不能比count小
  final List<String>? iconDescriptions;

  /// 标签
  final List<String>? tags;

  ///输入框允许提示文案
  final String inputHintText;

  /// 提交按钮的点击回调
  final AppraiseConfirmClick? onConfirm;

  /// 评价组件的配置项
  final AppraiseConfig config;

  /// create BrnAppraiseBottomPicker
  AppraiseBottomPicker({
    Key? key,
    this.title = '',
    this.headerType = AppraiseHeaderType.spaceBetween,
    this.type = AppraiseType.star,
    this.iconDescriptions,
    this.tags,
    this.inputHintText = '',
    this.onConfirm,
    this.config = const AppraiseConfig(),
  }) : super(key: key);

  @override
  _AppraiseBottomPickerState createState() => _AppraiseBottomPickerState();
}

class _AppraiseBottomPickerState extends State<AppraiseBottomPicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0x99000000),
      body: Container(
        alignment: Alignment.bottomCenter,
        child: Appraise(
          title: widget.title,
          headerType: widget.headerType,
          type: widget.type,
          iconDescriptions: widget.iconDescriptions ??
              BrnIntl.of(context).localizedResource.appriseLevel,
          tags: widget.tags,
          inputHintText: widget.inputHintText,
          onConfirm: (index, list, input) {
            if (widget.onConfirm != null) {
              widget.onConfirm!(index, list, input);
            }
          },
          config: widget.config,
        ),
      ),
    );
  }
}
