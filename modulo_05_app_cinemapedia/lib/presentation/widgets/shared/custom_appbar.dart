import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/constants/number_constants.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: NumberConstants.NUMBER_10.toDouble(),
          vertical: NumberConstants.NUMBER_5.toDouble(),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: color.primary),
              SizedBox(width: NumberConstants.NUMBER_5.toDouble()),
              Text('CinemaPedia', style: titleStyle),
              const Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ],
          ),
        ),
      ),
    );
  }
}
