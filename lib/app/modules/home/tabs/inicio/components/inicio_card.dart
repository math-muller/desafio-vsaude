import 'package:flutter/material.dart';

class InicioCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const InicioCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.pinkAccent.shade200,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text(
              subtitle,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            leading: Icon(
              icon,
              size: 35,
            ),
          )
        ],
      ),
    );
  }
}
