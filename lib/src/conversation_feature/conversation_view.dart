import 'package:flutter/material.dart';
import 'package:icechat/src/conversation.dart';
import 'package:icechat/src/conversation_feature/channels_view.dart';
import 'package:icechat/src/widgets/profile_icon.dart';

class ConversationView extends StatelessWidget {
  const ConversationView({super.key, required this.conversation});

  static const routeName = '/conversation';

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(conversation.name),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: Iterable.generate(conversation.channels.length).map(
                    (index) {
                      final channelOpt = conversation.channels[index];
                      assert(channelOpt != null);
                      final channel = channelOpt!;

                      return Hero(
                        tag: channel,
                        child: ProfileIcon(
                          icon: const Icon(Icons.person),
                          state: channel.status,
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              IconButton(
                onPressed: () {
                  const int fixme = 0;
                  Navigator.restorablePushNamed(context, ChannelsView.routeName,
                      arguments: fixme);
                },
                icon: const Icon(Icons.expand),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final message = conversation.messages[index];
                if (message == null) {
                  return null;
                }

                return Text("${message.from.display}: ${message.text}");
              },
            ),
          ),
        ],
      ),
    );
  }
}
