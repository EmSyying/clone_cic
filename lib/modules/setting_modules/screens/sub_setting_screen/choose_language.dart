import 'package:cicgreenloan/core/walk_through/start_slide.dart';
import 'package:flutter/material.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({Key? key}) : super(key: key);

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/Logo/cic.png',
              width: 160,
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Text(
            'Welcome',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18,
                color: Theme.of(context).primaryColor),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            'CIC MOBILE',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                color: Theme.of(context).primaryColor),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // _con.changeLanguage('kh');
                        // _con.getLocale();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StartupSlide()));
                      },
                      child: SizedBox(
                        height: 30.0,
                        child: Image.asset(
                          'assets/images/flag/kh_flag.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text('ខ្មែរ', style: Theme.of(context).textTheme.bodyText2)
                  ],
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // _con.changeLanguage('en');
                        // _con.getLocale();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StartupSlide()));
                      },
                      child: SizedBox(
                        height: 30.0,
                        child: Image.asset(
                          'assets/images/flag/uk_flag.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text('English',
                        style: Theme.of(context).textTheme.bodyText2)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
