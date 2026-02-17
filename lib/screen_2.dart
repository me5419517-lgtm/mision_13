import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  final double loanAmount;
  final int loanMonths;
  final int interestRate;
  final double adminFee;
  final double monthly;

  const Screen2({
    super.key,
    required this.loanAmount,
    required this.loanMonths,
    required this.interestRate,
    required this.adminFee,
    required this.monthly,
  });

  static const Color bg = Color(0xFF40455B);
  static const Color card = Color(0xFF2D3245);
  static const Color accent = Color(0xFF2FD3CE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Loan Summary",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // top card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: card,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: accent.withOpacity(0.6), width: 2),
              ),
              child: Column(
                children: [
                  Text(
                    "Estimated monthly installments",
                    style: TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "EGP ${monthly.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: accent,
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text("/month", style: TextStyle(color: Colors.white54)),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: card,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  _row("Loan Amount", "EGP ${loanAmount.toStringAsFixed(2)}"),
                  const SizedBox(height: 10),
                  _row("Loan Period", "$loanMonths Months"),
                  const SizedBox(height: 10),
                  _row("Interest Rate", "$interestRate%"),
                  const SizedBox(height: 10),
                  _row("Admin Fee", "EGP ${adminFee.toStringAsFixed(2)}"),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF353A4E),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info, color: accent, size: 18),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Includes interest and administrative fees. By clicking 'Confirm Loan', you agree to our Terms and Conditions.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.55),
                        fontSize: 12,
                        height: 1.25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2FC5C6),
                  foregroundColor: const Color(0xFF20303C),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text(
                  "CONFIRM LOAN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _row(String left, String right) {
    return Row(
      children: [
        Text(left, style: const TextStyle(color: Colors.white54)),
        const Spacer(),
        Text(
          right,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
