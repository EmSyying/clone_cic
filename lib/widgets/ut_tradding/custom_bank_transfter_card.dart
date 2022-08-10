import 'package:cicgreenloan/modules/ut_trading/models/detail_model.dart';
import 'package:cicgreenloan/widgets/ut_tradding/sub_description_bank.dart';
import 'package:flutter/material.dart';

import '../../Utils/helper/container_partern.dart';

class CustomBankTransferCard extends StatelessWidget {
  final Bank? bankDetail;
  final bool? isTranId;
  const CustomBankTransferCard(
      {Key? key, this.bankDetail, this.isTranId = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0, left: 20.0, right: 20.0),
      padding: const EdgeInsets.all(20.0),
      width: double.infinity,
      // margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
      decoration: containerCiCPartern,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(bankDetail!.image!),
                        fit: BoxFit.cover),
                  )),
              const SizedBox(
                width: 15.0,
              ),
              Flexible(
                child: Text(
                  bankDetail!.bankName!,
                  style: Theme.of(context).textTheme.subtitle2,
                  softWrap: false,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              bankDetail!.description != null
                  ? Text(
                      bankDetail!.description!,
                      softWrap: false,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w100),
                    )
                  : const SizedBox(),
              SizedBox(
                height: bankDetail!.description != null ? 15 : 0,
              ),
              SubDescriptionBank(
                title: 'Acc Name',
                description: bankDetail!.accountName,
              ),
              const SizedBox(
                height: 5,
              ),
              SubDescriptionBank(
                title: 'Acc Number',
                description: bankDetail!.accountNumber,
              ),
              const SizedBox(
                height: 5,
              ),
              if (isTranId == true)
                const SubDescriptionBank(
                  isTranid: true,
                  title: 'Remark',
                ),
            ],
          ),
          if (isTranId == true)
            const SizedBox(
              height: 20,
            )
        ],
      ),
    );
  }
}
