import 'package:flutter/material.dart';
import 'package:icechat/src/conversation.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    super.key,
    required this.icon,
    this.state,
  });

  final Icon icon;
  final Status? state;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 4,
        ),
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 224, 224, 224),
          borderRadius: BorderRadius.circular(16),
        ),
        child: icon,
      ),
      if (state != null)
        Positioned(
          bottom: 0,
          right: 4,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: state == Status.connected ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
    ]);
  }
}
