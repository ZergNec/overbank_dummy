import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:overbank/constants.dart';
import '/pages/discount_stack/contact.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '/pages/pageAddDCard.dart';

Widget DiscountCardBack(BuildContext context, Contact contact) {
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
          // Card Body
          //-----------------------------
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              width: double.infinity,
              // color: Color(0xFFCD958F),
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                //color: borderColor,
                // color: majorColor,
                color: Color(0xFFCD958F),
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
                //color: Colors.white,
                // width: 180,
                //height: 180,
                constraints: BoxConstraints(
                  //maxHeight: 150, maxWidth: 150),
                  maxHeight: MediaQuery.of(context).size.height * 0.18,
                  maxWidth: MediaQuery.of(context).size.height * 0.18,
                ),
                decoration: const BoxDecoration(
                    //color: borderColor,
                    // color: majorCoor,
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: QrImage(
                      data: contact.name + contact.address + contact.website,
                      version: QrVersions.auto,
                      //size: 70,
                      gapless: true),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget DiscountCardFace(BuildContext context, Contact contact) {
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
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/addDCard');
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/card_photos/${contact.number}.jpg'),
                      fit: BoxFit.fill,
                      //opacity: 0.6
                    ),
                    color: bgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(1),
                  child: Text(''),

                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     //---------------------------
                  //     // Name and Role
                  //     //---------------------------
                  //     Row(
                  //       children: [
                  //         SizedBox(width: 20),
                  //         Flexible(
                  //           child: Text.rich(
                  //               TextSpan(
                  //                 text: contact.name,
                  //                 style: txt20,
                  //                 children: [
                  //                   TextSpan(
                  //                       text: '\n\n${contact.role}', style: txt20)
                  //                 ],
                  //               ),
                  //               style: txt20),
                  //         ),
                  //       ],
                  //     ),
                  //     SizedBox(height: 20),
                  //     //---------------------------
                  //     // Address
                  //     //---------------------------
                  //     Row(
                  //       children: [
                  //         const SizedBox(width: 20),
                  //         Text(contact.address, style: txt20)
                  //       ],
                  //     ),
                  //     //---------------------------
                  //     // Phone Number
                  //     //---------------------------
                  //     Row(
                  //       children: [
                  //         const SizedBox(width: 20),
                  //         Text(contact.phone, style: txt20)
                  //       ],
                  //     ),
                  //     SizedBox(height: 10),
                  //     //---------------------------
                  //     // eMail
                  //     //---------------------------
                  //     Row(
                  //       children: [
                  //         const SizedBox(width: 20),
                  //         Flexible(
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               FittedBox(
                  //                 fit: BoxFit.scaleDown,
                  //                 child: Text(contact.email, style: txt14),
                  //               ),
                  //               Text(contact.website, style: txt14),
                  //             ],
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ],

                  // ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
