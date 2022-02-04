import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:willow_care/widgets/doctor_info_card.dart';

class AcceptedTab extends StatelessWidget {
  // const AcceptedTab({Key? key}) : super(key: key);

  //_dommyData
  final List<Map<String, dynamic>> _dommyData = [
    {
      'name': 'Eva Reid',
      'imageUrl': 'assets/images/doctorImg.png',
      'description': 'Online Consultation',
      'date': 'November 17, 12:30 PM',
      'isConfirmed': true
    },
    {
      'name': 'Eva Reid2',
      'imageUrl': 'assets/images/doctorImg.png',
      'description': 'Online Consultation',
      'date': 'November 17, 12:30 PM',
      'isConfirmed': false
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 24),
            width: double.infinity,
            height: 30,
            color: Colors.white,
            child: const Text('This Week'),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _dommyData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: DoctorInfoCard(
                    doctorName: _dommyData[index]['name'],
                    imageUrl: _dommyData[index]['imageUrl'],
                    description: _dommyData[index]['description'],
                    date: _dommyData[index]['date'],
                    isConfirmed: _dommyData[index]['isConfirmed'],
                    onTap: () {
                      _dommyData[index]['isConfirmed']
                          ? Navigator.of(context).pushNamed('doctor-overview')
                          : Scaffold.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('Doctor is not Confirmed'),
                              duration: Duration(seconds: 1),
                            ));
                    },
                  ),
                );
              },
            ),
          ),
        ]);
  }
}
