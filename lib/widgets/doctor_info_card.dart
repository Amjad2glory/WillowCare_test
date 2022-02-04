import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:willow_care/configs/app_colors.dart';

class DoctorInfoCard extends StatelessWidget {
  final String doctorName;
  final String description;
  final String imageUrl;
  final String date;
  final bool isConfirmed;
  final Function onTap;
  DoctorInfoCard(
      {required this.doctorName,
      required this.imageUrl,
      required this.description,
      required this.date,
      required this.isConfirmed,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Card(
          color: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Container(
            height: 230,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 14),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Container(
                      height: 48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(doctorName,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.main2TextColor)),
                              Text(description,
                                  style: TextStyle(
                                      color: AppColors.main2TextColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300))
                            ],
                          ),
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage(imageUrl),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(),

                  //bottom part of card
                  SizedBox(height: 14),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/noun_date_1757903.svg',
                                      width: 13,
                                      height: 13,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(date,
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey)),
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                FlatButton(
                                    height: 40,
                                    minWidth: 156,
                                    onPressed: () {},
                                    color: AppColors.mainBlue,
                                    child: Text('Start examination',
                                        style: TextStyle(color: Colors.white))),
                              ],
                            ),
                            // Spacer(),
                            SizedBox(width: 24),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 3.5,
                                      backgroundColor: isConfirmed
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      isConfirmed ? 'Confirmed' : 'Unconfirmed',
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),

                                // Spacer(),
                                SizedBox(
                                  height: 14,
                                ),
                                FlatButton(
                                  height: 40,
                                  onPressed: () {},
                                  color: AppColors.lightBlue.withOpacity(0.1),
                                  child: Text('Reshedule',
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      style: TextStyle(
                                          color: AppColors.lightBlue)),
                                ),
                              ],
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
