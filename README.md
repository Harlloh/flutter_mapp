# Flutter Fundamentals Course

This repository contains the code, exercises, and examples I worked on while completing a Flutter fundamentals course.

The purpose of this project was to build a practical understanding of Flutter and Dart, starting from basic widget composition and layouts and progressing into state management, navigation, persistence, responsive design, networking, Firebase, and application publishing.

## What I Learned

### 1. Flutter Key Concepts

I learned the basic structure of Flutter applications and how Flutter builds interfaces using widgets.

Some of the fundamental concepts covered include:

- Everything in Flutter is built using widgets
- Nesting widgets inside other widgets
- Understanding the Flutter widget tree
- Basic Dart syntax used in Flutter
- Structuring widgets with brackets and commas
- Using `build()` to describe UI

Example:

```dart
Column(
  children: [
    Text('Hello'),
    Text('Flutter'),
  ],
)
```

### 2. Basic Layouts

I learned how to build user interfaces using some of Flutter's most commonly used layout widgets.

Widgets covered include:

- `Text`
- `Container`
- `Row`
- `Column`
- `Scaffold`
- `Padding`
- `Center`
- `SizedBox`

I also learned how widgets can be combined to create larger and reusable UI structures.

### 3. Layout Composition

I learned how to move beyond individual widgets and structure complete screens using combinations of layout widgets.

This included understanding:

- Parent and child widgets
- Widget nesting
- Horizontal layouts with `Row`
- Vertical layouts with `Column`
- Page structure using `Scaffold`
- Spacing and padding
- Separating UI into smaller widgets

### 4. Debugging Flutter Layouts

The course introduced a simple debugging approach for identifying and resolving common Flutter issues.

This included working through problems such as:

- Incorrect widget nesting
- Missing brackets or commas
- Layout constraints
- Overflow errors
- Widget placement issues

### 5. Stateless and Stateful Widgets

I learned the difference between:

```dart
StatelessWidget
```

and:

```dart
StatefulWidget
```

A `StatelessWidget` is useful when the UI does not need to manage changing local state.

A `StatefulWidget` is useful when the UI needs to change in response to user interaction or other events.

I also learned how to update state using:

```dart
setState(() {
  // update state
});
```

Calling `setState()` tells Flutter that the state has changed and that the affected widget should rebuild.

### 6. User Input

I learned how to accept and respond to user input.

Topics included:

- Buttons
- `TextField`
- Text controllers
- Handling button presses
- Reading values entered by users
- Updating UI based on user interaction

Example:

```dart
TextEditingController controller = TextEditingController();
```

and:

```dart
ElevatedButton(
  onPressed: () {
    print(controller.text);
  },
  child: const Text('Submit'),
)
```

### 7. Navigation and Routing

I learned how to move between different screens in a Flutter application using `Navigator`.

Example:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const SecondPage(),
  ),
);
```

I also learned how to return to a previous screen using:

```dart
Navigator.pop(context);
```

This introduced me to the basic concept of routing and screen navigation in Flutter.

### 8. Building Cleaner User Interfaces

The course covered improving the structure and appearance of Flutter interfaces.

This included:

- Reusable widgets
- Consistent spacing
- Separating widgets into smaller components
- Organizing screen layouts
- Improving readability of widget trees
- Keeping UI code maintainable

### 9. Package Management

I learned how Flutter packages work and how external packages can be added to a project through:

```yaml
pubspec.yaml
```

Packages can then be installed using:

```bash
flutter pub get
```

I also learned how packages can extend Flutter applications with functionality that does not need to be implemented from scratch.

### 10. Responsive UI

I learned the basics of building Flutter interfaces that can work across different screen sizes.

This introduced concepts such as:

- Screen dimensions
- Flexible layouts
- Responsive sizing
- Avoiding hard-coded dimensions where possible
- Adapting layouts to different devices

### 11. Networking and Asynchronous Programming

I learned how Flutter communicates with external APIs.

Topics covered include:

- HTTP requests
- GET requests
- JSON responses
- `jsonDecode`
- Creating Dart model classes
- Converting JSON into Dart objects
- `Future`
- `async`
- `await`
- `FutureBuilder`

Example:

```dart
Future<Activity> getData() async {
  final url = Uri.https(
    'bored-api.appbrewery.com',
    '/random',
  );

  final response = await http.get(url);

  if (response.statusCode == 200) {
    return Activity.fromJson(
      jsonDecode(response.body),
    );
  }

  throw Exception('Failed to load activity');
}
```

I learned that:

```dart
Future<Activity>
```

represents an asynchronous operation that will eventually return an `Activity`.

A `FutureBuilder` can listen to that Future and display different UI depending on whether the request is:

- Loading
- Successful
- Failed

Example:

```dart
FutureBuilder<Activity>(
  future: activityFuture,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    }

    if (snapshot.hasError) {
      return const Text('Something went wrong');
    }

    if (snapshot.hasData) {
      return Text(snapshot.data!.activity);
    }

    return const SizedBox();
  },
)
```

I also learned why an API request that should only happen once should normally be initialized outside `build()`.

```dart
late final Future<Activity> activityFuture;

@override
void initState() {
  super.initState();
  activityFuture = getData();
}
```

This prevents the request from being recreated unnecessarily whenever the widget rebuilds.

### 12. Local Data Persistence

I was introduced to saving small amounts of data locally using `SharedPreferences`.

This can be useful for values such as:

- Whether onboarding has been completed
- User preferences
- Theme settings
- Simple locally persisted values

### 13. App Launcher Icon and Splash Screen

I learned how to customize application-level presentation, including:

- App launcher icons
- Splash screens
- Application branding

### 14. Firebase

The course introduced Firebase integration, including concepts around:

- Firebase setup
- Authentication
- Storing and retrieving data
- Connecting a Flutter application to Firebase services

### 15. Internationalization

I was introduced to internationalization and preparing Flutter applications to support different languages and locales.

### 16. Publishing

The course also introduced the process of preparing a Flutter application for release and publishing.

This helped connect development with the final stages of shipping an application to users.

## Dart Concepts Practiced

Throughout the course I worked with several Dart concepts, including:

```dart
String
int
double
bool
List
Map
final
const
late
Future
void
async
await
```

I also worked with:

- Classes
- Constructors
- Factory constructors
- Custom types
- Null safety
- Function return types
- JSON serialization
- Asynchronous functions

## Key Mental Models

One of the biggest things I learned was how Flutter applications are composed from widgets and how the UI reacts to changes in application state.

```text
Data / State
     ↓
Widgets
     ↓
User Interaction
     ↓
State Changes
     ↓
Widget Rebuild
```

For asynchronous API data:

```text
API Request
     ↓
Future
     ↓
FutureBuilder
     ↓
Loading / Error / Data
     ↓
Updated UI
```

I also learned the distinction between:

```text
getData        = the function itself
getData()      = calling the function
activityFuture = the Future returned from that call
snapshot.data  = the Activity produced when the Future finishes
```

A `Future<Activity>` does not contain the final `Activity` immediately. It represents an asynchronous operation that will eventually produce one.

For example:

```dart
late final Future<Activity> activityFuture;

@override
void initState() {
  super.initState();
  activityFuture = getData();
}
```

Here, `getData()` is called inside `initState()`, and the returned `Future<Activity>` is stored in `activityFuture`.

Then:

```dart
FutureBuilder<Activity>(
  future: activityFuture,
  builder: ...
)
```

does not call `getData()` again. It listens to the existing Future.

This is useful because `build()` can run multiple times.

Writing:

```dart
FutureBuilder<Activity>(
  future: getData(),
  builder: ...
)
```

can recreate the Future whenever the widget rebuilds, potentially causing repeated API requests.

## Flutter and Dart Concepts to Keep Studying

The course gave me a foundation, but the areas I want to continue strengthening include:

- Dart type system
- Variables and null safety
  - `var`
  - `final`
  - `const`
  - `late`
  - Nullable types
- Functions and return types
- `Future`, `async`, and `await`
- `FutureBuilder`
- `Stream` and `StreamBuilder`
- Widget lifecycle
- State management
- Navigation
- Forms and validation
- Local persistence
- API architecture
- Error handling
- Responsive layouts
- Reusable components
- Project structure

## Next Step

After completing this course, my next step is to move away from tutorial-driven development and build a small Flutter application independently.

The first independent project will focus on:

- Basic CRUD operations
- State management
- Local data persistence
- Forms and validation
- Navigation
- Reusable widgets
- Responsive layouts
- Clean project structure

The goal is not just to reproduce tutorial code, but to become comfortable making implementation decisions and understanding why the code works.

## Learning Approach Going Forward

Rather than immediately watching another complete course, the goal is to build and use tutorials, documentation, and AI when needed.

The focus is to:

- Attempt features independently first
- Use AI to review, explain, or unblock
- Understand generated code before accepting it
- Learn concepts rather than memorizing syntax
- Revisit targeted topics when weaknesses become obvious
- Build complete projects instead of staying in tutorial mode

## Tech Stack

- Flutter
- Dart
- Material Design
- HTTP
- SharedPreferences
- Firebase

## Status

✅ Flutter fundamentals course completed.

🚧 Next: Build an independent Flutter project to reinforce and apply the concepts learned.