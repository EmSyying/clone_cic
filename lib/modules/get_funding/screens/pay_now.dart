import 'package:cicgreenloan/widgets/get_funding/pay_off_card.dart';
import 'package:flutter/material.dart';

class PayNow extends StatelessWidget {
  const PayNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Transfer By',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xff0D1F3C)),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.clear, color: Color(0xff0D1F3C)),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(
                height: 5,
              ),
              PayoffCard(
                title: 'ABA Bank',
                body: 'ABA Core Banking Account',
                image: 'assets/images/banks/aba.jpg',
              ),
              PayoffCard(
                title: 'Acleda Bank',
                body: 'ACLEDA Core Banking Account',
                image: 'assets/images/banks/acleda_bank1.png',
              ),
              PayoffCard(
                title: 'Wing',
                body: 'Wing’s wallet and accounts',
                image: 'assets/images/banks/wing1.png',
              ),
              PayoffCard(
                title: 'True Money',
                body: 'TrueMoney’s wallet and accounts',
                image: 'assets/images/banks/true_money1.jpg',
              ),
            ],
          ),
        ));
  }
}
