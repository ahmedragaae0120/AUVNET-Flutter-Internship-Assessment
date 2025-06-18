# 📱 AUVNET Flutter Internship Assessment

A Flutter-based e-commerce application developed for AUVNET internship assessment, following **Clean Architecture** principles and **BLoC** state management. The project integrates **Supabase** for backend services and **Hive** for offline caching, with a strong focus on scalable and maintainable code.

---

## 🛠 Project Setup & Installation Guide

### 🔧 Prerequisites

- Flutter SDK (latest stable version recommended)
- Dart SDK
- Supabase Project with API keys
- Android Studio or VS Code with Flutter extensions

---

### 🚀 Installation Steps

1. **Clone the repository**

```bash
git clone https://github.com/yourusername/auvnet_flutter_internship_assessment.git
cd auvnet_flutter_internship_assessment
```

2. **Install dependencies**

```bash
flutter pub get
```

3. **Setup Supabase**

- Go to [Supabase](https://supabase.io) and create a project.
- Enable **Authentication**, **Database**, and **Storage**.
- Retrieve your Supabase `url` and `anon key` and add them to your `lib/core/utils/constants.dart` or `.env` file.

```dart
const String supabaseUrl = 'https://your-project.supabase.co';
const String supabaseAnonKey = 'your-anon-key';
```

4. **Setup Hive (Local Storage)**

Hive is used to cache data and store preferences. Boxes are opened on app startup in the infrastructure layer.

5. **Run the App**

```bash
flutter run
```

---

## 🧱 Architectural Overview & Rationale

### ✅ Clean Architecture

The app is structured based on **Clean Architecture** to promote:

- Separation of concerns
- Testability
- Maintainability
- Scalability

#### 📂 Layers Breakdown

```
lib/
│
├── core/                   # Shared utilities, themes, constants
├── data/                   # Data sources (Supabase, Hive) and models (DTOs)
│   ├── datasources/
│   ├── model/
│   └── repository_impl/
│
├── domain/                 # Business logic
│   ├── entities/
│   ├── repositories/
│   └── usecases/
│
├── ui/                     # Presentation layer
│   ├── pages/
│   ├── widgets/
│   └── view_model/         # BLoC & states
│
└── main.dart               # App entry point
```

---

### 🔄 State Management

- **`flutter_bloc`** is used for all state management.
- Each BLoC follows the **immutable state with copyWith()** pattern to ensure state purity.
- Separation between event and state classes allows for predictable UI behavior and testing.

---

### ☁️ Backend: Supabase

- **Authentication:** Email/Password sign-in
- **PostgreSQL Database:** For products, cart, orders
- **Storage:** For images and files

---

### 🗃 Local Storage with Hive

- Used to cache data like product list and user preferences.
- Ensures offline access and faster load times.
- Lightweight and fast NoSQL DB suited for mobile use.

---

### 🎨 UI/UX

- Fully responsive layout compatible with phones and tablets.
- Clean, minimal design from the provided [Figma](https://www.figma.com/community/file/1516187112598079359/flutter-internship-task).
- All screens are accessible and adapted to multiple orientations.

---

## 🧪 Code Quality & Practices

- Follows **Dart and Flutter best practices**
- Modular and layered structure
- Well-documented classes and functions
- Each module is independently testable

---

## 📤 Submission

- Repo Name: `AUVNET Flutter Internship Assessment`
- Submit your GitHub repo here: [Submission Form](https://forms.gle/Cs8XD8BGYesN1gTu)
- Make sure to use the same email as in your internship application

---

## 📅 Deadline

- Assignment Received: **June 16**
- Final Submission Due: **June 18**

---

## 📩 Contact

If you have questions or need clarification, reach out at:  
📧 [AhmedRoyale@AUVNET.com](mailto:AhmedRoyale@AUVNET.com)