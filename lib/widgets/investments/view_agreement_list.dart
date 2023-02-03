import 'package:cicgreenloan/Utils/function/convert_fromhex_color.dart';
import 'package:cicgreenloan/Utils/helper/custom_appbar.dart';
import 'package:cicgreenloan/Utils/web_view/web_view.dart';
import 'package:cicgreenloan/modules/investment_module/model/view_agreement/view_agreement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ViewAgreementList extends StatelessWidget {
  final List<ViewAgreement> listAgreeMent;
  const ViewAgreementList({Key? key, required this.listAgreeMent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          context: context,
          title: 'View Agreements',
          isLogo: false,
          isLeading: true),
      body: ListView.separated(
        itemCount: listAgreeMent.length,
        // padding: const EdgeInsets.only(top: 20),
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewWebsite(
                    title: listAgreeMent[index].title ?? '',
                    url: listAgreeMent[index].url,
                  ),
                ),
              );
            },
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            leading: Container(
              height: 54,
              width: 54,
              decoration: BoxDecoration(
                color: fromHex(listAgreeMent[index].color!).withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/images/url.svg',
                color: fromHex(listAgreeMent[index].color!),
              ),
            ),

            ///rgba(223, 82, 73, 1)
            ///rgba(223, 82, 73, 1)

            title: Text(
              listAgreeMent[index].title ?? '',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(height: 0),
      ),
    );
  }
}
