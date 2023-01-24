import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  final ScrollController _scrollController = ScrollController();
  bool? innerBox;
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= 128) {
        innerBox = true;
      } else {
        innerBox = false;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, bool innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  systemOverlayStyle: innerBox == true
                      ? SystemUiOverlayStyle.dark
                      : SystemUiOverlayStyle.light,
                  shadowColor: Colors.black54,
                  elevation: 1,
                  forceElevated: true,
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  title: innerBox == true
                      ? Text(
                          'Cambodian Investors Community Association (CiC) is providing',
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                        )
                      : null,
                  leadingWidth: 75,
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 60,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: innerBox == true
                              ? Colors.transparent
                              : Colors.black26),
                      padding: innerBox == true
                          ? EdgeInsets.zero
                          : const EdgeInsets.only(left: 10),
                      margin: innerBox == true
                          ? EdgeInsets.zero
                          : const EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: innerBox == true ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                  expandedHeight: 210,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      padding: const EdgeInsets.only(left: 20, bottom: 20),
                      alignment: Alignment.bottomLeft,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://www.jobstreet.com.my/career-resources/wp-content/uploads/sites/4/2021/11/How-to-Write-Meeting-Minutes-7-Easy-Steps-to-Follow-Templates.jpg',
                          ),
                        ),
                      ),
                      child: Text(
                        'Cambodian Investors Community Association (CiC) is providing investment',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 130, left: 20, right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '6 Jan 2023 · ',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '5 min read | ',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'CiC News',
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18, left: 20, right: 20),
                  child: Text(
                    'Cambodian Investors Community Association is providing investment platform for Cambodian Entrepreneurs in order to assist them to access to finance and to develop their business more sustainable. We are liked a door for investment opportunity for both investors who want to mobilize their resources to invest and entrepreneurs who want to find good partner for their business growth.Our members are committed to help each other for the business growth in terms of finance, management, reputation, and so on. We are liked self-help business community.',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
