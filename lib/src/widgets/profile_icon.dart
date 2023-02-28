import 'package:flutter/material.dart';
import 'package:icechat/src/conversation.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    super.key,
    required this.icon,
    this.state,
    this.display = "",
    this.showDisplay = false,
  });

  final Icon icon;
  final Status? state;
  final String display;
  final bool showDisplay;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: showDisplay ? null : 36,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Row(
            children: [
              _icon(),
              Material(
                color: Colors.transparent,
                child: Text(display),
              )
            ],
          ),
        ),
      ),
    );
  }

  Stack _icon() {
    return Stack(children: [
      Container(
        margin: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 4,
        ),
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 224, 224, 224),
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
