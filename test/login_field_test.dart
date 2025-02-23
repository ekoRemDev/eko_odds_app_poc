import 'package:eko_assignment/screens/login_screen/_widgets/login_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginField Widget', () {
    testWidgets('renders correctly and handles text input', (WidgetTester tester) async {
      final TextEditingController controller = TextEditingController();

      void onChanged(String value) {}

      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LoginField(
              controller: controller,
              hintText: 'Enter your email',
              onChanged: onChanged,
            ),
          ),
        ),
      );

      // Verify that the LoginField widget is rendered
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Enter your email'), findsOneWidget);

      // Verify that the hint text is displayed correctly
      final hintTextFinder = find.text('Enter your email');
      expect(hintTextFinder, findsOneWidget);

      // Simulate text input
      await tester.enterText(find.byType(TextField), 'test@example.com');
      expect(controller.text, 'test@example.com');

      // Verify if the suffixIcon exists (optional)
      expect(find.byType(Icon), findsNothing); // Adjust according to your widget
    });

    testWidgets('shows the correct border colors when focused', (WidgetTester tester) async {
      // Create a TextEditingController for testing
      final TextEditingController controller = TextEditingController();

      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LoginField(
              controller: controller,
              hintText: 'Enter your password',
              obscureText: true,
              onChanged: (value) {},
            ),
          ),
        ),
      );

      // Verify the default border color
      final borderBeforeFocus =
          tester.widget<TextField>(find.byType(TextField)).decoration?.focusedBorder as OutlineInputBorder?;
      expect(borderBeforeFocus?.borderSide.color, Colors.green);

      // Tap the TextField to focus it
      await tester.tap(find.byType(TextField));
      await tester.pump();

      // Verify if the focused border color changes (if the widget supports focus behavior)
      final borderAfterFocus =
          tester.widget<TextField>(find.byType(TextField)).decoration?.focusedBorder as OutlineInputBorder?;
      expect(borderAfterFocus?.borderSide.color, Colors.green); // You can modify this as needed
    });
  });
}
