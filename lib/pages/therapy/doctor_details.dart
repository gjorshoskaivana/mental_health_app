import 'package:app/models/doctor.dart';
import 'package:app/pages/therapy/appointment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/models/user.dart';

class DoctorDetails extends StatefulWidget {
  late final Doctor doctor;
  DoctorDetails({required this.doctor});

  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<CustomUser?>(context);

    void _showSettingsPanel(){
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: Provider(
                create: (_) => CustomUser(uid: user!.uid),
                child: AppointmentForm(doctor: widget.doctor,),
              ),
            );
          });
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.doctor.name, style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.indigo[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20.0,),
              Row(
                children: [
                  Center(
                    child: Text(
                      'About me',
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.indigo[400],
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0,),
              Row(
                children: [
                  Flexible(
                    child: Container(
                      child: Text(
                        widget.doctor.aboutMe,
                        softWrap: true,
                        style: TextStyle(
                            color: Colors.indigo[400],
                            fontSize: 20.0
                        ),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0,),
              ElevatedButton.icon(
                  onPressed: () {
                    _showSettingsPanel();
                  },
                  icon: Icon(Icons.date_range,color: Colors.white),
                  label: Text('Make an appointment', style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(primary: Colors.indigo[400], ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
