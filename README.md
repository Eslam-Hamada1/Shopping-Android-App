# 🛒 Shopping App

A Flutter-based mobile application that simulates a real-world shopping experience.  
The app includes **user authentication, product browsing, cart interactions, smooth animations, and Arabic localization** support.

---

## 📖 Project Overview
This project was developed as part of a **Flutter Mobile App Development** training. It takes you step-by-step from core Dart programming concepts to building a fully functional shopping app with professional UI/UX practices.

Key highlights include:
- Authentication (Sign Up & Sign In)
- Product browsing with GridView & PageView
- Cart functionality with interactive SnackBars
- Responsive and animated UI transitions
---

## 🚀 Features

### 1. Welcome Screen
- Custom fonts & styled AppBar
- Local + online images displayed in a row
- Sign Up and Sign In buttons

### 2. Authentication
- **Sign Up:** Full name, email, password, confirm password (with validation)
- **Sign In:** Email & password validation
- Dialog confirmation on success
- Smooth navigation to the shopping home screen

### 3. Shopping Home Screen
- AppBar: *Our Products*
- **PageView:** Featured product images (horizontal scroll)
- **GridView:** Product cards (2 per row) with images, titles, and add-to-cart icons
  - SnackBar confirmation when adding to cart
- **Hot Offers Section:** ListView with images + descriptions

### 4. Animations
- Fade transition from Sign Up/Sign In → Home Screen

---

## 🛠 Tools & Technologies
- **Language:** Dart  
- **Framework:** Flutter SDK  
- **IDE:** VS Code / Android Studio  
- **Version Control:** GitHub  

---

## Screenshots



## ⚙️ Setup Instructions

### 1. Clone the repository
```bash
git clone https://github.com/your-username/shopping_app.git
cd shopping_app
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Run the app
```bash
flutter run
```
---

##  Project Structure
```bash
lib/
│── main.dart
│── screens/
│   ├── welcome_screen.dart
│   ├── signup_screen.dart
│   ├── signin_screen.dart
│   └── home_screen.dart
│
│── widgets/
│   ├── product_card.dart
│   └── offer_item.dart
│
│── localization/
│   ├── intl_en.arb
│   └── intl_ar.arb


