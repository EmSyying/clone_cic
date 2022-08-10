import 'package:flutter/material.dart';

class LearningProfileWidget extends StatelessWidget {
  final String? profile;
  final String? name;
  final String? title;
  final Function? onTap;

  const LearningProfileWidget(
      {Key? key, this.profile, this.name, this.title, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(profile!),
            radius: 30,
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name!,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              const SizedBox(height: 10),
              Text(
                title!,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              )
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => onTap,
            child: const Text(
              'View',
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
