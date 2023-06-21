import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hephzibah/common/commons.dart';
import 'package:hephzibah/features/baby_care/domain/entities/mother_entity.dart';
import 'package:hephzibah/features/baby_care/presentation/cubit/baby/baby_cubit.dart';

class DeliveryCountDownWidget extends StatefulWidget {
  const DeliveryCountDownWidget({
    Key? key,
    required this.label,
    required this.currentMother,
  }) : super(key: key);
  final String label;
  final MotherEntity currentMother;

  @override
  State<DeliveryCountDownWidget> createState() =>
      _DeliveryCountDownWidgetState();
}

class _DeliveryCountDownWidgetState extends State<DeliveryCountDownWidget> {
  @override
  void initState() {
    BlocProvider.of<BabyCubit>(context).getBabies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BabyCubit, BabyState>(
      builder: (context, state) {
        if (state is BabyLoaded) {
          final currentBaby = state.babies.firstWhere(
            (baby) => baby.babyId == widget.currentMother.babyId,
          );
          final dateOfConception = currentBaby.dateOfConception;
          final deliveryDate =
              dateOfConception.toDate().add(const Duration(days: 270));
          final difference = deliveryDate.difference(DateTime.now());
          String countDownText = "";
          if (difference.isNegative) {
            countDownText = '00:00:00';
          } else {
            countDownText =
                '${difference.inDays}: ${difference.inHours.remainder(24)}: ${difference.inMinutes.remainder(60)}';
          }
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Card(
              shadowColor: lightPrimaryColor,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Container(
                      color: primaryColor.withOpacity(0.08),
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 30),
                      child: Icon(
                        Icons.watch_later_outlined,
                        color: primaryColor,
                        size: 30,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.label,
                          style: headerText.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          countDownText,
                          style: headerText.copyWith(
                            fontSize: 36,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
