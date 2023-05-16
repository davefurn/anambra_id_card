import 'package:acmc/src/extension/size_config.dart';
import 'package:flutter/material.dart';

extension WidgetExtensionss on num {
  Widget get sbH => SizedBox(
        height: getProportionateScreenHeight(toDouble()),
      );

  Widget get sbW => SizedBox(
        width: getProportionateScreenWidth(toDouble()),
      );
}
