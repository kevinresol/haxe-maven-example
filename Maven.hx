import haxe.macro.*;
import sys.io.*;
import sys.*;
using StringTools;

class Maven {
	public static function main() {
		final out = 'maven.hxml';
		
		// https://maven.apache.org/plugins/maven-dependency-plugin/build-classpath-mojo.html
		final proc = new Process('mvn', ['dependency:build-classpath', '-Dmdep.outputFile=$out', '-Dmdep.pathSeparator=:']);
		switch proc.exitCode() {
			case 0:
				final content = File.getContent(out).split(':').map(path -> '--java-lib $path').join('\n');
				File.saveContent(out, content);
			case code:
				Sys.println(proc.stdout.readAll().toString());
				Sys.exit(code);
		}
	}
}