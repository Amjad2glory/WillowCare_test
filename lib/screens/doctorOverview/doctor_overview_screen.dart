// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:willow_care/configs/app_colors.dart';
import 'package:willow_care/screens/doctorOverview/tabs/doctor_work_info_tab.dart';
import 'package:willow_care/widgets/doctor-overview-appbar.dart';
import '../../widgets/doctor_info_header.dart';
import 'tabs/doctor_info_tab.dart';

class DoctorOverviewScreen extends StatefulWidget {
  const DoctorOverviewScreen({Key? key}) : super(key: key);

  @override
  State<DoctorOverviewScreen> createState() => _DoctorOverviewScreenState();
}

class _DoctorOverviewScreenState extends State<DoctorOverviewScreen>
    with SingleTickerProviderStateMixin {
  final Map<String, dynamic> _dummyData = {
    'fullName': 'Doctor Eva Reid ',
    'ImageUrl': 'assets/images/doctorImg.png',
    'description': 'Dermatology, cosmetology and laser',
    'stars': 3,
    'profileView': 8,
    'patients': 3,
    'experience': 56,
    'basicInformation':
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem0',
    'certificates': [
      'assets/images/certificates/images (1).png',
      'assets/images/certificates/images (2).png',
      'assets/images/certificates/images-1.png',
      'assets/images/certificates/images.png',
      'assets/images/certificates/images-1.png',
      'assets/images/certificates/images (1).png',
    ]
  };

  late final TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final background = SvgPicture.asset(
      'assets/icons/background.svg',
      width: MediaQuery.of(context).size.width,
    );

    return Scaffold(
        appBar: DoctorOverviewAppBar(height: 44),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                // expandedHeight: 300,
                expandedHeight: 0.477 * background.width! +
                    144 +
                    MediaQuery.of(context).viewPadding.top,
                backgroundColor: Colors.transparent,
                // foregroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  background: DoctorInfoHeader(
                    svgBackground: background,
                    doctorName: _dummyData['fullName'],
                    doctorOverview: _dummyData['description'],
                    doctorImage: _dummyData['ImageUrl'] as String,
                    stars: _dummyData['stars'],
                    profileView: _dummyData['profileView'],
                    patients: _dummyData['patients'],
                    experience: _dummyData['experience'],
                  ),
                ),
                shadowColor: Colors.transparent,
                pinned: true,
                floating: true,
                // forceElevated: innerBoxIsScrolled,
                bottom: PreferredSize(
                  preferredSize: Size(MediaQuery.of(context).size.width, 50),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
                      padding: EdgeInsets.all(4),
                      height: 50,
                      // width: 327,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(4)),
                      child: TabBar(
                        controller: _tabController,
                        indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7)),
                        labelColor: AppColors.mainBlue,
                        unselectedLabelColor: Colors.grey[600],
                        tabs: const [
                          Tab(
                            text: 'Doctor Info',
                          ),
                          Tab(
                            text: 'Work Info',
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              DoctorInfoTab(
                certificates: _dummyData['certificates'],
                basicInformation: _dummyData['basicInformation'],
              ),
              DoctorWorkInfoTab()
            ],
          ),
        ));
  }
}
