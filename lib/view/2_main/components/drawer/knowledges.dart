import 'package:flutter/material.dart';

import 'knowledge.dart';

class Knowledges extends StatelessWidget {
  const Knowledges({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Knowledge',
            style: TextStyle(color: Colors.white),
          ),
        ),
        KnowledgeText(knowledge: 'Flutter, Dart,Swift,Kotlin'),
        KnowledgeText(knowledge: 'REST APIs, Postman,Flavors'),
        KnowledgeText(knowledge: 'Call SDKs (Vonage, Telnyx, etc)'),
        KnowledgeText(knowledge: 'Firebase (Auth, Firestore, FCM, Analytics)'),
        KnowledgeText(knowledge: 'Firebase (Google Maps, Stripe, Converge)'),
        KnowledgeText(knowledge: 'Firebase (Agile, Scrum methodology)'),
        KnowledgeText(knowledge: 'Github'),
      ],
    );
  }
}
