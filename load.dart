import 'package:objd/core.dart';

class LoadFile extends Widget {
    LoadFile();

    // Score x = Score()
    int MAX_MANA = 100;

    @override
    generate(Context context) {
        // var PlayerMana = Scoreboard("mana");
        return For.of([
            Scoreboard(
                "mana",
                display: TextComponent("Mana",color: Color("#0095ff"))
            ),
            Score(Entity.All(), "mana").set(MAX_MANA),
            For(
                from: 0,
                to: 100,
                create: (i) => Score.con(i)
            ),
            Score(Entity.All(), "firestorm_cost").set(15),
            Score(Entity.All(), "mana_max").set(MAX_MANA),
            Timer(
                "mana_regen",
                children: [
                    Score(
                        Entity.All(scores: [Score(Entity.All(),"mana").matchesRange(Range.to(MAX_MANA-1))]
                        ),"mana"
                    ).add(1),
                    Execute.at(Entity(type: Entities.armor_stand,tags: ["mana-totem"]), children: [
                        Score(Entity.All(scores: [Score(Entity.All(),"mana").matchesRange(Range.to(MAX_MANA-1))],distance: Range.to(5)),"mana").add(1)
                    ]
                )],
                ticks: 7
            )
        ]);
    }
}