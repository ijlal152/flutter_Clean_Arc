// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: always_put_required_named_parameters_first

import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  const LocalUser({
    required this.uid,
    required this.email,
    this.profilePic,
    this.bio,
    required this.points,
    required this.fullName,
    required this.groupId,
    required this.enrolledCoursesIds,
    required this.following,
    required this.followers,
  });
  final String uid;
  final String email;
  final String? profilePic;
  final String? bio;
  final int points;
  final String fullName;
  final List<String> groupId;
  final List<String> enrolledCoursesIds;
  final List<String> following;
  final List<String> followers;

  @override
  List<Object?> get props => [uid, email];




}
