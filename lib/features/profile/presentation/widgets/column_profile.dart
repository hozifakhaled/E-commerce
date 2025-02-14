import 'package:ecommercefirebase/features/profile/domain/entities/profile_entitiey.dart';
import 'package:ecommercefirebase/features/profile/presentation/widgets/image_profile_in_profile.dart';
import 'package:ecommercefirebase/features/profile/presentation/widgets/profile_row.dart';
import 'package:flutter/material.dart';

class ColumnProfile extends StatelessWidget {
  const ColumnProfile({
    super.key, required this.profileEntitiey,
  });
final ProfileEntitiey profileEntitiey ;
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            ImageProfileInProfile(profileEntitiey: profileEntitiey,),
            const SizedBox(height: 30),
            ProfileRow(
              title: 'Name',
              value:profileEntitiey.name,
            ),
            const SizedBox(height: 25),
            ProfileRow(
              title: 'Phone',
              value: profileEntitiey.phone,
            ),
            const SizedBox(height: 25),
            ProfileRow(
              title: 'Email',
              value: profileEntitiey.email,
            ),
            const SizedBox(height: 25),
            ProfileRow(
              title: 'Age',
              value: '${profileEntitiey.age} years old',
            ),
          ],
        );
      
   
  }
}
