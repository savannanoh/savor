import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Entry {
  final String entry;
  final double rating;
  final DateTime date;

  Entry(this.entry, this.rating, this.date);
}

class Notifications {
  DateTime time;
  bool active;

  Notifications(this.time, this.active);
}



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo),
        //fontFamily: 'Montserrat',

        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => SecondScreen(),
        // When navigating to the "/third" route, build the ThirdScreen widget.
        '/third': (context) => ThirdScreen(),
        // When navigating to the "/fourth" route, build the FourthScreen widget.
        '/fourth': (context) => FourthScreen(),
        // When navigating to the "/fifth" route, build the FifthScreen widget.
        '/fifth': (context) => FifthScreen(),

        '/journal': (context) => JournalPage(),

      },
      debugShowCheckedModeBanner: false,

    );
  }
}

class JournalPage extends StatefulWidget {
  JournalPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("How do you feel?",
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      body: MyCustomForm(),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  double stars = 2.5;
  String entry = "";

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(

      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(26.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'I feel...',
                border: OutlineInputBorder(),

              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onChanged: (value) {
                this.setState(() => entry = value);
              },
            ),
          ),
          Center(
            child: MyRatingBar(),
          ),
          Padding(
            padding: const EdgeInsets.all(26.0),
            child: Center(
              child: RaisedButton(
                color: Colors.cyan,
                onPressed: () {
                  print('entry: '+entry);
                  print('rating: '+stars.toString());
                  print('time: '+DateTime.now().toString());
                  Navigator.pushNamed(context, '/');
                },
                child: Text('Save', style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 24,
                ),),
              ),
            ),

          ),
        ],
      ),
    );
  }

  Widget MyRatingBar() {
    return RatingBar(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.sentiment_satisfied,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        stars = rating;
        //print('rating: '+rating.toString());
        //print('time: '+DateTime.now().toString());
      },
    );

  }
}

class FirstScreen extends StatefulWidget {
  final Notifications breakfast;
  //Notifications lunch = new Notifications(new DateTime(2020, 1, 1, 12), false);
  //Notifications dinner = new Notifications(new DateTime(2020, 1, 1, 18), false);

  const FirstScreen ({ Key key, this.breakfast }): super(key: key);


  @override
  _FirstScreenState createState() {
    return _FirstScreenState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class _FirstScreenState extends State<FirstScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        title: Text("Savor",
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),

      //image: Image.asset(name),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),

            child: Image.asset(
              'images/savour2.png',
              height: 100,
              //fit: BoxFit.cover
            ),
          ),

          SizedBox(
            height: 360,
            child: GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                padding: const EdgeInsets.all(20.0),
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                children: [
                  _buildButton(Icons.local_dining, 'second', 'eat', context),
                  _buildButton( Icons.library_books, 'third', 'reflect', context),
                  _buildButton( Icons.lightbulb_outline, 'fourth', 'learn', context),
                  _buildButton( Icons.notifications, 'fifth', 'get notified', context),
                ]
            ),
          )

        ],
      ),
    );
  }


  RaisedButton _buildButton(IconData icon, String path, String label, BuildContext context) {
    Color color = Colors.cyan;

    return RaisedButton(
      //mainAxisSize: MainAxisSize.min,
      //mainAxisAlignment: MainAxisAlignment.center,
      //child: RaisedButton(
      color: Colors.white,
      onPressed: () {
        // Navigate to the second screen when tapped.
        // Within the `FirstScreen` widget
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/'+path+'');
      },
      child: Center(
        child: Column(
          children: [
            Center(
              child: Icon(icon, color: color, size: 100,),

            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                child: Text(
                  label,
                  style: GoogleFonts.montserrat(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  //style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
              ),
            ),

          ],
          //),
        ),
      ),
    );
  }


}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Focus on eating",
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 50.0),

        children: [
          //_buildMarquee(),
          _buildComplexMarquee(""),

        ].map(_wrapWithStuff).toList(),

      ),
      floatingActionButton: RaisedButton(
        // Within the SecondScreen widget
        color: Colors.cyan,
        onPressed: () {
          // Navigate back to the first screen by popping the current route
          // off the stack.
          Navigator.pushNamed(context, '/journal');
        },
        child: Text('I\'m done!', style: GoogleFonts.montserrat(
        color: Colors.white,
          fontSize: 20,
        ),),


      ),
    );
  }


  Widget _buildMarquee() {
    return Marquee(
      text: ' Focus on eating. ',
    );
  }

  Widget _buildComplexMarquee(String quote) {
    return Marquee(
      //text: quote,

      text: 'Savor every bite.\n'
          '\n'
          'Chew slowly.\n '
          '\n'
          'Don\'t multitask.\n '
          '\n'
          'Focus on the moment.\n '
          '\n'
          'Do you feel full?\n'
          '\n'
          'Have you been drinking water?\n'
          '\n'
          'How does this meal make you feel?\n'
          '\n'
          'Do you feel satisfied?\n'
          '\n',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300),
      scrollAxis: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 50.0,
      velocity: 10.0,
      pauseAfterRound: Duration(seconds: 0),
      showFadingOnlyWhenScrolling: true,
      fadingEdgeStartFraction: 0.5,
      fadingEdgeEndFraction: 0.5,
      numberOfRounds: 300,
      startPadding: 10.0,
      accelerationDuration: Duration(seconds: 1),
      accelerationCurve: Curves.linear,
      decelerationDuration: Duration(milliseconds: 500),
      decelerationCurve: Curves.easeOut,
    );
  }

  Widget _wrapWithStuff(Widget child) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(height: 420, color: Colors.white, child: child),
    );
  }

}



class ThirdScreen extends StatefulWidget {
  ThirdScreen({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ThirdScreenState createState() => new _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();
  List<DateTime> _markedDate = [DateTime(2020, 9, 10), DateTime(2020, 9, 11)];
  DateFormat formatter = DateFormat('MM-dd-yyyy');
  String _currentEntry = DateFormat.MMMEd().format(DateTime.now());
  String _currentYear = DateFormat.y().format(DateTime.now());




  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;

  @override
  void initState() {
    super.initState();
  }


  Widget myRatingIndicator(BuildContext context, int index) {
    return Icon(
      Icons.sentiment_satisfied,
      color: Colors.amber,
    );
  }


  @override
  Widget build(BuildContext context) {

    /// Example Calendar Carousel without header and custom prev & next button
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.lightBlueAccent,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        _currentEntry = DateFormat.MMMEd().format(_currentDate2);
        _currentYear = DateFormat.y().format(_currentDate2);


        events.forEach((event) => print(event.title));
        return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('$_currentEntry, $_currentYear', style: GoogleFonts.montserrat(
                color: Colors.black54,
                fontSize: 20,
              ),),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('I had a nice and relaxing breakfast. I got up early enough to make something a bit fancier than usual.', style: GoogleFonts.montserrat(
                              color: Colors.black54,
                              fontSize: 15,
                            ),),
                          ),
                          RatingBarIndicator(itemBuilder: myRatingIndicator, rating: 4.5, unratedColor: Colors.grey),
                        ],
                      ),
                    ),

                    Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('I was kinda rushed today at lunch. I almost decided to skip lunch, but I knew if I did I would snack too much later on.', style: GoogleFonts.montserrat(
                              color: Colors.black54,
                              fontSize: 15,
                            ),),
                          ),
                          RatingBarIndicator(itemBuilder: myRatingIndicator, rating: 2, unratedColor: Colors.grey),
                        ],
                      ),
                    ),

                    Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Had a light dinner. I was a bit sad I didn\'t have more time to make something healthier, but I made an effort to enjoy what I had.', style: GoogleFonts.montserrat(
                              color: Colors.black54,
                              fontSize: 15,
                            ),),
                          ),
                          RatingBarIndicator(itemBuilder: myRatingIndicator, rating: 2.5, unratedColor: Colors.grey),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('back', style: GoogleFonts.montserrat(
                    color: Colors.black54,
                    fontSize: 20,
                  ),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: Colors.black54,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
//      firstDayOfWeek: 4,
      //markedDatesMap: _markedDateMap,
      height: 420.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder: CircleBorder(
          side: BorderSide(color: Colors.yellow)
      ),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
      showHeader: false,
      todayTextStyle: TextStyle(
        color: Colors.white,
      ),
      todayButtonColor: Colors.lightBlueAccent,
      selectedDayTextStyle: TextStyle(
        color: Colors.white,
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      prevDaysTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');

      },
    );

    return new Scaffold(
        appBar: new AppBar(
          title: Text("My journal",
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: new Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                          _currentMonth,
                          style: GoogleFonts.montserrat(
                              color: Colors.black54,
                              fontSize: 24,
                            ),
                        ),
                          ),

                    FlatButton(
                      child: Text('< PREV',style: GoogleFonts.montserrat(
                        color: Colors.black54,
                        fontSize: 14,
                      ),),
                      onPressed: () {
                        setState(() {
                          _targetDateTime = DateTime(_targetDateTime.year, _targetDateTime.month -1);
                          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                        });
                      },
                    ),
                    FlatButton(
                      child: Text('NEXT >',style: GoogleFonts.montserrat(
                        color: Colors.black54,
                        fontSize: 14,
                      ),),
                      onPressed: () {
                        setState(() {
                          _targetDateTime = DateTime(_targetDateTime.year, _targetDateTime.month +1);
                          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                        });
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: _calendarCarouselNoHeader,
              ), //
            ],
          ),
        ));
  }
}


class FourthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About mindful eating",
        style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 24,
        ),
        ),
      ),
      body: Center(
          child: ListView(
            padding: EdgeInsets.only(top: 20.0, left: 20, right: 20, bottom: 20),
            children: [
              RichText(
                  text: TextSpan(
                      text: "Hello and welcome to your mindful eating journey!" "\n",
                      style: GoogleFonts.montserrat(
                        color: Colors.black54,
                        fontSize: 32,
                      ),
                  )
              ),
              RichText(
                  text: TextSpan(
                      text: "Have you ever found yourself staring at an empty dish, cup, or chip bag, not knowing how you somehow finished the food you were looking forward to eating?""\n",
                      style: GoogleFonts.montserrat(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                  )
              ),
              RichText(
                  text: TextSpan(
                      text: "Many people in today’s society eat while distracted by screens, and do not devote enough time to enjoy the food they are eating, consuming their food with their attention on games, videos, or social media, and in some instances even finishing their food without realizing how much they’ve eaten.""\n",
                      style: GoogleFonts.montserrat(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                  )
              ),
              RichText(
                  text: TextSpan(
                      text: "Not only does this mean people aren’t enjoying their food, they may also be unnecessarily overeating, because a) they aren’t aware of how much they’ve eaten and will just keep eating until their plate is empty and b) they aren’t asking themselves if they’re satisfied, so they may reach for seconds out of habit or boredom""\n",
                      style: GoogleFonts.montserrat(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                  )
              ),
              RichText(
                  text: TextSpan(
                      text: "Studies on mindfulness have been used to treat a wide variety of eating related mental health issues and weight related health issues. The person practicing mindful eating should:" "\n"
                          " - Slow down the pace of eating" "\n"
                          " - Eat away from distractions " "\n"
                          " - Become aware of the body’s hunger and fullness cues" "\n"
                          " - Acknowledge responses to food " "\n"
                          " - Choose to eat food that is nourishing and pleasing" "\n"
                          " - Be aware of and reflect on the effects caused by unmindful eating" "\n"
                      ,
                      style: GoogleFonts.montserrat(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                  )
              ),
              RichText(
                  text: TextSpan(
                      text: "These criteria were created by Jean L. Kristeller, PhD, professor of psychology at Indiana State University and co-founder of The Center for Mindful Eating.  When successfully applied, the person can benefit from a regained sense of hunger and fullness, experience weight loss and a maintained weight, increase their self esteem, and experience a sense of empowerment with regard to eating." "\n",
                    style: GoogleFonts.montserrat(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  )
              ),
              RichText(
                  text: TextSpan(
                      text: "Dr. Laurie Santos, professor of psychology at Yale, and the creator of the wildly popular Coursera course, “The Science of Well-Being”, recommends savoring as a technique for increasing happiness.  Additionally, mindful eating can be a great beginner-friendly way to introduce mindfulness into your daily life, which Dr. Santos also recommends." "\n",
                    style: GoogleFonts.montserrat(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  )
              ),
              RichText(
                  text: TextSpan(
                      text: "Jennifer Mathieu. 2009. What Should You Know about Mindful and Intuitive Eating? Journal of the American Dietetic Association, 109(12)." "\n" ,
                      style: TextStyle(
                          color: Colors.grey, fontSize: 15)
                  )
              ),
              InkWell(
                  child: Text('https://www.coursera.org/learn/the-science-of-well-being',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                    ),
                  ),
                  onTap: () => launch('https://www.coursera.org/learn/the-science-of-well-being')
              ),
            ],
          )
      ),
    );
  }
}

class Notif extends StatefulWidget {
  @override
  _NotifState createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  bool isSwitched = false;
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {

  }

}

class FifthScreen extends StatefulWidget {

  final Notifications breakfast;

  FifthScreen({Key key, @required this.breakfast}) : super(key: key);

  @override
  _FifthScreenState createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {

  Notifications breakfast  = Notifications(new DateTime(2020, 1, 1, 8, 0, 0, 0, 0),false);
  Notifications lunch  = Notifications(new DateTime(2020, 1, 1, 12, 0, 0, 0, 0),false);
  Notifications dinner  = Notifications(new DateTime(2020, 1, 1, 18, 0, 0, 0, 0),false);

  //Notifications lunch;
  //Notifications dinner;
  DateTime _dateTimee = DateTime.now();
  //bool isSwitched = false;
  final _times = <Notif>[];
  final _active = Set<Notif>();     // NEW
  //DateTime breakfast = new DateTime(2020, 1, 1, 8, 0, 0, 0, 0);
  //DateTime lunch = new DateTime(2020, 1, 1, 12, 0, 0, 0, 0);
  //DateTime dinner = new DateTime(2020, 1, 1, 18, 0, 0, 0, 0);

  //_FifthScreenState(@required this.breakfast,(@required this.lunch, (@required this.dinner, );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set meal reminders",
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            myTime(breakfast.time, breakfast.active, context, breakfast),
            myTime(lunch.time, lunch.active, context, lunch),
            myTime(dinner.time, dinner.active, context, dinner),

          ],
        ),

      ),

      floatingActionButton: RaisedButton(
        // Within the SecondScreen widget
        color: Colors.cyan,
        onPressed: () {
          // Navigate back to the first screen by popping the current route
          // off the stack.
          Navigator.pop(context);
        },
        child: Text('Save preferences', style: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: 15,
        ),),

      ),
    );
  }

  Widget myTime(DateTime dt, bool isSwitched, BuildContext context, Notifications nt){
    //DateTime _dateTime = dt;
    //bool isSwitched = false;

    return new Card(
      child: ListTile(
        title: TimePickerSpinner(
          spacing: 40,
          minutesInterval: 15,
          is24HourMode: false,
          //itemHeight: 50,
          time: dt,
          isForce2Digits: true,
          onTimeChange: (time) {
            setState(() {
              _dateTimee = time;
              nt.time = time;
            });
          },
        ),
        trailing: Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              nt.active = value;
              print(isSwitched);

              isSwitched = value;
            });
          },
          activeTrackColor: Colors.lightGreenAccent,
          activeColor: Colors.green,
        ),
      ),
    );

  }
}