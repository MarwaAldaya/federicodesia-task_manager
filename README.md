# Task Management App - Flutter Senior Developer Technical Test

A robust, feature-complete task management application built with Flutter, demonstrating advanced architectural patterns, offline-first capabilities, and production-ready features.

## 🚀 Features

### 🔐 Authentication & Onboarding
- **Firebase Authentication** with email/password
- **Workspace-based registration** - users choose workspace name during signup
- **Multi-workspace login** - users can belong to multiple workspaces
- **Password validation** with complexity rules (uppercase, lowercase, numbers, special characters, 8+ characters)
- **Workspace selection** after email validation during login

### 📋 Task Management
- **Complete CRUD operations** - Create, Read, Update, Delete tasks
- **Advanced filtering** by status, assignee, and due date
- **Task properties**:
  - Title (required)
  - Description
  - Due date (validates against past dates)
  - Priority levels (Low, Medium, High)
  - Status (Todo, In Progress, Done)
  - Assignee selection
- **Real-time task list** with pull-to-refresh
- **Empty state handling** with call-to-action buttons

### 🔄 Offline-First Architecture
- **Local SQLite database** using Drift ORM
- **Automatic synchronization** when connection is restored
- **Background sync manager** with cron-based scheduling (every 10 minutes)
- **Compensating actions** for data consistency
- **Sync status tracking** for all operations
- **Conflict resolution** with proper error handling

### 🔔 Notifications
- **Local notifications** for upcoming task deadlines
- **Daily scheduled notifications** at 8:00 AM and 5:00 PM
- **In-app notifications** when app is in foreground
- **System notifications** when app is in background
- **Timezone-aware scheduling**

### 🎨 User Experience
- **Responsive design** with Flutter ScreenUtil
- **Material Design 3** components
- **Loading states** with shimmer effects
- **Error handling** with user-friendly messages
- **Internationalization** support (English/Arabic)

## 🏗️ Architecture

### Clean Architecture
```
lib/
├── core/                    # Core utilities and shared components
│   ├── app/                # App-level services and configuration
│   ├── const/              # Constants and configuration
│   ├── data_sources/       # Data layer abstractions
│   ├── domain/             # Domain entities and use cases
│   ├── utils/              # Utility classes and extensions
│   └── widgets/            # Shared UI components
├── features/               # Feature modules
│   ├── auth/              # Authentication feature
│   ├── task/              # Task management feature
│   ├── sync/              # Synchronization feature
│   ├── user/              # User management feature
│   └── workspace/         # Workspace management feature
└── generated/             # Auto-generated files
```

### State Management
- **BLoC/Cubit** for state management
- **Freezed** for immutable state classes
- **Injectable** for dependency injection
- **GetIt** for service locator pattern

### Data Layer
- **Repository Pattern** with remote and local data sources
- **Firebase Firestore** for remote data storage
- **SQLite (Drift)** for local data storage
- **Dio** for HTTP client with interceptors

## 🛠️ Technology Stack

### Core Dependencies
- **Flutter 3.27.0+** - UI framework
- **Dart 3.7.0+** - Programming language
- **Firebase** - Authentication and Firestore
- **Drift** - Local database ORM
- **BLoC** - State management
- **GetIt** - Dependency injection
- **Auto Route** - Navigation
- **Easy Localization** - Internationalization

### Development Dependencies
- **Build Runner** - Code generation
- **Freezed** - Immutable classes
- **Injectable** - Dependency injection generation

## 📱 Screenshots

*[Screenshots will be added here]*

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.27.0 or higher
- Dart SDK 3.7.0 or higher
- Android Studio / VS Code
- Firebase project setup

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/MarwaAldaya/federicodesia-task_manager.git
   cd federicodesia-task_manager
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Create a new Firebase project
   - Enable Authentication (Email/Password)
   - Enable Firestore Database
   - Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Place them in the appropriate platform directories

4. **Firestore Security Rules**
   ```javascript
   rules_version = '2';
   service cloud.firestore {
     match /databases/{database}/documents {
       // Users can read/write their own data
       match /users/{userId} {
         allow read, write: if request.auth != null && request.auth.uid == userId;
       }
       
       // Users can read/write tasks in their workspaces
       match /tasks/{taskId} {
         allow read, write: if request.auth != null;
       }
     }
   }
   ```

5. **Generate code**
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs

   flutter pub run easy_localization:generate --source-dir ./assets/translations

   flutter pub run easy_localization:generate --source-dir ./assets/translations -f keys -o locale_keys.g.dart
   ```


6. **Run the app**
   ```bash
   flutter run
   ```

### Build for Production

**Android APK**
```bash
flutter build apk --release
```

**iOS**
```bash
flutter build ios --release
```

## 🔧 Configuration

### Environment Variables
Create a `.env` file in the root directory:
```env
FIREBASE_PROJECT_ID=your-project-id
API_BASE_URL=your-api-url
```

### Firebase Configuration
1. Enable Email/Password authentication
2. Set up Firestore database
3. Configure security rules
4. Add platform-specific configuration files

## 📊 Database Schema

### Firestore Collections
- **users**: User profiles and workspace memberships
- **tasks**: Task data with user associations
- **workspaces**: Workspace information

### Local Database (SQLite)
- **tasks**: Local task storage (sync status retrieved via join)
- **sync_records**: Pending synchronization operations


## 🔄 Sync Strategy

### Offline-First Approach
1. **Online**: Operations performed on remote first, then local
2. **Offline**: Operations stored locally with sync records
3. **Background Sync**: Automatic synchronization every 10 minutes
4. **Conflict Resolution**: Compensating actions for data consistency

### Sync Status Tracking
- **`synced`**: Task has no pending sync records (default state)
- **`needSync`**: Task has pending sync record for create/update/delete operation
- **`failed`**: Previous sync attempt failed (will retry on next sync cycle)
- **Status Determination**: Calculated by joining tasks table with sync_records table


## 📱 Platform Support

- **Android**: API level 21+ (Android 5.0+)
- **iOS**: iOS 12.0+
- **Web**: Modern browsers with Flutter web support

## 🔒 Security Features

- **Firebase Authentication** with secure token management
- **Workspace-based access control**
- **Input validation** and sanitization
- **Secure local storage** with encryption

## 📈 Performance Optimizations

- **Database indexing** for fast queries
- **Memory management** with proper disposal
- **Background processing** for sync operations

## 🐛 Troubleshooting

### Common Issues

1. **Build errors after code generation**
   ```bash
   flutter clean
   flutter pub get
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

2. **Firebase connection issues**
   - Verify `google-services.json` and `GoogleService-Info.plist` are in correct locations
   - Check Firebase project configuration
   - Ensure Firestore security rules are deployed

3. **Sync issues**
   - Check internet connectivity
   - Verify Firebase project permissions
   - Review sync logs in debug console


## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Marwa Aldaya**
- GitHub: [@MarwaAldaya](https://github.com/MarwaAldaya)
- LinkedIn: [Marwa Aldaya](https://www.linkedin.com/in/marwa-aldaya-a320ba224/)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase team for backend services
- BLoC team for state management
- All contributors and maintainers

---

**Note**: This application was developed as part of a Flutter Senior Developer Technical Test, demonstrating advanced architectural patterns, offline-first capabilities, and production-ready features.