import 'package:fitpulse/src/data/repositories/database_repository.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/models/user_model.dart';
import '../blocs/database_bloc/database_bloc.dart';
import '../widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const.dart';
import '../widgets/text_formfield_fit_pulse.dart';
// import '../widgets/text_formfield_fit_pulse.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({super.key});

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var genderController = TextEditingController();
  var weightController = TextEditingController();
  var heightController = TextEditingController();
  var userModel = UserModel(email: 'email', userId: 'userId');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.arrow_back_rounded, color: Colors.black)),
        backgroundColor: Colors.transparent,
        title: Text(
          'Complete Profile',
          style: textStyle.copyWith(fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4, color: const Color(0xffeceff5)),
                        shape: BoxShape.circle,
                        color: const Color(0xffF7F7F7)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: BlocBuilder<DatabaseBloc, DatabaseState>(
                        builder: (context, state) {
                          if (state is DatabaseCurrentUserState &&
                              state.user.profilePic != '') {
                            return Image.network(
                              state.user.profilePic!,
                              fit: BoxFit.cover,
                            );
                          } else {
                            return const Icon(
                              Icons.person,
                              size: 90,
                              color: Colors.black,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 3,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 3, color: const Color(0xffeceff5)),
                          shape: BoxShape.circle,
                          color: const Color(0xffF7F7F7)),
                      child: GestureDetector(
                        onTap: () {
                          _onImageButtonPressed(ImageSource.gallery,
                              context: context);
                        },
                        child: const Icon(Icons.edit,
                            size: 20, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 37,
              ),
              BlocConsumer<DatabaseBloc, DatabaseState>(
                listener: (context, state) {
                  if (state is DatabaseCurrentUserState) {
                    userModel = state.user;
                    nameController.text = state.user.name ?? '';
                  }
                },
                builder: (context, state) {
                  return TextFormFieldPulse(
                    hintText: 'Name',
                    icon: const Icon(Icons.person),
                    textFieldController: nameController,
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              BlocConsumer<DatabaseBloc, DatabaseState>(
                listener: (context, state) {
                  if (state is DatabaseCurrentUserState) {
                    ageController.text = '${state.user.height ?? ''}';
                  }
                },
                builder: (context, state) {
                  return TextFormFieldPulse(
                    textFieldController: ageController,
                    hintText: 'Age',
                    icon: SvgPicture.asset(
                      'assets/svg/age.svg',
                      colorFilter: const ColorFilter.mode(
                          Color(0xffADB6C1), BlendMode.srcIn),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              BlocConsumer<DatabaseBloc, DatabaseState>(
                listener: (context, state) {
                  if (state is DatabaseCurrentUserState) {
                    genderController.text = state.user.gender ?? '';
                  }
                },
                builder: (context, state) {
                  return TextFormFieldPulse(
                    textFieldController: genderController,
                    hintText: 'Gender',
                    icon: SvgPicture.asset('assets/svg/gender.svg',
                        colorFilter: const ColorFilter.mode(
                            Color(0xffADB6C1), BlendMode.srcIn)),
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              BlocConsumer<DatabaseBloc, DatabaseState>(
                listener: (context, state) {
                  if (state is DatabaseCurrentUserState) {
                    weightController.text = '${state.user.weight ?? ''}';
                  }
                },
                builder: (context, state) {
                  return TextFormFieldPulse(
                      textFieldController: weightController,
                      hintText: 'Weight',
                      icon: const Icon(Icons.monitor_weight));
                },
              ),
              const SizedBox(
                height: 15,
              ),
              BlocConsumer<DatabaseBloc, DatabaseState>(
                listener: (context, state) {
                  if (state is DatabaseCurrentUserState) {
                    heightController.text = '${state.user.height ?? ''}';
                  }
                },
                builder: (context, state) {
                  return TextFormFieldPulse(
                    textFieldController: heightController,
                    hintText: 'Height',
                    icon: SvgPicture.asset('assets/svg/height.svg',
                        colorFilter: const ColorFilter.mode(
                            Color(0xffADB6C1), BlendMode.srcIn)),
                  );
                },
              ),
              const SizedBox(
                height: 37,
              ),
              BlocBuilder<DatabaseBloc, DatabaseState>(
                builder: (context, state) {
                  if (state is DatabaseLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return FitPulseButton(
                        onTap: () async {
                          userModel.name = nameController.text;
                          userModel.age = int.parse(ageController.text);
                          userModel.gender = genderController.text;
                          userModel.weight = int.parse(weightController.text);
                          userModel.height = int.parse(heightController.text);
                          context.read<DatabaseBloc>().add(
                              DispatchUpdateUserProfileEvent(
                                  userModel: userModel));
                        },
                        text: 'Save',
                        fontSize: 16,
                        height: 55,
                        showArrow: false,
                        hMargin: 0);
                  }
                },
              ),
              const SizedBox(height: 2),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onImageButtonPressed(ImageSource source,
      {required BuildContext context}) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: source,
      );

      _setImageFileListFromFile(pickedFile);
    } catch (e) {
      // setState(() {
      //   _pickImageError = e;
      // });
    }
  }

  List<XFile>? _imageFileList;

  void _setImageFileListFromFile(XFile? value) {
    _imageFileList = value == null ? null : <XFile>[value];
    if (_imageFileList != null) {
      print(_imageFileList!.first.path);
      DatabaseRepository()
          .uploadProfilePic(_imageFileList!.first.path, userModel);
    }
  }
}
