import 'package:objd/core.dart';
import './weaponability.dart';

Item createWeapon(Map Weapon){
    String item_name = Weapon["name"];
    String color_name = Weapon["name_color"];
    String ability_name = Weapon["description"];
    int mana_cost = Weapon["mana_cost"];
    int model_no = Weapon["model_no"];
    return Item(
        Items.carrot_on_a_stick,
        name: TextComponent(item_name,italic: false,bold: true,color: Color(color_name)),
        lore: [
            // TextComponent("Ability:",color: Color.Yellow,italic: false),
            TextComponent(ability_name,color: Color.White,italic: false),
            TextComponent("",color: Color.White,italic: false),
            TextComponent("Mana:",color: Color("#00a2ff"),italic: false),
            TextComponent("${mana_cost}",color: Color.White,italic: false)
        ],
        model: model_no
    );
}

class AllWeapon extends Widget {
    @override
    Widget generate(Context context) {
        return For.of([
            Give(Entity.Player(),item: createWeapon(WeaponList["daze"])),
            Give(Entity.Player(),item: createWeapon(WeaponList["sprint"])),
            Give(Entity.Player(),item: createWeapon(WeaponList["litthesword"]))
        ]);
    }
}

