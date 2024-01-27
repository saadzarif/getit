// import 'package:flutter/material.dart';
// import 'package:jackedgirl/core/models/user_model.dart';
// import 'package:jackedgirl/core/models/workout_plan.dart';
// import 'package:jackedgirl/core/providers/plans_provider.dart';
// import 'package:provider/provider.dart';

// setData(
//   BuildContext context,
//   List<WorkoutPlan> allUserSelectedPlans,
//   UserModel user,
//   List<WorkoutDay> workouts,
//   List<UserExerciseData> exercisesData,
//   List<UserPlan> userPlans,
// ) {
//   List days = [];
//   List<WorkoutPlan> allPlans = Provider.of<PlansProvider>(context).plans ?? [];
//   allUserSelectedPlans = allPlans.where((plan) {
//     return user.selectedPlans.any((userPlan) {
//       days = userPlan.selectedDays;
//       return userPlan.planTitle == plan.planTitle;
//     });
//   }).map((plan) {
//     for (int index = 0; index < plan.plan.length; index++) {
//       if (index < days.length) {
//         plan.plan[index].day = days[index];
//       }
//     }
//     return plan;
//   }).toList();
//   workouts.clear();
//   for (var plan in allUserSelectedPlans) {
//     userPlans.add(user.selectedPlans
//         .firstWhere((element) => element.planTitle == plan.planTitle));
//     for (WorkoutDay workoutDay in plan.plan) {
//       workouts.add(workoutDay);
//       for (Exercise exercise in workoutDay.exercises) {
//         UserExerciseData userExercise = user.userExerciseData!.firstWhere(
//           (exerciseData) => exerciseData.exerciseId == exercise.exerciseId,
//         );
//         exercisesData.add(userExercise);
//       }
//     }
//   }
// }
