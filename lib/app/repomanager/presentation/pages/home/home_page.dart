import 'package:flutter/material.dart';
import 'package:repomanager/app/repomanager/shared/extension/buildcontext_extension.dart';
import 'package:repomanager/app/repomanager/shared/widgets/form/default_button_widget.dart';
import 'package:repomanager/app/repomanager/shared/widgets/form/select_input_widget.dart';
import 'package:repomanager/app/repomanager/shared/widgets/reuse/icon_text_widget.dart';
import 'package:repomanager/app/repomanager/shared/widgets/structure/header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Scaffold(
      body: Column(
        children: [
          const HeaderWidget(),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SelectInputWidget(),
                    const SizedBox(
                      width: 10,
                    ),
                    DefaultButtonWidget(
                      text: 'Add Workspace',
                      onClicked: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Projects",
                          style: theme.textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        DefaultButtonWidget(
                          text: 'Add Project',
                          onClicked: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Stack(
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
                                            style: theme.textTheme.bodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 20,),
                                    IconText(
                                      icon: Icons.add_box,
                                      color: Colors.green,
                                      text: "2",
                                    ),
                                    IconText(
                                      icon: Icons.edit,
                                      color: Colors.green,
                                      text: "2",
                                    ),
                                    IconText(
                                      icon: Icons.delete_forever_rounded,
                                      color: Colors.green,
                                      text: "2",
                                    ),
                                    const SizedBox(width: 20,),
                                    IconText(
                                      icon: Icons.edit,
                                      color: Colors.deepOrangeAccent,
                                      text: "2",
                                    ),
                                    IconText(
                                      icon: Icons.delete_forever_rounded,
                                      color: Colors.deepOrangeAccent,
                                      text: "2",
                                    ),
                                    const SizedBox(width: 20,),
                                    IconText(
                                      icon: Icons.question_mark_outlined,
                                      color: Colors.red,
                                      text: "2",
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
                          child: Text(
                            "Project 1",
                            style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.onPrimaryContainer),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
