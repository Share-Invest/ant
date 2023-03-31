import 'package:flutter/material.dart';

class CenterCircularProgressIndicator extends StatelessWidget {
  const CenterCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation(
            Colors.deepPurpleAccent,
          ),
        ),
      );
}
