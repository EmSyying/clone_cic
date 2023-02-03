import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

showNotifyPopUp(
    {BuildContext? context,
    String? title,
    String? description,
    String? imgUrl,
    String? secondbutton,
    Function? onTap}) {
  return showDialog(
    barrierDismissible: false,
    context: context!,
    builder: (BuildContext context) => StatefulBuilder(
      builder: (BuildContext context, setState) {
        return DefaultSizeWeb(
          child: AlertDialog(
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            titlePadding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: const EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, right: 20.0, left: 20.0),
                      child: SvgPicture.asset(
                        imgUrl!,
                        width: 100.0,
                        height: 100.0,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    if (title != null)
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 20.0, right: 20.0),
                      child: Center(
                        child: Text(
                          '$description',
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                      height: 1,
                      indent: 1,
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 15.0, top: 10.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      'Close',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (secondbutton != null)
                            const VerticalDivider(
                              width: 1,
                            ),
                          secondbutton != null
                              ? Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      onTap!();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 15.0, top: 10.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Center(
                                          child: Text(
                                            secondbutton,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
