import 'package:flutter/material.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Logo/cic.png'),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Senior Business Development',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              const Text(
                'Cambodian Investors Corporation Plc . Full-time Jan 2017 - Present . 4 yrs',
                style: TextStyle(color: Colors.black87),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[300],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
