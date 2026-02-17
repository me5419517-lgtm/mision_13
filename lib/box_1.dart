import 'package:flutter/material.dart';
class Box1 extends StatelessWidget {
  const Box1({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: 400,
      child: Card(
        color: Color(0xFF2D3245),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xFF366572), width: 3),
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 35, left: 25),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(35),
                      ),
                      color: Color(0xFF2C5060),
                      child: Icon(
                        Icons.directions_bike,
                        color: Color(0xFF2FD3CE),
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(width: 13),
                  Column(
                    children: [
                      Text(
                        "Vehicle Details",
                        style: TextStyle(color: Colors.white38, fontSize: 15),
                      ),
                      Text(
                        "Nissan Sunny 2026",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Divider(color: Color(0xFF373C4F), thickness: 3),
              ),
              Text(
                "Maximum Funding",
                style: TextStyle(color: Color(0xFF787C87), fontSize: 17),
              ),
              Text(
                "EGP 17,500.00",
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2CC7C4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
