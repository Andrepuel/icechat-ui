import 'package:flutter/material.dart';
import 'package:icechat/src/conversation.dart';

import 'src/app.dart';

void main() async {
  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.

  const gava = ContactMock(display: "Gava");
  const puel = ContactMock(display: "Puel");
  const conversas = ConversationsMock([
    ConversationMock(
      contacts: ContactListMock([]),
      message: MessageListMock([
        MessageMock(from: gava, text: "Olá"),
        MessageMock(from: puel, text: "Olá 2"),
      ]),
      name: "Gava",
      channels: ChannelListMock([
        ChannelMock(display: "Gava", status: Status.connected),
        ChannelMock(display: "Rogerio", status: Status.connecting),
        ChannelMock(display: "Outro", status: Status.connecting),
        ChannelMock(display: "Outro 2", status: Status.connecting),
        ChannelMock(display: "Outro 3", status: Status.connecting),
        ChannelMock(display: "Puel Mobile", status: Status.connected),
        ChannelMock(
            display: "Cara bem grande yada yada yada Puel Mobile",
            status: Status.connected),
      ]),
    )
  ]);

  const mockzao = MainMock(
    allChannels: ChannelListMock([]),
    allContacts: ContactListMock([gava, puel]),
    conversations: conversas,
  );

  runApp(const MyApp(
    main: mockzao,
  ));
}

class MainMock implements Main {
  const MainMock({
    required ChannelList allChannels,
    required ContactList allContacts,
    required ConversationList conversations,
  })  : _allChannels = allChannels,
        _allContacts = allContacts,
        _conversations = conversations;

  @override
  ChannelList get allChannels => _allChannels;
  final ChannelList _allChannels;

  @override
  ContactList get allContacts => _allContacts;
  final ContactList _allContacts;

  @override
  ConversationList get conversations => _conversations;
  final ConversationList _conversations;
}

class ConversationsMock implements ConversationList {
  const ConversationsMock(this._conversations);

  @override
  Conversation? operator [](int index) =>
      index < _conversations.length ? _conversations.elementAt(index) : null;
  final List<Conversation> _conversations;

  @override
  int get length => _conversations.length;
}

class ConversationMock implements Conversation {
  const ConversationMock({
    required String name,
    required ContactList contacts,
    required MessageList message,
    required ChannelList channels,
  })  : _contacts = contacts,
        _message = message,
        _name = name,
        _channels = channels;

  @override
  ContactList get contacts => _contacts;
  final ContactList _contacts;

  @override
  MessageList get messages => _message;
  final MessageList _message;

  @override
  String get name => _name;
  final String _name;

  @override
  ChannelList get channels => _channels;
  final ChannelList _channels;
}

class ContactListMock implements ContactList {
  const ContactListMock(this._contacts);

  @override
  Contact? operator [](int index) =>
      index < _contacts.length ? _contacts[index] : null;
  final List<Contact> _contacts;

  @override
  int get length => _contacts.length;
}

class ContactMock implements Contact {
  const ContactMock({required String display}) : _display = display;

  @override
  String get display => _display;
  final String _display;
}

class MessageListMock implements MessageList {
  const MessageListMock(this._messages);

  @override
  Message? operator [](int index) =>
      index < _messages.length ? _messages[index] : null;
  final List<Message> _messages;

  @override
  int get length => _messages.length;
}

class MessageMock implements Message {
  const MessageMock({
    required Contact from,
    required String text,
  })  : _from = from,
        _text = text;

  @override
  Contact get from => _from;
  final Contact _from;

  @override
  String get text => _text;
  final String _text;
}

class ChannelListMock implements ChannelList {
  const ChannelListMock(this._channels);

  @override
  Channel? operator [](int index) =>
      index < _channels.length ? _channels[index] : null;

  final List<Channel> _channels;

  @override
  int get length => _channels.length;
}

class ChannelMock implements Channel {
  const ChannelMock({
    required String display,
    required Status status,
  })  : _display = display,
        _status = status;

  @override
  String get display => _display;
  final String _display;

  @override
  Status get status => _status;
  final Status _status;
}
