import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/modules/member_directory/models/user.dart';
import 'package:cicgreenloan/modules/member_directory/models/member.dart';
import 'package:cicgreenloan/widgets/member_directory/empty_state.dart';
import 'package:cicgreenloan/widgets/member_directory/information_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Subsciption extends StatefulWidget {
  final User? customer;
  final Member? member;
  final bool? isEditable;

  const Subsciption({Key? key, this.customer, this.member, this.isEditable})
      : super(key: key);
  @override
  State<Subsciption> createState() => _SubsciptionState();
}

class _SubsciptionState extends State<Subsciption> {
  final memberCon = Get.put(MemberController());

  @override
  void initState() {
    if (widget.customer != null) {
      memberCon.fetchSubscriptionMember(widget.customer!.customerId!);
    } else {
      memberCon.fetchSubscriptionMember(widget.member!.id!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => memberCon.isLoading.value
          ? const InformationShimmer()
          : memberCon.subscriptionList.isNotEmpty
              ? Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: const [
                        // SubscriptionInformationCard(
                        //   subscriptionModel: memberCon.subscriptionList,
                        // )
                      ],
                    ),
                  ),
                )
              : EmptyStateProfile(
                  isEditable: false,
                  title: 'No Share yet',
                  caption:
                      'Here’s where you’ll find the newest update of member profile',
                  buttonLabel: 'Add Education',
                  iconUrl: 'assets/images/emptyState.png',
                  onTap: () {},
                ),
    );
  }
}
