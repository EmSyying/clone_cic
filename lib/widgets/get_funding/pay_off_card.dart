import 'package:cicgreenloan/modules/get_funding/screens/transfer_information.dart';
import 'package:flutter/material.dart';

class PayoffCard extends StatefulWidget {
  final String? title;
  final String? body;
  final String? image;
  const PayoffCard({Key? key, this.title, this.body, this.image})
      : super(key: key);
  @override
  State<PayoffCard> createState() => _PayoffCardState();
}

class _PayoffCardState extends State<PayoffCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TransferInformation(
                      title: widget.title,
                    )));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 14, right: 0, top: 10, bottom: 10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(1.0, 0.0),
                  color: Colors.black12,
                  blurRadius: 4)
            ]),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                      image: AssetImage(widget.image!), fit: BoxFit.cover)),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      widget.title!,
                      style: Theme.of(context).textTheme.headline2,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      widget.body!,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            // Icon(
            //   Icons.arrow_forward_ios,
            //   color: Colors.grey[500],
            //   size: 18,
            // ),
            // SizedBox(
            //   width: 10,
            // ),
          ],
        ),
      ),
    );
  }
}
