import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

bottmSheet(BuildContext context) {
  final prfilecubit = context.read<ProfileCubit>();
  showModalBottomSheet(
    context: context,
    backgroundColor: maincolor2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return BlocProvider(
        create: (context) => ProfileCubit(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "choose image",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Builder(
                builder: (context) {
                  return ListTile(
                    leading: Icon(Icons.camera_alt, color: maincolor),
                    title: Text("Camera"),
                    onTap: () {
                      
                      context.read<ProfileCubit>().addimage(ImageSource.camera);
                    },
                  );
                }
              ),
              Builder(
                builder: (context) {
                  return ListTile(
                    leading: Icon(Icons.image, color: maincolor),
                    title: Text("Gallery"),
                    onTap: () {
                   
                      context.read<ProfileCubit>().addimage(ImageSource.gallery);
                  
                    },
                  );
                }
              ),
            ],
          ),
        ),
      );
    },
  );
}
