import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData.dark(),
      home: KismetApp(),
    ));

class KismetApp extends StatefulWidget {
  @override
  _KismetAppState createState() => _KismetAppState();
}

// TODO: Step 15 - Run your app and see if it works as expected
class _KismetAppState extends State<KismetApp> {
  // TODO: Step 6 - Create a storyBrain object and use it to get story title, choice1 and choice 2 and show them on the app by using at appropriate locations
StoryBrain story = StoryBrain();
  @override

  Widget build(BuildContext context) {
    String currentstory = story.getStory();
    String currentchoice1 = story.getChoice1();
    String currentchoice2 = story.getChoice2();
    bool v = story.buttonShouldBeVisible();
    return Scaffold(
      //TODO: Step 1 - Add background.png to this Container as a background image. (Remember to add it to pubspec.yaml)
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/background.png"),
    fit: BoxFit.cover,
    ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    '$currentstory',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      story.nextStory(1);
                    });
                    //Choice 1 made by user.
                    //TODO: Step 9 - Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user, do the same for choice2 button and pass number 2 in that case
                  },
                  color: Colors.red,
                  child: Text(
                    '$currentchoice1',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                //TODO: Step 14 - Use a Flutter Visibility Widget to wrap this FlatButton and set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                child: Visibility(
                  child: FlatButton(
                    onPressed: () {
                      //Choice 2 made by user.
                      setState(() {
                        story.nextStory(2);
                      });
                    },
                    color: Colors.blue,
                    child: Text(
                      '$currentchoice2',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  visible: v,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
