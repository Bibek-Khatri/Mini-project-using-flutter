# Plan: Add Firebase Authentication to loginPage.dart

## Goal
Wire up Firebase Auth email/password sign-in on `lib/chat/pages/loginPage.dart` so the Login button actually authenticates instead of blindly navigating to the dashboard.

## Current State
- `pubspec.yaml` already declares `firebase_auth: ^7.0.1` and `firebase_core: ^5.1.0`
- `lib/main.dart:9` already calls `Firebase.initializeApp()` and sets `loginPage()` as the home route
- `lib/chat/pages/loginPage.dart` has email/password `TextField`s but no `TextEditingController`s, no auth logic, and the Login button just pushes `dashboard()` unconditionally

## Decisions
1. Use `FirebaseAuth.instance.signInWithEmailAndPassword` for email/password sign-in
2. Add `TextEditingController` for email and password, disposed in `dispose()`
3. Show an `isLoading` flag during sign-in (disable button, show progress indicator)
4. Show errors via `ScaffoldMessenger` SnackBar on sign-in failure
5. On success, navigate to `dashboard()` and clear controllers
6. Add `authStateChanges` listener in `initState` to navigate to dashboard if user is already signed in when the page loads

## Affected Files
- `lib/chat/pages/loginPage.dart` — add auth imports, controllers, sign-in logic, loading state, error handling, auth state listener
- `lib/main.dart` — no change needed (Firebase already initialized)

## Implementation Steps
1. Add imports: `firebase_auth`, `firebase_core` (already in main), `dart:async` if needed
2. Add `final _auth = FirebaseAuth.instance;` and two `TextEditingController`s
3. Add `bool _isLoading = false;` state
4. In `initState`, add `FirebaseAuth.instance.authStateChanges().listen((user) => if user != null, navigate to dashboard)`
5. Replace email/password `TextField` decoration `hint:` with `hintText:` and assign controllers
6. Replace Login `onTap` with `_signInWithEmailAndPassword` that:
   - sets `_isLoading = true`
   - calls `signInWithEmailAndPassword`
   - on success: `Navigator.pushReplacement` to dashboard, clear controllers
   - on failure: show SnackBar with error message, set `_isLoading = false`
   - in `finally`: set `_isLoading = false`
7. Add `dispose()` to dispose controllers
8. Gate the Login button with `_isLoading` (show `CircularProgressIndicator` when loading)
9. Fix duplicate import of `dashboard.dart` (line 1 and 3)

## Validation
- `flutter analyze` passes on `lib/chat/pages/loginPage.dart`
- `flutter pub get` resolves `firebase_auth` and `firebase_core`
- Sign-in with valid credentials navigates to dashboard; invalid credentials show error SnackBar

## Open Questions / Out of Scope
- Password reset / "forget password?" flow (out of scope for now)
- Register Now flow (out of scope for now)
- Firestore user profile creation on sign-up (out of scope)
- Platform-specific Firebase config files (`google-services.json`, `GoogleService-Info.plist`) — assumed already present or handled separately
