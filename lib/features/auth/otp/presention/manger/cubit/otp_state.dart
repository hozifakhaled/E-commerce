part of 'otp_cubit.dart';

@immutable
class PhoneAuthState {
  final bool loading;
  final String? error;
  final String? verificationId;

  const PhoneAuthState({
    this.loading = false,
    this.error,
    this.verificationId,
  });

  PhoneAuthState copyWith({
    bool? loading,
    String? error,
    String? verificationId,
  }) {
    return PhoneAuthState(
      loading: loading ?? this.loading,
      error: error,
      verificationId: verificationId ?? this.verificationId,
    );
  }
}