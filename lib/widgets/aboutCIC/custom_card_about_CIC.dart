import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cicgreenloan/modules/about_cic/model/about_cic_model.dart';

class CustomAboutCIC extends StatelessWidget {
  final AboutCICModel? aboutCICModel;
  const CustomAboutCIC({Key? key, this.aboutCICModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).cardColor,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(
                left: 20.0, right: 15.5, bottom: 10.0, top: 10.0),
            height: 50,
            width: 60,
            child: CachedNetworkImage(
              imageUrl: aboutCICModel!.companyLogo!,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              child: Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    aboutCICModel!.conpamyName!,
                    style: Theme.of(context).textTheme.headline2,
                  ))),
        ],
      ),
    );
  }
}
