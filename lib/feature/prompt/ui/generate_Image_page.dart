import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visionary/feature/prompt/bloc/prompt_bloc.dart';

class GenerateImagePage extends StatefulWidget {
  GenerateImagePage({super.key});

  @override
  State<GenerateImagePage> createState() => _GenerateImagePageState();
}

class _GenerateImagePageState extends State<GenerateImagePage> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    context.read<PromptBloc>().add(PromptInitialEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'VISONARY',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        child: BlocConsumer<PromptBloc, PromptState>(
          listener: (context, state) {
            // TODO: implement listener
          },

          builder: (context, state) {
            if (state is PromptGeneratingImageLoadState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PromptGeneratingImageErrorState) {
              return Center(child: Text('An Error Occurred'));
            } else if (state is PromptGeneratingImageSuccessState) {
              final successState = state as PromptGeneratingImageSuccessState;
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: MemoryImage(successState.byte),
                          fit: BoxFit.fill,
                        ),
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 240,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                            controller: controller,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.white70),
                              hintText: 'Generate an Image 🚀',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.purple),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: SizedBox(
                            width: double.maxFinite,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                              ),
                              onPressed: () {
                                if (controller.text.isNotEmpty) {
                                  context.read<PromptBloc>().add(
                                    PromptEnteredEvent(controller.text),
                                  );
                                  print(controller.text);
                                }
                              },
                              child: Text(
                                'Generate',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox(child: Text('Default'));
            }
          },
        ),
      ),
    );
  }
}
