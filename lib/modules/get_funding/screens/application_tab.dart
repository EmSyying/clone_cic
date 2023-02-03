import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Utils/helper/container_partern.dart';

class ApplicationTab extends StatefulWidget {
  const ApplicationTab({Key? key}) : super(key: key);

  @override
  State<ApplicationTab> createState() => _ApplicationTabState();
}

class _ApplicationTabState extends State<ApplicationTab> {
  bool isGrid = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: Row(
              children: [
                Text(
                  'Recent Applications',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                IconButton(
                    splashRadius: 25,
                    onPressed: () {
                      if (isGrid == false) {
                        setState(() {
                          isGrid = true;
                        });
                      } else {
                        setState(() {
                          isGrid = false;
                        });
                      }
                    },
                    icon: isGrid != true
                        ? SvgPicture.asset(
                            'assets/images/svgfile/listIcon.svg',
                          )
                        : SvgPicture.asset(
                            "assets/images/svgfile/gridIcon.svg")),
              ],
            ),
          ),
          // isGrid != true
          //     ? ApplicationList(
          //         applist: applicationList,
          //         isGrid: false,
          //       )
          //     : ApplicationList(
          //         applist: applicationList,
          //         isGrid: true,
          //       )
        ],
      ),
    );
  }
}
