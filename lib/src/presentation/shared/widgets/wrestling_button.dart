import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wrestling_hub/core/constants/app_colors.dart';
import 'package:wrestling_hub/core/constants/app_text_styles.dart';
import 'package:wrestling_hub/src/presentation/shared/cubits/button_cubit.dart';
import 'package:wrestling_hub/src/presentation/shared/cubits/button_state.dart';
import 'package:wrestling_hub/src/presentation/shared/widgets/wrestling_progress_bar.dart';

class AppButton extends StatelessWidget {

  final String title;
  final VoidCallback onPressed;
  final double? height;
  final double? width;

  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height,
    this.width,
  });



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonCubit,ButtonState>(
      bloc: context.read<ButtonCubit>(),
      builder: (context, state) {
        if (state is ButtonLoadingState){
          return _loading(context);
        }
        return _initial(context);
      },
    );
  }


  Widget _loading(BuildContext context) {
    return ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          minimumSize: Size(
              width ?? MediaQuery.of(context).size.width,
              height ?? 45
          ),
        ),
        child: const WrestlingProgressBar()
    );
  }


  Widget _initial(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          minimumSize: Size(
              width ?? MediaQuery.of(context).size.width,
              height ?? 45
          ),
        ),
        child: Text(title, style: AppTextStyles.buttonDarkStyle)
    );
  }




}