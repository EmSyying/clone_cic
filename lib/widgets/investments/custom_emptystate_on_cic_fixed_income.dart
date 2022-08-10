import 'package:cicgreenloan/widgets/investments/custom_card.dart';
import 'package:flutter/material.dart';

class CustomEmptyStateCiCFixIcome extends StatelessWidget {
  const CustomEmptyStateCiCFixIcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/emptyState.png',
              width: 160,
              height: 160,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'No Investment yet!',
            style: TextStyle(
                fontFamily: 'DM Sans',
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xff0A0B09)),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'You have no investment in CiC Fixed \n Income Fund (FIF).',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 15,
              fontFamily: 'DMSans',
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
