import 'package:chat_app/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chats')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final docs = snapshot.data!.docs;
        return ListView.builder(
          reverse: true,
          itemCount: docs.length,
          itemBuilder: (context, index) => MessageBubble(
            key: ValueKey(docs[index].id),
            message: docs[index]['text'],
            isMe:
                docs[index]['userId'] == FirebaseAuth.instance.currentUser!.uid,
            username: docs[index]['username'] ?? 'anonymous',
            imageUrl: docs[index]['imageUrl'],
          ),
        );
      },
    );
  }
}
