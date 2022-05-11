import 'package:objd/core.dart';

import './weapon.dart';
import './ability.dart';

Map WeaponList = {
    // "firestorm_gunfire": {
    //     "item_name": "firestorm_gunfire",
    //     "name": "Firestorm Gunfire",
    //     "name_color": "#bd1c00",
    //     "ability_name": "X-Mark from Hell",
    //     "ability": Firestorm(),
    //     "score": "firestorm",
    //     "mana_cost": 15,
    //     "model_no": 1,
    // },
    "daze": {
        "score": "daze",
        "name": "Daze",
        "name_color": "#bd1c00",
        "description": "Stun an enermy.",
        "ability": Daze(),
        "mana_cost": 15,
        "model_no": 1,
    },
    "sprint": {
        "score": "sprint",
        "name": "Sprint",
        "name_color": "#bd1c00",
        "description": "Run.",
        "ability": Sprint(),
        "mana_cost": 5,
        "model_no": 2,
    },
    "litthesword": {
        "score": "litthesword",
        "name": "Lit The Sword",
        "name_color": "#bd1c00",
        "description": "Run.",
        "ability": LitTheSword(),
        "mana_cost": 70,
        "model_no": 3,
    },
};