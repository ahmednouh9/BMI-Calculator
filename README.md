# BMI Calculator
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/ahmednouh9/BMI-Calculator)

This is a cross-platform BMI (Body Mass Index) calculator application built with Flutter. It provides an intuitive interface for users to calculate their BMI based on gender, age, weight, and height. The results are displayed with clear visual indicators and helpful information.

## Features

- **Gender Selection**: A dedicated screen to choose between male and female personas.
- **Interactive Inputs**: Easily input weight and age with increment/decrement buttons that support long-press for faster adjustments.
- **Custom Height Slider**: A visually appealing and interactive ruler-style slider for precise height selection.
- **Detailed Results**: The result screen displays:
    - The calculated BMI value.
    - A color-coded BMI category (Underweight, Normal, Overweight, Obese).
    - A visual progress bar indicating where the user's BMI falls on the health spectrum.
    - The healthy weight range for the user's specified height.
- **Responsive UI**: The layout adapts to different screen sizes for a consistent experience.

## Application Flow

1.  **Gender Selection Screen**: The user is first prompted to select their gender.
2.  **Metrics Input Screen**: After selecting a gender, the user proceeds to a screen to input their weight (kg), age, and height (cm).
3.  **Result Screen**: Upon tapping "Calculate", the application computes the BMI and displays the results on a dedicated page with detailed health context.

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

Ensure you have the Flutter SDK installed on your machine. For installation guides, refer to the [official Flutter documentation](https://flutter.dev/docs/get-started/install).

### Installation and Execution

1.  Clone the repository:
    ```sh
    git clone https://github.com/ahmednouh9/bmi-calculator.git
    ```
2.  Navigate to the project directory:
    ```sh
    cd bmi-calculator
    ```
3.  Install the required dependencies:
    ```sh
    flutter pub get
    ```
4.  Run the application:
    ```sh
    flutter run
    ```

## Project Structure

The core application logic is contained within the `lib/` directory:

-   `main.dart`: The entry point for the Flutter application.
-   `home_page.dart`: Implements the initial gender selection screen.
-   `second_Screen.dart`: Contains the UI and logic for inputting weight, age, and height.
-   `rusalt_page.dart`: Displays the final calculated BMI and related health information.
