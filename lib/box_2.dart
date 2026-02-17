import 'package:flutter/material.dart';

class Box2 extends StatefulWidget {
  final String te1;
  final String te2;
  final String te3;
  final String te4;
  final double mi;
  final double ma;
  final double amount;

  final ValueChanged<double> onChanged; // ✅ callback

  const Box2(
      this.te1,
      this.te2,
      this.te3,
      this.te4,
      this.amount,
      this.mi,
      this.ma, {
        super.key,
        required this.onChanged,
      });

  @override
  State<Box2> createState() => _Box2State();
}

class _Box2State extends State<Box2> {
  late double amount; // ✅ قيمة محلية

  @override
  void initState() {
    super.initState();
    amount = widget.amount;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: Card(
        color: const Color(0xFF353A4E),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xFF35394E), width: 3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    widget.te1,
                    style: const TextStyle(color: Color(0xFF757B83), fontSize: 20),
                  ),
                  const Spacer(),

                  /// ✅ عرض الرقم بشكل نضيف
                  Text(
                    widget.te4 == "EGP"
                        ? "EGP ${amount.toStringAsFixed(2)}"
                        : "${amount.round()} ${widget.te4}", // Month / Months
                    style: const TextStyle(
                      color: Color(0xFF2CC7C4),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 5,
                  activeTrackColor: const Color(0xFF2FD3CE),
                  inactiveTrackColor: Colors.white24,
                  thumbColor: const Color(0xFF2FD3CE),
                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                ),
                child: Slider(
                  min: widget.mi,
                  max: widget.ma,
                  value: amount.clamp(widget.mi, widget.ma),
                  onChanged: (value) {
                    setState(() => amount = value);
                    widget.onChanged(value); // ✅ رجّع القيمة للأب
                  },
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.te2,
                    style: const TextStyle(color: Colors.white38, fontSize: 12)),
                Text(widget.te3,
                    style: const TextStyle(color: Colors.white38, fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
