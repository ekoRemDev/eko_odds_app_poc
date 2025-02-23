import 'package:eko_assignment/utils/validate_email.dart';
import 'package:flutter_test/flutter_test.dart'; // Update with the correct file path

void main() {
  group('validateEmail', () {
    test('should return true for valid email', () {
      expect(validateEmail('test@example.com'), isTrue);
      expect(validateEmail('user123@mail.co.uk'), isTrue);
      expect(validateEmail('my.email+tag@gma2il.com'), isTrue);
    });

    test('should return false for invalid email', () {
      expect(validateEmail('plainaddress'), isFalse);
      expect(validateEmail('missing@domain'), isFalse);
      expect(validateEmail('missing@.com'), isFalse);
      expect(validateEmail('@missinguser.com'), isFalse);
      expect(validateEmail('test@domain.c'), isFalse); // TLD should be at least 2 characters
      expect(validateEmail('test@domain..com'), isFalse);
    });

    test('should return false for empty or null email', () {
      expect(validateEmail(''), isFalse);
    });
  });
}
