import os
from pathlib import Path, PurePath
import json
from typing import Dict

#----------- Declare functions -----------#
def generate_drinks(drinks: Dict) -> None:
    generated_drinks = 0
    for id, data in drinks.items():
        # Create the new advancements, loot tables and functions
        print(f"Generating {id}...")

        new_loot_table = {
            "pools": [
                {
                    "rolls": 1,
                    "entries": [
                        {
                            "type": "minecraft:item",
                            "name": "minecraft:potion",
                            "functions": [
                                {
                                    "function": "minecraft:set_name",
                                    "name": {
                                        "translate": f"ggdk.item.{id}",
                                        "italic": False
                                    }
                                },
                                {
                                    "function": "minecraft:set_nbt",
                                    "tag": f"{{ctc:{{id:\"{id}\",from:\"geegaz:ggdk\"}},CustomModelData:{data['custom_model_data']}}}"
                                },
                                {
                                    "function": "minecraft:set_nbt",
                                    "tag": f"{{ggdk:{{id:\"{id}\"}}}}"
                                }
                            ]
                        }
                    ]
                }
            ]
        }
        new_craft_advancement = {
            "criteria": {
                "crafted": {
                    "trigger": "minecraft:recipe_unlocked",
                    "conditions": {
                        "recipe": f"ggdk:{id}"
                    }
                }
            },
            "rewards": {
                "function": f"ggdk:craft/{id}",
                "loot": [
                    f"ggdk:items/{id}"
                ]
            }
        }
        new_craft_function = [
            "clear @s knowledge_book 1",
            f"recipe take @s ggdk:{id}",
            f"advancement revoke @s only ggdk:craft/{id}\n"
        ]
        new_drink_advancement = {
            "criteria": {
                "drink": {
                    "trigger": "minecraft:consume_item",
                    "conditions": {
                        "item": {
                            "nbt": f"{{ggdk:{{id:\"{id}\"}}}}"
                        }
                    }
                }
            },
            "rewards": {
                "function": f"ggdk:item/{id}"
            }
        }
        new_drink_function = [
            f"execute if score $ggdk.do_drunkness ggdk.CONST matches 1.. run scoreboard players add @s ggdk.var {data['alcohol_value']}",
            f"advancement revoke @s only ggdk:drink/{id}\n"
        ]
        for effect in data.get("effects", []):
            new_drink_function.append(
                f"execute if score $ggdk.do_effects ggdk.CONST matches 1.. run effect give @s {effect['name']} {effect['seconds']} {effect['amplifier']}")

        # Export everything
        exports = {
            f"data/ggdk/loot_tables/items/{id}.json": json.dumps(new_loot_table, indent=4),
            f"data/ggdk/advancements/craft/{id}.json": json.dumps(new_craft_advancement, indent=4),
            f"data/ggdk/functions/craft/{id}.mcfunction": "\n".join(new_craft_function),
            f"data/ggdk/advancements/drink/{id}.json": json.dumps(new_drink_advancement, indent=4),
            f"data/ggdk/functions/item/{id}.mcfunction": "\n".join(new_drink_function)
        }
        for path, export_data in exports.items():
            Path(path).write_text(export_data)

        # Increase the counter of drinks generated successfuly
        generated_drinks += 1

    print(f"Generated {generated_drinks} drinks successfully !")

#----------- Run Script -----------#

filename = "drinks.json"
drinks: Dict

try:
    drinks = json.loads(Path(filename).read_text())
except Exception as e:
    print(f"Error loading {filename}:")
    print(e.message)

try:
    generate_drinks(drinks)
except Exception as e:
    print(f"Error generating drinks:")
    print(e.message)