// lib/services/firestore_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/assessment_model.dart';
import '../utils/firebase_config.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ==================== ASSESSMENTS ====================
  
  // Submit health assessment
  Future<String> submitAssessment(AssessmentModel assessment) async {
    try {
      DocumentReference docRef = await _firestore
          .collection(FirebaseCollections.assessments)
          .add(assessment.toMap());

      // Update user's assessment status
      await _firestore
          .collection(FirebaseCollections.users)
          .doc(assessment.userId)
          .update({
        'hasCompletedAssessment': true,
        'recommendedProgram': assessment.recommendedProgram,
      });

      return docRef.id;
    } catch (e) {
      throw 'Failed to submit assessment. Please try again.';
    }
  }

  // Get user's assessments
  Future<List<AssessmentModel>> getUserAssessments(String userId) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(FirebaseCollections.assessments)
          .where('userId', isEqualTo: userId)
          .orderBy('submittedAt', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => AssessmentModel.fromMap({
                ...doc.data() as Map<String, dynamic>,
                'id': doc.id,
              }))
          .toList();
    } catch (e) {
      throw 'Failed to load assessments.';
    }
  }

  // Get latest assessment
  Future<AssessmentModel?> getLatestAssessment(String userId) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(FirebaseCollections.assessments)
          .where('userId', isEqualTo: userId)
          .orderBy('submittedAt', descending: true)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        return AssessmentModel.fromMap({
          ...snapshot.docs.first.data() as Map<String, dynamic>,
          'id': snapshot.docs.first.id,
        });
      }
    } catch (e) {
      throw 'Failed to load assessment.';
    }
    return null;
  }

  // ==================== PROGRAMS ====================
  
  // Get all programs
  Future<List<Map<String, dynamic>>> getAllPrograms() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(FirebaseCollections.programs)
          .get();

      return snapshot.docs
          .map((doc) => {
                'id': doc.id,
                ...doc.data() as Map<String, dynamic>,
              })
          .toList();
    } catch (e) {
      throw 'Failed to load programs.';
    }
  }

  // Get program by ID
  Future<Map<String, dynamic>?> getProgramById(String programId) async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection(FirebaseCollections.programs)
          .doc(programId)
          .get();

      if (doc.exists) {
        return {
          'id': doc.id,
          ...doc.data() as Map<String, dynamic>,
        };
      }
    } catch (e) {
      throw 'Failed to load program.';
    }
    return null;
  }

  // ==================== ENROLLMENTS ====================
  
  // Enroll user in program
  Future<void> enrollInProgram({
    required String userId,
    required String programId,
  }) async {
    try {
      await _firestore
          .collection(FirebaseCollections.enrollments)
          .add({
        'userId': userId,
        'programId': programId,
        'enrolledAt': DateTime.now().toIso8601String(),
        'status': 'active',
        'progress': 0,
      });

      // Update user's current program
      await _firestore
          .collection(FirebaseCollections.users)
          .doc(userId)
          .update({
        'currentProgram': programId,
      });
    } catch (e) {
      throw 'Failed to enroll in program.';
    }
  }

  // Get user's enrollments
  Future<List<Map<String, dynamic>>> getUserEnrollments(String userId) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(FirebaseCollections.enrollments)
          .where('userId', isEqualTo: userId)
          .orderBy('enrolledAt', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => {
                'id': doc.id,
                ...doc.data() as Map<String, dynamic>,
              })
          .toList();
    } catch (e) {
      throw 'Failed to load enrollments.';
    }
  }

  // ==================== PROGRESS TRACKING ====================
  
  // Log progress entry
  Future<void> logProgress({
    required String userId,
    required String enrollmentId,
    required double weight,
    String? notes,
  }) async {
    try {
      await _firestore
          .collection(FirebaseCollections.progress)
          .add({
        'userId': userId,
        'enrollmentId': enrollmentId,
        'weight': weight,
        'notes': notes,
        'loggedAt': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw 'Failed to log progress.';
    }
  }

  // Get user's progress history
  Future<List<Map<String, dynamic>>> getUserProgress(String userId) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(FirebaseCollections.progress)
          .where('userId', isEqualTo: userId)
          .orderBy('loggedAt', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => {
                'id': doc.id,
                ...doc.data() as Map<String, dynamic>,
              })
          .toList();
    } catch (e) {
      throw 'Failed to load progress history.';
    }
  }
}