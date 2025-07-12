/// A centralized logging utility that provides structured logging capabilities
/// using the `dart:developer` package for better debugging and monitoring.
///
/// This logger provides different log levels and context-specific methods
/// for better organization and filtering of log messages. It follows
/// Flutter/Dart best practices for logging in production applications.
///
/// ## Features
/// - Multiple log levels (debug, info, warning, error, verbose)
/// - Context-specific logging methods
/// - Proper error handling with stack traces
/// - Production-ready logging that can be easily filtered or disabled
///
/// ## Usage Examples
/// ```dart
/// // Basic logging
/// Logger.info('User logged in successfully');
/// Logger.error('Failed to fetch data', exception, stackTrace);
///
/// // Context-specific logging
/// Logger.auth('User authentication completed');
/// Logger.task('Task created with ID: ${task.id}');
/// Logger.database('Database query executed');
/// ```
///
/// ## Log Levels
/// - **Debug (500)**: Detailed information for debugging
/// - **Info (800)**: General information about application flow
/// - **Warning (900)**: Potential issues that don't stop execution
/// - **Error (1000)**: Errors that need attention
/// - **Verbose (300)**: Very detailed information for deep debugging
import 'dart:developer' as developer;

/// Centralized logging utility for the BlocArch application.
///
/// Provides structured logging with different levels and context-specific
/// methods for better debugging and monitoring capabilities.
class Logger {
  /// Default tag used for logging when no specific tag is provided.
  static const String _tag = 'BlocArch';

  /// Logs a debug message with optional custom tag.
  ///
  /// Debug messages contain detailed information useful for debugging
  /// but are typically not needed in production.
  ///
  /// [message] The message to log.
  /// [tag] Optional custom tag for categorizing the log message.
  static void debug(String message, [String? tag]) {
    developer.log(
      message,
      name: tag ?? _tag,
      level: 500, // Debug level
    );
  }

  /// Logs an informational message with optional custom tag.
  ///
  /// Info messages contain general information about application flow
  /// and are useful for understanding what the application is doing.
  ///
  /// [message] The message to log.
  /// [tag] Optional custom tag for categorizing the log message.
  static void info(String message, [String? tag]) {
    developer.log(
      message,
      name: tag ?? _tag,
      level: 800, // Info level
    );
  }

  /// Logs a warning message with optional custom tag.
  ///
  /// Warning messages indicate potential issues that don't stop
  /// execution but should be monitored.
  ///
  /// [message] The message to log.
  /// [tag] Optional custom tag for categorizing the log message.
  static void warning(String message, [String? tag]) {
    developer.log(
      message,
      name: tag ?? _tag,
      level: 900, // Warning level
    );
  }

  /// Logs an error message with optional error object and stack trace.
  ///
  /// Error messages indicate actual errors that need attention
  /// and can include the error object and stack trace for debugging.
  ///
  /// [message] The error message to log.
  /// [error] Optional error object to include in the log.
  /// [stackTrace] Optional stack trace to include in the log.
  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    developer.log(
      message,
      name: _tag,
      level: 1000, // Error level
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Logs a verbose message with optional custom tag.
  ///
  /// Verbose messages contain very detailed information useful for
  /// deep debugging but are typically disabled in production.
  ///
  /// [message] The message to log.
  /// [tag] Optional custom tag for categorizing the log message.
  static void verbose(String message, [String? tag]) {
    developer.log(
      message,
      name: tag ?? _tag,
      level: 300, // Verbose level
    );
  }

  // Convenience methods for specific contexts

  /// Logs an application-level informational message.
  static void app(String message) => info(message, 'App');

  /// Logs an authentication-related informational message.
  static void auth(String message) => info(message, 'Auth');

  /// Logs a task-related informational message.
  static void task(String message) => info(message, 'Task');

  /// Logs a notification-related informational message.
  static void notification(String message) => info(message, 'Notification');

  /// Logs a synchronization-related informational message.
  static void sync(String message) => info(message, 'Sync');

  /// Logs a database-related informational message.
  static void database(String message) => info(message, 'Database');

  /// Logs a network-related informational message.
  static void network(String message) => info(message, 'Network');
}
