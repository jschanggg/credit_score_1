import 'package:flutter/material.dart';

class Tips {

  final String title;
  final String subtitle;

  Tips({required this.title, required this.subtitle});
}

final allTips = [
    Tips(title: "Verify that all the information on your credit report is accurate", subtitle: "If you’re planning to relocate, don’t forget to inform your credit reporting agency. You should always make sure they have your correct and updated information so that your latest credit reports will be as accurate as possible."),
    Tips(title: "Set Up Payment Reminders", subtitle: "Set up online reminders and write down payment deadlines for each bill in a planner or calendar. Paying your bills on time on a routine basis can improve your credit score within a few months."),
    Tips(title: "Pay More Than Once in a Billing Cycle", subtitle: "If you can afford it, pay down your bills every two weeks rather than once a month. This lowers your credit utilization and improves your score."),
    Tips(title: "Apply for New Credit Sparingly", subtitle: "Although it increases your total credit limit, it hurts your score if you apply for or open several new accounts in a short time."),
    Tips(title: "Be Careful Paying Off Old Debts", subtitle: "If a debt is “charged off” by the creditor, it means they do not expect further payments. If you make a payment on a charged off account, it reactivates the debt and lowers your credit score. This often happens when collection agencies are involved."),
    Tips(title: "Consider a Debt Consolidation Plan", subtitle: "There could be a temporary drop in your credit score if you enroll in a debt consolidation program, but as long as you make on-time payments, your score quickly improves and you are eliminating the debt that got you in trouble to start with."),
    Tips(title: "Pay Down “Maxed Out” Cards First", subtitle: "If you use multiple credit cards and the amount owed on one or more is close to the credit limit, pay that one off first to bring down your credit utilization rate."),
    //Tips(title: "Apply for New Credit Sparingly", subtitle: "Although it increases your total credit limit, it hurts your score if you apply for or open several new accounts in a short time."),
    
  ];

class TipsCard extends StatelessWidget {
  final Tips tips;
  const TipsCard({ Key? key, required this.tips, }) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        bottom: 10,
      ),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      tips.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      tips.subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}