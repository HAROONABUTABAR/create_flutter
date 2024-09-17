import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print("Please provide a project path");
    return;
  }

  final path = arguments.first;

  final result =
      Process.runSync("flutter", ["create", path, ...arguments.skip(1)]);
  if (result.exitCode != 0) {
    print("Error creating project: ${result.stderr}");
    return;
  }

  final projectPath = "${Directory.current.path}/lib";

  final directories = [
    "$projectPath/core",
    "$projectPath/core/constants",
    "$projectPath/core/helpers",
    "$projectPath/core/networking",
    "$projectPath/core/theming",
    "$projectPath/core/utils",
    "$projectPath/core/widgets",
    "$projectPath/features",
    "$projectPath/features/login",
    "$projectPath/features/login/data",
    "$projectPath/features/login/data/models",
    "$projectPath/features/login/data/repos",
    "$projectPath/features/login/logic",
    "$projectPath/features/login/logic/cubit",
    "$projectPath/features/login/ui",
    "$projectPath/features/login/ui/widgets",
  ];

  for (final directory in directories) {
    final dir = Directory(directory);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
      print("Directory created: $directory");
    } else {
      print("Directory already exists: $directory");
    }
  }

  print("Project created successfully!");
}
