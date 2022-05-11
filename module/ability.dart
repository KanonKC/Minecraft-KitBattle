import 'package:objd/core.dart';

List<SetBlock> createPattern(List<List<int>> pattern){
    double mr = (pattern.length-1)/2,mc = (pattern[0].length-1)/2;
    List<SetBlock> result = [];
    for(int i=0;i<pattern.length;i++){
        for(int j=0;j<pattern[0].length;j++){
            if(pattern[i][j] == 1){
                result.add(SetBlock(Blocks.fire,location: Location.rel(x: -mr+i,y: -mc+j)));
            }
        }
    }
    return result;
}

ClickEvent castAbility(Map Weapon){
    int req_mana = Weapon["mana_cost"];
    String name = Weapon["score"];
    int model_no = Weapon["model_no"];
    Score currentMana = Score(Entity.Selected(),"mana");
    return ClickEvent(
        onClick: If(
        Condition(currentMana.isBiggerOrEqual(Score.con(req_mana))),
            then: [
                Weapon["ability"],
                currentMana.subtractScore(Score.con(req_mana))
            ],
            orElse: [
                Tellraw(Entity.Selected(), show: [TextComponent("Not enough mana!",color: Color.Red)]),
                Score(Entity.Selected(),"objd_count").set(0)
            ]
        ),
        name: name,
        selectedItem: Item(Items.carrot_on_a_stick,model: model_no)
    );
}

Entity CloestPlayer(double castRange){
    return Entity.Player(distance: Range(0.001, castRange));
}

Entity CloestEntity(double castRange){
    return Entity(distance: Range(0.001, castRange),limit: 1).sort(Sort.nearest);
}

class Daze extends Widget {

    double cast_range = 4;

    @override
    generate(Context context) {
        return For.of([
            
            Execute.at(
                CloestEntity(cast_range),
                children: [
                    Effect(
                        EffectType.slowness,
                        duration: 3,
                        amplifier: 50,
                        entity: Entity(limit: 1).sort(Sort.nearest)
                    ),
                    Effect(
                        EffectType.nausea,
                        duration: 3,
                        amplifier: 50,
                        entity: Entity(limit: 1).sort(Sort.nearest)
                    ),
                    Effect(
                        EffectType.mining_fatigue,
                        duration: 3,
                        amplifier: 50,
                        entity: Entity(limit: 1).sort(Sort.nearest)
                    ),
                    Particle(
                        Particles.crit,
                        location: Location.rel(y: 1.7),
                        delta: Location.glob(x: 0.1,y: 0.1,z: 0.1),
                        speed: 1,
                        count: 50
                    )
                ]
            )
        ]);
    }
}

class Sprint extends Widget {

    int speed_duration = 5;

    @override
    generate(Context context) {
        return For.of([
            Effect(
                EffectType.speed,
                duration: speed_duration,
                amplifier: 1,
                entity: Entity.Player()
            ),
            Repeat("sprint_particle",
                to:  speed_duration*10,
                child:  Execute.at(Entity.Player(), children: [
                    Particle(
                    Particles.soul_fire_flame,
                    count: 10,
                    speed: 0,
                    location: Location.here(),
                    delta: Location.glob(x: 0.1,y: 1,z: 0.1)
                )
                ]),
                ticks:  2
            )
        ]);
    }
}

class LitTheSword extends Widget{
    @override
    generate(Context context) {
        // return Function()
        return RawFile(
            "sword_of_flame.mcfunction",
            'give @p iron_sword{display:{Name:\'{"text":"Sword of Flame","color":"#FF8800","bold":true,"italic":false}\'},Damage:245,Enchantments:[{id:"minecraft:sharpness",lvl:4s},{id:"minecraft:fire_aspect",lvl:2s}]} 1',
            path: "functions/"
        );
    }
}