import 'package:atele_online/core/utils/app_colors.dart';
import 'package:atele_online/feature/reservations/presentation/widget/utils.dart';
import 'package:flutter/material.dart';

class CustomSliderThem extends StatefulWidget {
  CustomSliderThem({super.key, required this.indexTop});
  int indexTop;
  @override
  State<CustomSliderThem> createState() => _CustomSliderThemState();
}

class _CustomSliderThemState extends State<CustomSliderThem> {
  final Color activeColor = AppColors.blackColor;

  final Color inActiveColor = Colors.grey;

  final double thumReduies = 15;

  final double tickMarkReduies = 14;

  double valu = 0;

  @override
  Widget build(BuildContext context) {
    final labels = ['Appointment', 'ChackOut'];
    return customSlider(labels);
  }

  Column customSlider(List<String> labels) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: Utils.modelBuilder(labels, (index, labels) {
              const selectedColor = Colors.black;
              const unselectedColor = Colors.grey;

              final isSelected = index <= widget.indexTop;

              final color = isSelected ? selectedColor : unselectedColor;
              return buildLabel(label: labels, width: 30, color: color);
            }),
          ),
        ),
        SliderTheme(
            data: SliderThemeData(
                trackHeight: 5,
                inactiveTickMarkColor: inActiveColor,
                inactiveTrackColor: inActiveColor,
                thumbColor: activeColor,
                activeTickMarkColor: activeColor,
                activeTrackColor: activeColor,
                thumbShape: RoundSliderThumbShape(
                  disabledThumbRadius: thumReduies,
                  enabledThumbRadius: thumReduies,
                ),
                rangeThumbShape: RoundRangeSliderThumbShape(
                    disabledThumbRadius: thumReduies,
                    enabledThumbRadius: thumReduies),
                tickMarkShape:
                    RoundSliderTickMarkShape(tickMarkRadius: tickMarkReduies)),
            child: Slider(
                max: 2,
                min: 0,
                //label: valu.round().toString(),
                divisions: 1,
                value: widget.indexTop.toDouble(),
                onChanged: (value) => widget.indexTop = value.toInt())),
      ],
    );
  }
}

Widget buildLabel({
  required String label,
  required double width,
  required Color color,
}) =>
    Text(
      label,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ).copyWith(color: color),
    );
