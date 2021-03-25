# Use Maven with Haxe/JVM

### Overview

1. Install Maven
1. Edit `pom.xml` include the required dependencies
1. Run `haxe --run Maven` which will update `maven.hxml` to contain a list of `--java-lib` pointing to the path of the `.jar` dependencies.
1. Reference the required types in Haxe code
1. Compile Haxe code and run the resulting jar as usual: `haxe build.hxml && java -jar bin/Main.jar`

### How it works

The `Maven.hx` script calls `mvn dependency:build-classpath` to obtain the paths of the jar dependencies and write them into `maven.hxml`.

The main `build.hxml` references `maven.hxml` thus Haxe knows where to find the jars for autocompletion and compilation.
