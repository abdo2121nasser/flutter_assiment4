part of 'national_id_cubit.dart';

@immutable
abstract class NationalIdState {}

class NationalIdInitial extends NationalIdState {}
class nameValidateState extends NationalIdState {}
class nationalIdISCorrectState extends NationalIdState {}
class getBirthDateState extends NationalIdState {}
class getGovernementState extends NationalIdState {}
class getGenderState extends NationalIdState {}
