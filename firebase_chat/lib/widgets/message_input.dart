import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessageInput extends StatefulWidget {
  const MessageInput({super.key});

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  late TextEditingController _messageController;

  @override
  void initState() {
    // TODO: implement initState
    _messageController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() async {
    FocusScope.of(context).unfocus();

    final userArgs = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    FirebaseFirestore.instance.collection('chats').add({
      'text': _messageController.text,
      'createdAt': Timestamp.now(),
      'userId': FirebaseAuth.instance.currentUser!.uid,
      'username': userArgs['username'],
      'imageUrl': userArgs['imageUrl'],
    });
    setState(() {
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            textCapitalization: TextCapitalization.sentences,
            autocorrect: true,
            enableSuggestions: true,
            controller: _messageController,
            decoration: const InputDecoration(labelText: 'Type here...'),
          )),
          IconButton(
            onPressed: _messageController.text.isNotEmpty ? _sendMessage : null,
            icon: const Icon(
              Icons.send,
            ),
            color: Theme.of(context).colorScheme.primary,
          )
        ],
      ),
    );
  }
}
