import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PinCodeView extends StatefulWidget {
  final ValueChanged<String>? onFieldSubmited;
  const PinCodeView({
    super.key,
    this.onFieldSubmited,
  });

  @override
  State<PinCodeView> createState() => _PinCodeViewState();
}

class _PinCodeViewState extends State<PinCodeView> {
  final keyboardItems = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'C',
    '0',
    'assets/images/icon_delete.svg'
  ];

  bool _notNumberKey(String value) => value == 'C' || value.length > 2;

  void onKeyTyped(String value) async {
    if (!_notNumberKey(value) && _passCode.length < 4) {
      _passCode = _passCode + value;
    }
    if (value.length > 2 && _passCode.isNotEmpty) {
      _passCode = _passCode.substring(0, _passCode.length - 1);
    }
    if (value == 'C') {
      _passCode = '';
    }
    setState(() {});
    if (_passCode.length == 4) {
      await Future.delayed(const Duration(milliseconds: 800), () {
        _clearPassCode();
        setState(() {});
      });
      widget.onFieldSubmited?.call(_passCode);
    }

    debugPrint(
        'Clicked On Key : $value , PassCode : $_passCode , ${(_notNumberKey(value) && _passCode.length < 4)}');
  }

  void _clearPassCode() {
    _passCode = '';
  }

  String _passCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        minimum: const EdgeInsets.only(bottom: 30),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: SvgPicture.asset(
                        'assets/images/svgfile/security_icon.svg')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      4,
                      (index) => AnimatedContainer(
                        margin: index == 3
                            ? EdgeInsets.zero
                            : const EdgeInsets.only(right: 15),
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: index < _passCode.length
                              ? Colors.white
                              : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white),
                        ),
                        duration: const Duration(milliseconds: 200),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  itemCount: keyboardItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                  ),
                  itemBuilder: (_, index) {
                    final data = keyboardItems[index];
                    return Material(
                      type: MaterialType.transparency,
                      clipBehavior: Clip.antiAlias,
                      shape: const CircleBorder(),
                      child: InkWell(
                        onTap: () {
                          onKeyTyped(data);
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            color: _notNumberKey(data)
                                ? Colors.transparent
                                : Colors.white.withOpacity(0.3),
                            border: Border.all(
                                color: _notNumberKey(data)
                                    ? Colors.transparent
                                    : Colors.white),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: data.length > 3
                                ? SvgPicture.asset(data)
                                : Text(
                                    data,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            Positioned(
              left: 20,
              top: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
