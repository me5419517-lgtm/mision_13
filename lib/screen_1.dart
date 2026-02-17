import 'package:flutter/material.dart';
import 'box_1.dart';
import 'box_2.dart';
import 'screen_2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  double loanAmount = 14500;
  int loanMonths = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF40455B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF40455B),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Loan Calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Box1(),
              const SizedBox(height: 15),

              Box2(
                "Loan Amount",
                "Min EGP 1K",
                "Max EGP 17.5K",
                "EGP",
                loanAmount,
                1000,
                17500,
                onChanged: (v) => setState(() => loanAmount = v),
              ),

              const SizedBox(height: 10),

              Box2(
                "Loan Period",
                "3 Month",
                "36 Month",
                "Months",
                loanMonths.toDouble(),
                3,
                36,
                onChanged: (v) => setState(() => loanMonths = v.round()),
              ),

              const SizedBox(height: 70),

              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2FC5C6),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () async {
                    final res = await Navigator.push<bool>(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Screen2(
                          interestRate: 10,
                          adminFee: 50,
                          monthly: 150,
                          loanAmount: loanAmount,
                          loanMonths: loanMonths,
                        ),
                      ),
                    );

                    if (res == true && mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Loan Confirmed ✅")),
                      );
                    }
                  },
                  child: const Text(
                    "APPLY LOAN",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
