import 'package:acmc/src/extension/size_config.dart';
import 'package:acmc/src/model/model.dart';
import 'package:acmc/src/utils/extension/string_extension.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:flutter/cupertino.dart';

class StatisticsCard extends StatefulWidget {
  final String title;
  final String description;
  final List<StatisticsPair> pairs;
  const StatisticsCard({
    super.key,
    required this.description,
    required this.pairs,
    required this.title,
  });

  @override
  State<StatisticsCard> createState() => _StatisticsCardState();
}

class _StatisticsCardState extends State<StatisticsCard> {
  @override
  void initState() {
    super.initState();
    assert(widget.pairs.length == 3);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: getProportionateScreenHeight(12),
        bottom: getProportionateScreenHeight(12),
        left: getProportionateScreenWidth(16),
        right: getProportionateScreenWidth(50),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFBCC2CC),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Text(
            widget.description,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: '#A5AAB2'.toColor(),
            ),
          ),
          8.sbH,
          ...widget.pairs
              .map(
                (e) => Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${e.name}: ',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '${e.value}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
