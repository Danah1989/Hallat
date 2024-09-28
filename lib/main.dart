import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const MyApp());
}

// Main entry point widget
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Including the key parameter for widget identity

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Set the starting page to MyHomePage
      home: const MyHomePage(),
    );
  }
}

// First screen (Home page)
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key}); // Including the key parameter for widget identity

  @override
  Widget build(BuildContext context) {
    // Get device screen dimensions for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double baseFontSize = screenWidth * 0.05; // Base font size for consistency

    return Scaffold(
      // Main container for the home page
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          color: Color(0xFF324404), // Background color for the screen
        ),
        child: Stack(
          children: [
            // Background image
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.7, // 70% of screen height for background
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://raw.githubusercontent.com/Danah1989/Hallat/refs/heads/main/assets/Get%20Started.png',
                    ),
                    fit: BoxFit.cover, // Scale the image to cover the entire area
                  ),
                ),
              ),
            ),

            // Gradient overlay
            Positioned(
              left: 0,
              top: screenHeight * 0.301,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.4,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent, // Top is transparent
                      Color(0xFF324404), // Bottom blends into background color
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),

            // Title text "Ready to explore Saudi Arabia?"
            Positioned(
              left: screenWidth * 0.05,
              top: screenHeight * 0.67,
              child: SizedBox(
                width: screenWidth * 0.9,
                height: screenHeight * 0.2,
                child: Text(
                  'Ready to explore \nSaudi Arabia?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: baseFontSize * 1.88, // Dynamic font size based on screen width
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    height: 1.2, // Line height between the two lines of text
                  ),
                ),
              ),
            ),

            // "Sign up with email" button
            Positioned(
              left: screenWidth * 0.1,
              top: screenHeight * 0.81,
              child: GestureDetector( // Wrap the Container with GestureDetector to listen for taps
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()), // Navigates to SignUpPage
                  );
                },
                child: Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.08, // Dynamic button height
                  decoration: BoxDecoration(
                    color: Colors.black, // Button color
                    borderRadius: BorderRadius.circular(screenWidth * 0.02), // Rounded corners
                  ),
                  child: Center(
                    child: Text(
                      'Sign up with email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: baseFontSize, // Dynamic font size
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.29,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // "Already have an account? Log In" text with clickable Log In
            Positioned(
              left: screenWidth * 0.1,
              top: screenHeight * 0.89,
              child: SizedBox(
                width: screenWidth * 0.8,
                height: screenHeight * 0.05,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: baseFontSize * 0.9, // Dynamic font size
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Log In',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: baseFontSize * 0.9, // Dynamic font size
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(), // Correct builder definition
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Login page (second page)
class Login extends StatefulWidget {
  const Login({super.key}); // Including the key parameter

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  bool _isPasswordVisible = false; // Track password visibility

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double baseFontSize = screenWidth * 0.05; // Base font size for consistency

    return Scaffold(
      // Scrollable layout
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(
            color: Color(0xFF324404), // Background color for the login page
          ),
          child: Stack(
            children: [
              // Black background for the top portion
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.7,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),

              // Logo image positioned at the top
              Positioned(
                left: screenWidth * 0.1,
                top: screenHeight * 0.06,
                child: Image.network(
                  'https://raw.githubusercontent.com/Danah1989/Hallat/refs/heads/main/assets/Logo_2.png',
                  width: screenWidth * 0.8, // Responsive width for the logo
                  height: screenHeight * 0.35, // Responsive height for the logo
                ),
              ),

              // Gradient overlay for blending the top background
              Positioned(
                left: 0,
                top: screenHeight * 0.301,
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.4,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent, // Transparent top part of the gradient
                        Color(0xFF324404), // Dark green gradient blending into the background
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),

              // "Email or Phone Number" input field
              Positioned(
                left: screenWidth * 0.1,
                top: screenHeight * 0.55,
                child: Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.068,
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: baseFontSize * 0.9),
                    textAlignVertical: TextAlignVertical.center, // Center text vertically
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01, // Vertical padding
                        horizontal: screenWidth * 0.04, // Horizontal padding
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.0),
                      hintText: 'Email or Phone Number',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: baseFontSize * 0.9, // Dynamic font size for the placeholder text
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),

              // "Password" input field with toggle visibility button
              Positioned(
                left: screenWidth * 0.1,
                top: screenHeight * 0.64,
                child: Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.068,
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  ),
                  child: TextField(
                    obscureText: !_isPasswordVisible, // Toggles password visibility
                    style: TextStyle(color: Colors.white, fontSize: baseFontSize * 0.9),
                    textAlignVertical: TextAlignVertical.center, // Center text vertically
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01, // Vertical padding
                        horizontal: screenWidth * 0.04, // Horizontal padding
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.0),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: baseFontSize * 0.9,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible; // Toggle visibility
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),

              // "Log in" button
              Positioned(
                left: screenWidth * 0.1,
                top: screenHeight * 0.81,
                child: Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.08,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  ),
                  child: Center(
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: baseFontSize, // Consistent font size
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.29,
                      ),
                    ),
                  ),
                ),
              ),

              // "Forgot password?" text (clickable)
              Positioned(
                left: screenWidth * 0.54,
                top: screenHeight * 0.72,
                child: GestureDetector(
                  onTap: () {
                    // Implement the Forgot Password functionality here
                  },
                  child: Text(
                    'Forgot password?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xB2D9D9D9),
                      fontSize: baseFontSize * 0.9,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // "I don't have an account? Sign up" text with clickable "Sign up"
              Positioned(
                left: screenWidth * 0.1,
                top: screenHeight * 0.89,
                child: SizedBox(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.04,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'I don’t have an account? ',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: baseFontSize * 0.9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            letterSpacing: 0.20,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: baseFontSize * 0.9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                            letterSpacing: 0.20,
                            decoration: TextDecoration.underline, // Optional: Adds underline to make it look like a link
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Controllers to capture user input
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false; // Track password visibility

  // Helper function for creating input fields
  Widget buildInputField(String label, TextEditingController controller, double width, double height, double fontSize, {bool isPassword = false}) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8), // Rounded corners for input fields
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword && !_isPasswordVisible, // Toggle password visibility if this is a password field
        style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          fontSize: fontSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16), // Adjust padding inside the field
          filled: true,
          fillColor: Colors.transparent, // Transparent to show container's color
          hintText: label,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: fontSize,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), // Rounded edges
            borderSide: BorderSide.none, // Remove border line
          ),
          // If this is a password field, add an icon to toggle password visibility
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.white.withOpacity(0.7),
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible; // Toggle visibility
              });
            },
          )
              : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double baseFontSize = screenWidth * 0.05; // Dynamic font size based on screen width

    return Scaffold(
      // Scrollable layout
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(
            color: Color(0xFF324404), // Background color for the login page
          ),
          child: Stack(
            children: [
              // Black Background
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.7,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),

              // Logo image positioned at the top
              Positioned(
                left: screenWidth * 0.1,
                top: screenHeight * 0.06,
                child: Image.network(
                  'https://raw.githubusercontent.com/Danah1989/Hallat/refs/heads/main/assets/Logo_2.png',
                  width: screenWidth * 0.8, // Responsive width for the logo
                  height: screenHeight * 0.35, // Responsive height for the logo
                ),
              ),

              // Gradient overlay for blending the top background
              Positioned(
                left: 0,
                top: screenHeight * 0.301,
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.4,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent, // Transparent top part of the gradient
                        Color(0xFF324404), // Dark green gradient blending into the background
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),

              // Form Fields
              Positioned(
                left: screenWidth * 0.1,
                top: screenHeight * 0.40,
                child: Column(
                  children: [
                    // First Name Field
                    buildInputField('First name', firstNameController, screenWidth * 0.8, screenHeight * 0.068, baseFontSize * 0.9,), // Matching height
                    const SizedBox(height: 15),

                    // Last Name Field
                    buildInputField('Last name', lastNameController, screenWidth * 0.8, screenHeight * 0.068, baseFontSize * 0.9,), // Matching height
                    const SizedBox(height: 15),

                    // Email Field
                    buildInputField('Email', emailController, screenWidth * 0.8, screenHeight * 0.068, baseFontSize * 0.9,), // Matching height
                    const SizedBox(height: 15),

                    // Phone Number Field
                    buildInputField('Phone Number', phoneNumberController, screenWidth * 0.8, screenHeight * 0.068, baseFontSize * 0.9,), // Matching height
                    const SizedBox(height: 15),

                    // Password Field with visibility toggle
                    buildInputField('Password', passwordController, screenWidth * 0.8, screenHeight * 0.068, baseFontSize * 0.9, isPassword: true), // Matching height
                    const SizedBox(height: 25),
                  ],
                ),
              ),

              // Sign up button
              Positioned(
                left: screenWidth * 0.1,
                top: screenHeight * 0.82,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VerifyEmailPage(), // Replace with your Verify Email page
                      ),
                    );
                  },
                  child: Container(
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.08,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                    child: Center(
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: baseFontSize, // Consistent font size
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.29,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double baseFontSize = screenWidth * 0.045; // Base font size for dynamic scaling

    // Controllers for each input field
    List<TextEditingController> codeControllers = List.generate(5, (_) => TextEditingController());

    // Focus nodes for controlling focus between the fields
    List<FocusNode> focusNodes = List.generate(5, (_) => FocusNode());

    // Function to clear input fields
    void clearCodeInputs() {
      for (var controller in codeControllers) {
        controller.clear(); // Clear each input field
      }
      FocusScope.of(context).unfocus(); // Unfocus all text fields to hide keyboard
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(
            color: Color(0xFF324404), // Background color for the login page
          ),
          child: Stack(
            children: [
              // Background for top section
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.7,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),

              // Logo image positioned at the top
              Positioned(
                left: screenWidth * 0.1,
                top: screenHeight * 0.06,
                child: Image.network(
                  'https://raw.githubusercontent.com/Danah1989/Hallat/refs/heads/main/assets/Logo_2.png',
                  width: screenWidth * 0.8, // Responsive width for the logo
                  height: screenHeight * 0.35, // Responsive height for the logo
                ),
              ),

              // Gradient overlay for blending the top background
              Positioned(
                left: 0,
                top: screenHeight * 0.301,
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.4,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent, // Transparent top part of the gradient
                        Color(0xFF324404), // Dark green gradient blending into the background
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),

              // Instructional Text
              Positioned(
                left: screenWidth * 0.1,
                top: screenHeight * 0.55,
                child: SizedBox(
                  width: screenWidth * 0.8,
                  child: Text(
                    'We just sent a 5-digit code to your email, enter it below:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: baseFontSize,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              // Code input boxes (adjusted for responsiveness)
              Positioned(
                left: screenWidth * 0.14,
                top: screenHeight * 0.65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 5; i++) ...[
                      Container(
                        width: screenWidth * 0.12,
                        height: screenHeight * 0.07,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(screenWidth * 0.02),
                        ),
                        child: Center(
                          child: TextField(
                            controller: codeControllers[i],
                            focusNode: focusNodes[i],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1, // Limit input to 1 character
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              counterText: "",
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty && i < 4) {
                                // Move to the next field if a digit is entered
                                FocusScope.of(context).requestFocus(focusNodes[i + 1]);
                              } else if (value.isEmpty && i > 0) {
                                // Move back to the previous field if backspace is pressed
                                FocusScope.of(context).requestFocus(focusNodes[i - 1]);
                              }
                            },
                            onSubmitted: (_) {
                              // Allow submitting by clearing inputs for retry
                              codeControllers.forEach((controller) {
                                controller.clear();
                              });
                              FocusScope.of(context).unfocus();
                            },
                          ),
                        ),
                      ),
                      if (i < 4) SizedBox(width: screenWidth * 0.03), // Add spacing between boxes
                    ],
                  ],
                ),
              ),

              // Verify email button
              Positioned(
                left: screenWidth * 0.1,
                top: screenHeight * 0.75,
                child: GestureDetector(
                  onTap: () {
                    // Logic to verify the code goes here (e.g., call an API)
                    // After verification, clear the inputs
                    clearCodeInputs();
                  },

                  child: Container(
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.08, // Dynamic button height
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                    child: Center(
                      child: Text(
                        'Verify email',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: baseFontSize,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Wrong email? Text
              Positioned(
                left: screenWidth * 0.15,
                top: screenHeight * 0.84,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Wrong email? ',
                        style: TextStyle(
                          color: const Color(0xFFEBEDF0),
                          fontSize: baseFontSize * 0.9,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Send to different email',
                        style: TextStyle(
                          color: const Color(0xFFEBEDF0),
                          fontSize: baseFontSize * 0.9,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const SignUpPage()), // Navigate back to login page
                            );
                          },
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
