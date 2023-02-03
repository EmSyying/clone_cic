import 'package:cicgreenloan/widgets/investments/deposit_card.dart';
import 'package:cicgreenloan/widgets/investments/slide_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProceedToPayScreen extends StatelessWidget {
  const ProceedToPayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DepositCard(
          isMMA: true,
          title: 'CiC MM account',
          content: 'Pay securely with CiC MM Account',
        ),
        const Spacer(),
        Padding(
            padding: const EdgeInsets.all(20),
            child: SlideButton(
              callback: () async {
                await Future.delayed(const Duration(seconds: 1));
                await showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text("Submited"),
                    content: const Text("submit success!"),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text("Ok!"),
                        onPressed: () => Navigator.of(context).maybePop(),
                      ),
                    ],
                  ),
                ).then((value) {
                  Navigator.pop(context);
                });
              },
            )),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('By submitting you agree to ',
                  style: Theme.of(context).textTheme.headlineSmall),
              Text(
                'CiC Service Agreement',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 12),
              )
            ],
          ),
        ),
      ],
    );
  }
}
