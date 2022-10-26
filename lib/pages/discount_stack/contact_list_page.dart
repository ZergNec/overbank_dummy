import 'package:flutter/material.dart';
import '/pages/discount_stack/contact.dart';
import '/pages/discount_stack/contact_detail_screen.dart';
import '/pages/discount_stack/cards.dart';
import '/pages/discount_stack/perspective_list_view.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({super.key});

  @override
  ContactListPageState createState() => ContactListPageState();
}

class ContactListPageState extends State<ContactListPage> {
  int _visibleItems = 7;
  double _itemExtent = 200.0;

  @override
  Widget build(BuildContext context) {
    _itemExtent = MediaQuery.of(context).size.width * 0.93 / 1.7;
    return Column(
      children: [
        Container(
          //height: 340,
          height: MediaQuery.of(context).size.width * 0.87,
          child: PerspectiveListView(
            visualizedItems: _visibleItems,
            itemExtent: _itemExtent,
            initialIndex: 7,
            //initialIndex: Contact.contacts.length,
            //enableBackItemsShadow: true,
            //  backItemsShadowColor:
            //      Colors.black, // Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.all(20),
            onChangeFrontItem: (index) {
              print('_itemExtent (200) = $_itemExtent');
              print(
                  'height (340) = ${MediaQuery.of(context).size.width * 0.87}');
            },
            onTapFrontItem: (index) {
              final color = Colors.accents[index! % Colors.accents.length];
              Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (_) => ContactDetailScreen(
                    contact: Contact.contacts[index],
                    color: color,
                  ),
                ),
              );
            },
            children: List.generate(Contact.contacts.length, (index) {
              final borderColor = Colors.accents[index % Colors.accents.length];
              final contact = Contact.contacts[index];
              return ContactCard(
                borderColor: borderColor,
                contact: contact,
              );
            }),
          ),
        )
      ],
    );
  }
}
