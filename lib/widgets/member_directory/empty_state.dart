import 'package:flutter/material.dart';

class EmptyStateProfile extends StatelessWidget {
  final String? title;
  final String? caption;
  final String? iconUrl;
  final String? buttonLabel;
  final Function? onTap;
  final bool? isEditable;

  const EmptyStateProfile(
      {Key? key,
      this.title,
      this.caption,
      this.iconUrl,
      this.buttonLabel,
      this.onTap,
      this.isEditable})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SvgPicture.asset(
            //   iconUrl,
            // ),
            Image.asset(
              iconUrl!,
              height: 120,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                title!,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  caption!,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            if (isEditable != null && isEditable!)
              GestureDetector(
                onTap: () => onTap,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        buttonLabel!,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
