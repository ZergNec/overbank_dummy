import 'package:flutter/material.dart';

class AllAssets extends StatelessWidget {
  final String asset;

  AllAssets({required this.asset});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 200,
        color: Colors.green.shade300,
        child: ListTile(
          leading: const Icon(Icons.arrow_forward_ios),
          title: Text(asset),
          subtitle: Text('contains $asset'),
          trailing: Icon(Icons.star, color: Colors.cyan.shade600),
          /*child: Text(
          asset,
          style: TextStyle(fontSize: 20),*/
        ),
      ),
    );
  }
}
