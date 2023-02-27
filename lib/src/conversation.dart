abstract class Main {
  ConversationList get conversations;
  ContactList get allContacts;
  ChannelList get allChannels;
}

abstract class LazyList<T> {
  T? operator [](int index);
  int get length;
}

typedef ConversationList = LazyList<Conversation>;

abstract class Conversation {
  String get name;
  ContactList get contacts;
  MessageList get messages;
  ChannelList get channels;
}

typedef ContactList = LazyList<Contact>;

abstract class Contact {
  String get display;
}

typedef MessageList = LazyList<Message>;

abstract class Message {
  Contact get from;
  String get text;
}

typedef ChannelList = LazyList<Channel>;

abstract class Channel {
  Status get status;
  String get display;
}

enum Status {
  connecting,
  connected,
}
