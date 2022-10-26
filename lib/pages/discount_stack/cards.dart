import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:overbank/constants.dart';
import '/pages/discount_stack/contact.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.borderColor,
    required this.contact,
  });

  final Color borderColor;
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    const TextStyle txt20 = TextStyle(
        fontFamily: 'Inter-regular',
        color: majorColor,
        fontSize: 20,
        fontWeight: FontWeight.w400);

    const TextStyle txt14 = TextStyle(
        fontFamily: 'Inter-regular',
        color: majorColor,
        fontSize: 14,
        fontWeight: FontWeight.w400);

    // return Hero(

    //   tag: contact.name,
    return SizedBox(
      child: Material(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //-----------------------------
            // Card Tab
            //-----------------------------
            // Align(
            //   heightFactor: .9,
            //   alignment: Alignment.centerLeft,
            //   child: Container(height: 30, width: 70,
            //     decoration: BoxDecoration(
            //       color: borderColor,
            //       borderRadius: const BorderRadius.vertical(
            //         top: Radius.circular(10)),
            //     ),
            //     child: const Icon(Icons.add, color: Colors.white))),
            //-----------------------------
            // Card Body
            //-----------------------------
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                  //color: borderColor,
                  // color: majorColor,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                        spreadRadius: 1,
                        offset: Offset(1, -1))
                  ],
                ),
                //-----------------------------
                // Card Body
                //-----------------------------
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/card_photos/${contact.number}.jpg'),
                        fit: BoxFit.fill,
                        opacity: 0.6),
                    color: bgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //---------------------------
                      // Name and Role
                      //---------------------------
                      Row(
                        children: [
                          SizedBox(width: 20),
                          Flexible(
                            child: Text.rich(
                                TextSpan(
                                  text: contact.name,
                                  style: txt20,
                                  children: [
                                    TextSpan(
                                        text: '\n\n${contact.role}',
                                        style: txt20)
                                  ],
                                ),
                                style: txt20),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      //---------------------------
                      // Address
                      //---------------------------
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Text(contact.address, style: txt20)
                        ],
                      ),
                      //---------------------------
                      // Phone Number
                      //---------------------------
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Text(contact.phone, style: txt20)
                        ],
                      ),
                      SizedBox(height: 10),
                      //---------------------------
                      // eMail
                      //---------------------------
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(contact.email, style: txt14),
                                ),
                                Text(contact.website, style: txt14),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
