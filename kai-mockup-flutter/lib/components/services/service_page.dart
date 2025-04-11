import 'package:flutter/material.dart';
import 'package:mockup_ki/components/bordered_container.dart';
import 'package:mockup_ki/primary_colors.dart';

class ServicePage extends StatelessWidget {
  final String title;

  const ServicePage(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            _background(),
            SafeArea(
              child: Positioned(
                child: Column(
                  spacing: 15,
                  children: [
                    _appBar(),
                    _ticketOrder(),
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }

  Widget _appBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          Center(
            child: Text(
              "Kereta $title",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20
              ),
            ),
          )
        ]
      ),
    );
  }

  Widget _background() {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            PrimaryColors.purple,
            PrimaryColors.blue,
            PrimaryColors.lightPurple.withAlpha(220),
            Colors.deepOrangeAccent
          ],
          stops: [
            0.0, 0.4, 0.8, 1.0
          ]
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/service_hero_background.png'),
          fit: BoxFit.fill,
          opacity: .2
        )
      ),
    );
  }

  Widget _ticketOrder() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: Colors.white,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 15,
            children: [
              _trainSelection(),
              DatePicker(),
              _passanger(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PrimaryColors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: Text('Cari Tiket $title'),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }

  Widget _trainSelection() {
    return BorderedContainer(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              _startTrainDestination(),
              Divider(height: 1, thickness: 1, color: Colors.grey.shade200,),
              _endTrainDestination(),
            ],
          ),
          Positioned(
            right: 10,
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey.shade200,
              child: CircleAvatar(
                radius: 23,
                backgroundColor: Colors.white,
                foregroundColor: PrimaryColors.blue,
                child: Transform.rotate(
                  angle: 1.57,
                  child: Icon(
                    Icons.compare_arrows_rounded
                  ),
                )
              )
            ),
          )
        ],
      ),
    );
  }

  Widget _startTrainDestination() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        spacing: 12,
        children: [
          ImageIcon(
            AssetImage('assets/icons/train.png'),
            size: 20,
            color: PrimaryColors.blue,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dari",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                "Dari",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _endTrainDestination() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        spacing: 12,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(3.14),
            child: ImageIcon(
              AssetImage('assets/icons/train.png'),
              size: 20,
              color: PrimaryColors.blue,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ke",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                "Ke",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  
  Widget _passanger() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BorderedContainer(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              spacing: 12,
              children: [
                Icon(
                  Icons.chair_alt_rounded,
                  color: PrimaryColors.blue,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Penumpang",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "1 Dewasa",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Text(
          "Penumpang bayi tidak mendapat kursi sendiri",
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }

}
 
class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedDate = DateTime.now();

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now().add(Duration(days: 90)),
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          spacing: 12,
          children: [
            Icon(
              Icons.date_range,
              color: PrimaryColors.blue,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  _selectDate();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tanggal pergi",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      selectedDate != null
                          ? '${
                                selectedDate!.weekday == 1 ? 'Mon' : 
                                selectedDate!.weekday == 2 ? 'Tue' : 
                                selectedDate!.weekday == 3 ? 'Wed' : 
                                selectedDate!.weekday == 4 ? 'Thu' : 
                                selectedDate!.weekday == 5 ? 'Fri' : 
                                selectedDate!.weekday == 6 ? 'Sat' : 'Sun'
                              }, ${
                                selectedDate!.day
                              } ${
                                selectedDate!.month == 1 ? 'Jan' : 
                                selectedDate!.month == 2 ? 'Feb' : 
                                selectedDate!.month == 3 ? 'Mar' : 
                                selectedDate!.month == 4 ? 'Apr' : 
                                selectedDate!.month == 5 ? 'May' : 
                                selectedDate!.month == 6 ? 'Jun' : 
                                selectedDate!.month == 7 ? 'Jul' : 
                                selectedDate!.month == 8 ? 'Aug' : 
                                selectedDate!.month == 9 ? 'Sep' : 
                                selectedDate!.month == 10 ? 'Oct' : 
                                selectedDate!.month == 11 ? 'Nov' : 'Dec'
                              } ${selectedDate!.year}'
                          : 'No date selected',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
