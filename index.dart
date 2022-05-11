import 'package:objd/core.dart';
import './main.dart';
import './load.dart';
import './module/weapon.dart';
import './module/ability.dart';
import './module/weaponability.dart';

void main(List<String> args){
	createProject(
		Project(
			name:"Kit Battle 1.18.2",
			target:"../", // path for where to generate the project
            version: 18,
			generate: CustomWidget() // The starting point of generation
		),
		args
	);
}

class CustomWidget extends Widget {
    @override
    Widget generate(Context context){
        return Pack(
            name:"kit",
            main: File( // optional
                'main',
                child: MainFile()
            ),
            load: File(
                'load',
                child: LoadFile()
            ),
            files: [
                File("weapon",child: AllWeapon())
            ],        
            modules: [
                castAbility(WeaponList["daze"]),
                castAbility(WeaponList["sprint"]),
                castAbility(WeaponList["litthesword"]),
            ]
        );
    }
}