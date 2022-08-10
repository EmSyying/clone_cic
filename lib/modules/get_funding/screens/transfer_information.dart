import 'dart:io';
import 'package:cicgreenloan/Utils/image_view/image_view_file.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_upload_pic_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class TransferInformation extends StatefulWidget {
  final String? title;
  const TransferInformation({Key? key, this.title}) : super(key: key);

  @override
  State<TransferInformation> createState() => _TransferInformationState();
}

class _TransferInformationState extends State<TransferInformation> {
  final _pickerImage = ImagePicker();
  File? imageFile;
  bool isSelectPhoto = false;

  Future<void> _onOpencamera() async {
    final pickerFile = await _pickerImage.pickImage(source: ImageSource.camera);
    if (pickerFile != null) {
      setState(() {
        imageFile = File(pickerFile.path);
        isSelectPhoto = true;
      });
    }
  }

  Future<void> _onChooseimage() async {
    final pickerFile =
        await _pickerImage.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        imageFile = File(pickerFile.path);
        isSelectPhoto = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title!,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xff0D1F3C))),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_outlined,
              color: Color(0xff0D1F3C)),
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(1.0, 0.0),
                              color: Colors.black12,
                              blurRadius: 4)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 12),
                          child: const Text('Transfer Information',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff0685CF))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          height: 0.1,
                          color: Colors.black,
                          thickness: 0.1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Receiver Account',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff6D7174))),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Kong Kear',
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Account Number',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff6D7174))),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '001146769',
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: const [
                              Text('Amount',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff6D7174))),
                              SizedBox(
                                width: 20,
                              ),
                              Text('\$2,000',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffED1E26))),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  isSelectPhoto == true
                      ? SizedBox(
                          //padding: EdgeInsets.only(left: 20, right: 20),
                          height: 242,
                          width: double.infinity,
                          child: Hero(
                            tag: 'imageFile',
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ImageViewerFile(
                                      heroTag: 'imageFile',
                                      imageFile: imageFile!,
                                    ),
                                  ),
                                );
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      image: DecorationImage(
                                          image: FileImage(
                                            imageFile!,
                                          ),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        onShowBottomSheetUploadPic(context,
                                            _onOpencamera, _onChooseimage);
                                      },
                                      child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10.0),
                                            ),
                                          ),
                                          height: 43,
                                          width: 56,
                                          child: SvgPicture.asset(
                                              'assets/images/editIcon.svg')),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  // Expanded(child: Container()),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: isSelectPhoto == false
                    ? () {
                        onShowBottomSheetUploadPic(
                            context, _onOpencamera, _onChooseimage);
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) ));
                      }
                    : () {},
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 20),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xff0F50A4),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text(
                    isSelectPhoto == false ? 'Upload Picture' : 'Done',
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
