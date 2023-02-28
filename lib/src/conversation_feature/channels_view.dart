import 'package:flutter/material.dart';
import 'package:icechat/src/conversation.dart';
import 'package:icechat/src/widgets/profile_icon.dart';

class ChannelsView extends StatelessWidget {
  const ChannelsView({super.key, required this.channels});

  static const routeName = '/channels';

  final ChannelList channels;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Channels")),
      body: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final channel = channels[index];

            if (channel == null) {
              return null;
            }

            return Hero(
              tag: channel,
              child: ProfileIcon(
                icon: const Icon(Icons.person),
                state: channel.status,
                display: channel.display,
                showDisplay: true,
              ),
            );
          }),
    );
  }
}
