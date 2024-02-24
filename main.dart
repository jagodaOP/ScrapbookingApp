import 'package:flutter/material.dart';

// Starting point of the app.
void main() => runApp(const LandmarkApp());

// The main app widget, which is the root of our application.
class LandmarkApp extends StatelessWidget {
  // Constructor for initializing key for the widget.
  const LandmarkApp({super.key});

  @override
  // The build method is where we describe the part of the user interface represented by this widget.
  Widget build(BuildContext context) {
    // Convenience widget that wraps a number of widgets that are commonly required.
    return MaterialApp(
      title: 'Scrapbooker', // Title of the app that appears in the task switcher.
      // Layout for the major Material Components.
      home: Scaffold(
        // AppBar appears at the top of the app.
        appBar: AppBar(
          title: const Text('Scrapbooker'), // Text widget to display the title in the AppBar.
        ),
        // ListView is a scrollable list of widgets arranged linearly.
        body: ListView(
          // List of LandmarkWidgets which displays each landmark with an image, name, and description.
          children: const [
            // Widget for the Eiffel Tower landmark.
            LandmarkWidget(
              imagePath: 'images/eiffel_tower.jpg',
              name: 'Eiffel Tower',
              description: 'Iconic symbol of Paris, France.',
            ),
            // Widget for the Mostar Bridge landmark.
            LandmarkWidget(
              imagePath: 'images/mostar_bridge.jpg',
              name: 'Mostar Bridge',
              description: 'Historic bridge in Mostar, Bosnia and Herzegovina.',
            ),
            // Widget for the Taj Mahal landmark.
            LandmarkWidget(
              imagePath: 'images/taj_mahal.jpg',
              name: 'Taj Mahal',
              description: 'Magnificent mausoleum in Agra, India.',
            ),
          ],
        ),
      ),
    );
  }
}

// A StatefulWidget for individual landmark items that can change (like being favorited).
class LandmarkWidget extends StatefulWidget {
  // Constructor taking required parameters to display the landmark.
  const LandmarkWidget({
    super.key,
    required this.imagePath,
    required this.name,
    required this.description,
  });

  // Final variables that will be displayed in the widget.
  final String imagePath;
  final String name;
  final String description;

  @override
  // Create the state for this widget.
  State<LandmarkWidget> createState() => _LandmarkWidgetState();
}

// Private State class for the LandmarkWidget.
class _LandmarkWidgetState extends State<LandmarkWidget> {
  // Variable to track whether the landmark is favorited.
  bool isFavorited = false;

  @override
  // Build method to construct the UI of the landmark card.
  Widget build(BuildContext context) {
    // Card widget with a slight elevation and rounded corners.
    return Card(
      clipBehavior: Clip.antiAlias,
      // Column widget to layout its children vertically.
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          // Display the image of the landmark.
          Image.asset(widget.imagePath, fit: BoxFit.cover),
      // Padding widget to add space around the name of the landmark.
      Padding(
        padding: const EdgeInsets.all(16),
        // Text widget for the name with a larger font and bold.
        child: Text(
          widget.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // Padding widget to add space around the description of the landmark.
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        // Text widget for the description with a standard font size.
        child: Text(
          widget.description,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      // ButtonBar for action buttons related to the landmark.
      ButtonBar(
          alignment: MainAxisAlignment.start,
          children: [
      // Button to simulate routing functionality.
      TextButton.icon(
      icon: const Icon(Icons.route),
      label: const Text('Route'),
      onPressed: () {
        // SnackBar to notify routing action.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Routing to ${widget.name}...')),
        );
      },
    ),
    // Button to simulate sharing functionality.
    TextButton.icon(
    icon: const Icon(Icons.share),
    label: const Text('Share'),
    onPressed: () {
    // SnackBar to notify sharing action. Simulation - esque.
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Sharing ${widget.name}...')),
    );
    },
    ),
            // IconButton to toggle the favorite status of the landmark.
            IconButton(
              // Chooses the icon based on whether the landmark is currently favorited or not.
              icon: Icon(isFavorited ? Icons.star : Icons.star_border),
              // Makes the icon red when the landmark is favorited.
              color: isFavorited ? Colors.red : null,
              onPressed: () {
                // When the button is pressed, update the state to reflect the new favorite status.
                setState(() {
                  isFavorited = !isFavorited;
                });

                // Show a SnackBar with feedback about the favorite status change.
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(isFavorited
                        ? 'Added ${widget.name} to favorites.' // Message when added to favorites.
                        : 'Removed ${widget.name} from favorites.'), // Message when removed from favorites.
                  ),
                );
              },
            ),
          ],
      ),
          ],
      ),
    );
  }
}
