// lib/models/assessment_model.dart

class AssessmentModel {
  final String id;
  final String userId;
  final DateTime submittedAt;
  
  // Personal Information
  final int age;
  final String gender;
  final double height; // in cm
  final double currentWeight; // in kg
  final double targetWeight; // in kg
  
  // Health Information
  final List<String> healthConditions;
  final List<String> medications;
  final String activityLevel; // sedentary, light, moderate, active, very active
  final String dietaryPreferences; // vegetarian, vegan, omnivore, etc.
  
  // Goals
  final String primaryGoal; // weight loss, disease management, lifestyle change
  final String timeframe; // 3 months, 6 months, 1 year, ongoing
  
  // Readiness Assessment
  final int motivationLevel; // 1-10
  final int supportSystemLevel; // 1-10
  final bool readyForChange;
  
  // Results
  final String? recommendedProgram;
  final double? bmi;
  final String? healthRiskCategory;

  AssessmentModel({
    required this.id,
    required this.userId,
    required this.submittedAt,
    required this.age,
    required this.gender,
    required this.height,
    required this.currentWeight,
    required this.targetWeight,
    required this.healthConditions,
    required this.medications,
    required this.activityLevel,
    required this.dietaryPreferences,
    required this.primaryGoal,
    required this.timeframe,
    required this.motivationLevel,
    required this.supportSystemLevel,
    required this.readyForChange,
    this.recommendedProgram,
    this.bmi,
    this.healthRiskCategory,
  });

  // Calculate BMI
  double calculateBMI() {
    return currentWeight / ((height / 100) * (height / 100));
  }

  // Convert to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'submittedAt': submittedAt.toIso8601String(),
      'age': age,
      'gender': gender,
      'height': height,
      'currentWeight': currentWeight,
      'targetWeight': targetWeight,
      'healthConditions': healthConditions,
      'medications': medications,
      'activityLevel': activityLevel,
      'dietaryPreferences': dietaryPreferences,
      'primaryGoal': primaryGoal,
      'timeframe': timeframe,
      'motivationLevel': motivationLevel,
      'supportSystemLevel': supportSystemLevel,
      'readyForChange': readyForChange,
      'recommendedProgram': recommendedProgram,
      'bmi': bmi ?? calculateBMI(),
      'healthRiskCategory': healthRiskCategory,
    };
  }

  // Create from Firestore document
  factory AssessmentModel.fromMap(Map<String, dynamic> map) {
    return AssessmentModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      submittedAt: DateTime.parse(map['submittedAt']),
      age: map['age'] ?? 0,
      gender: map['gender'] ?? '',
      height: (map['height'] ?? 0).toDouble(),
      currentWeight: (map['currentWeight'] ?? 0).toDouble(),
      targetWeight: (map['targetWeight'] ?? 0).toDouble(),
      healthConditions: List<String>.from(map['healthConditions'] ?? []),
      medications: List<String>.from(map['medications'] ?? []),
      activityLevel: map['activityLevel'] ?? '',
      dietaryPreferences: map['dietaryPreferences'] ?? '',
      primaryGoal: map['primaryGoal'] ?? '',
      timeframe: map['timeframe'] ?? '',
      motivationLevel: map['motivationLevel'] ?? 0,
      supportSystemLevel: map['supportSystemLevel'] ?? 0,
      readyForChange: map['readyForChange'] ?? false,
      recommendedProgram: map['recommendedProgram'],
      bmi: map['bmi']?.toDouble(),
      healthRiskCategory: map['healthRiskCategory'],
    );
  }
}