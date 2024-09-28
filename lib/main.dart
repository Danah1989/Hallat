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
                    fontSize: screenWidth * 0.094, // Dynamic font size based on screen width
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
              child: Container(
                width: screenWidth * 0.8,
                height: screenHeight * 0.08, // Dynamic button height
                decoration: BoxDecoration(
                  color: const Color(0xCE020202), // Button color
                  borderRadius: BorderRadius.circular(screenWidth * 0.02), // Rounded corners
                ),
                child: Center(
                  child: Text(
                    'Sign up with email',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.05, // Dynamic font size
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.29,
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
                          fontSize: screenWidth * 0.045,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Log In',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.045,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline
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
    double baseFontSize = screenWidth * 0.05; // Base font size for dynamic scaling

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
                top: screenHeight * 0.11,
                child: Image.network(
                  'https://raw.githubusercontent.com/Danah1989/Hallat/refs/heads/main/assets/Logo2.png',
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
                  height: screenHeight * 0.08,
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
                top: screenHeight * 0.65,
                child: Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.08,
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
                    color: const Color(0xCE020202),
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  ),
                  child: Center(
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: baseFontSize * 0.95,
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
                top: screenHeight * 0.74,
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

// SignUpPage (third page)
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key}); // Including the key parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Page'),
      ),
      body: const Center(
        child: Text('This is the Sign-Up page.'), // Placeholder content for sign-up page
      ),
    );
  }
}
