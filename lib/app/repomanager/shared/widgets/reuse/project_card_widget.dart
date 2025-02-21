import 'package:flutter/material.dart';
import 'package:repomanager/app/repomanager/domain/entities/project_entity.dart';
import 'package:repomanager/app/repomanager/shared/extension/buildcontext_extension.dart';
import 'package:repomanager/app/repomanager/shared/widgets/reuse/icon_text_widget.dart';

class ProjectCardWidget extends StatelessWidget {
  ProjectEntity project;

  ProjectCardWidget({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            border: Border.all(
                color: theme.colorScheme.primary, width: 2),
            color: theme.cardColor,
          ),
          width: double.infinity,
          height: 80,
          padding: const EdgeInsets.only(left: 20, top: 30),
          child: Row(
            children: [
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Branch: ",
                          style: theme.textTheme.bodySmall
                              ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme
                                  .onPrimaryContainer),
                        ),
                        TextSpan(
                          text: "main",
                          style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onPrimaryContainer),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20,),
                  IconText(
                    icon: Icons.add_box,
                    color: Colors.green,
                    text: project.fileModificationStatus.onStagedAddedFiles.toString(),
                  ),
                  IconText(
                    icon: Icons.edit,
                    color: Colors.green,
                    text: project.fileModificationStatus.onStagedModifiedFiles.toString(),
                  ),
                  IconText(
                    icon: Icons.delete_forever_rounded,
                    color: Colors.green,
                    text: project.fileModificationStatus.onStagedDeletedFiles.toString(),
                  ),
                  const SizedBox(width: 20,),
                  IconText(
                    icon: Icons.edit,
                    color: Colors.deepOrangeAccent,
                    text: project.fileModificationStatus.notStagedModifiedFiles.toString(),
                  ),
                  IconText(
                    icon: Icons.delete_forever_rounded,
                    color: Colors.deepOrangeAccent,
                    text: project.fileModificationStatus.notStagedDeletedFiles.toString(),
                  ),
                  const SizedBox(width: 20,),
                  IconText(
                    icon: Icons.question_mark_outlined,
                    color: Colors.red,
                    text: project.fileModificationStatus.notStagedUntrackedFiles.toString(),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            border: Border.all(
                color: theme.colorScheme.primary, width: 2),
            color: theme.colorScheme.primaryContainer,
          ),
          width: double.infinity,
          height: 40,
          padding: const EdgeInsets.only(left: 20, top: 5),
          child: RichText(text: TextSpan(children: [
            TextSpan(
              text: project.name,
              style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimaryContainer),
            ),
            TextSpan(
              text: " - ",
              style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimaryContainer),
            ),
            TextSpan(
              text: project.description,
              style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimaryContainer),
            ),
          ],),)
        ),
      ],
    );
  }
}