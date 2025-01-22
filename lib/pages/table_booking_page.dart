import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_management/components/bubble_dropdown.dart';
import 'package:hotel_management/components/button.dart';
import 'package:hotel_management/components/newmorphic_data_field.dart';

// Import your custom SliderFb3 widget here
import 'package:hotel_management/components/slider.dart';
import 'package:hotel_management/components/timepicker.dart';

class TableBookingPage extends StatefulWidget {
  const TableBookingPage({super.key});

  @override
  State<TableBookingPage> createState() => _TableBookingPageState();
}

class _TableBookingPageState extends State<TableBookingPage> {
  double _sliderValue = 1.0; // Initial slider value
  List<String> menuItems = ['Indoor', 'Outdoor', 'Buffet'];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Book Table",
          style: TextStyle(color: Color(0xFF757575)),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Text(
                    "Table Booking",
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: screenWidth *
                          0.08, // Adjust font size based on screen width
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Complete the form to get the table that best suits you",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF757575)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  ComplateProfileForm(
                    menu: menuItems,
                    sliderValue: _sliderValue,
                    onSliderChange: (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  const Text(
                    "By continuing your confirm that you agree \nwith our Term and Condition",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF757575),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const authOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xFF757575)),
  borderRadius: BorderRadius.all(Radius.circular(100)),
);

class ComplateProfileForm extends StatelessWidget {
  final List<String> menu;
  final double sliderValue;
  final ValueChanged<double> onSliderChange;

  const ComplateProfileForm({
    super.key,
    required this.menu,
    required this.sliderValue,
    required this.onSliderChange,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Form(
      child: Column(
        children: [
          DateField(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: CustomPopupMenu(menuItems: menu),
          ),
          Text('Number of People:', style: TextStyle(fontSize: 16)),
          SliderFb3(
            min: 1,
            max: 6,
            divisions: 5,
            initialValue: sliderValue,
            onChange: onSliderChange,
          ),
          SizedBox(height: screenHeight * 0.03),
          Text('Select Time', style: TextStyle(fontSize: 16)),
          CustomTimePicker(),
          const SizedBox(height: 8),
          MyButton(text: 'Select Table', onTap: () => {})
        ],
      ),
    );
  }
}

// Icons
