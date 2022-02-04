import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:willow_care/configs/app_colors.dart';

class DoctorInfoHeader extends StatelessWidget {
  final String doctorName;
  final String doctorImage;
  final String doctorOverview;
  final int stars;
  final int profileView;
  final int patients;
  final int experience;
  const DoctorInfoHeader(
      {required this.svgBackground,
      required this.doctorName,
      required this.doctorOverview,
      required this.doctorImage,
      required this.stars,
      required this.profileView,
      required this.patients,
      required this.experience});

  final SvgPicture svgBackground;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        color: Colors.transparent,
        height: 0.477 * svgBackground.width! +
            MediaQuery.of(context).viewPadding.top +
            44,
        width: svgBackground.width,
        child: Stack(
          children: [
            Positioned(child: svgBackground),
            Positioned(
                top: (svgBackground.width! * 0.44) * 0.3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.red,
                  height: 130,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  doctorName,
                                  style: TextStyle(
                                      color: AppColors.mainTextColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SvgPicture.asset('assets/images/check.svg',
                                    width: 16, height: 16),
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              doctorOverview,
                              style: TextStyle(
                                color: AppColors.lightTextColor,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                                children: List.generate(stars, (index) {
                              return Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: AppColors.starColor,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  )
                                ],
                              );
                            }).toList())
                          ],
                        ),
                      ),
                      Column(children: [
                        Spacer(),
                        Container(
                          height: 114,
                          width: 108,
                          // color: Colors.blueAccent,
                          child: ClipRect(
                            child: Image.asset(doctorImage),
                          ),
                        ),
                      ])
                    ],
                  ),
                ))
          ],
        ),
      ),
      Container(
        height: 44,
        width: 302,
        child: Row(
          children: [
            Container(
              width: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Profil view',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    '$profileView',
                    style: TextStyle(fontSize: 18, color: AppColors.lightBlue),
                  )
                ],
              ),
            ),
            VerticalDivider(thickness: 1),
            Container(
              width: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Patients',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    '$patients',
                    style: TextStyle(fontSize: 18, color: AppColors.lightBlue),
                  )
                ],
              ),
            ),
            VerticalDivider(thickness: 1),
            Container(
              width: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Experience',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    '$experience',
                    style: TextStyle(fontSize: 18, color: AppColors.lightBlue),
                  )
                ],
              ),
            )
          ],
        ),
      )
    ]);
  }
}
