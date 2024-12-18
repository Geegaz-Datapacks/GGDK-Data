# GGDK (Geegaz's Drinks)

**Since the datapack and resource pack have been moved in a single repository thanks to [Beet](https://github.com/mcbeet/beet), this repository has been archived.
Next updates will take place at https://github.com/Geegaz-Datapacks/GGDK**

![GGDK banner image](/img/banner.png)
A food datapack for minecraft 1.17+ that adds 8 new drinks with various effects and an alcohol mechanics</br>
*this datapack requires a resourcepack to work*

[![Github Banner](https://raw.githubusercontent.com/Geegaz-Datapacks/Geegaz-Datapacks.github.io/main/img/github_banner_small.png)](https://github.com/Geegaz-Datapacks/GGDK-Data)
[![Discord Banner](https://raw.githubusercontent.com/Geegaz-Datapacks/Geegaz-Datapacks.github.io/main/img/discord_banner_small.png)](https://discord.gg/6g39K8sCB9)

## Recipes
![GGDK recipes](/img/recipes_image.jpg)

## Technical Information

<details>
    <summary style="font-size:12pt;font-weight:bold">Alcohol values</summary>

- Strong drinks (Vodka, Tequila, Whiskey): 250
- Wine: 100
- Beer: 60
- Cider: 30
- Soft drinks (Tea, Chocolate): 0
</details>

<details>
    <summary style="font-size:12pt;font-weight:bold">Drink effects</summary>

- Strong drinks (Vodka, Tequila, Whiskey): Resistance II *(2min)* + Strength II *(2min)*
- Wine: Instant Health II
- Beer: Luck II *(3min)*
- Cider: Absorption II *(3min)*
- Soft drinks (Tea, Chocolate): Regeneration I *(30s)*

</details>

<details>
    <summary style="font-size:12pt;font-weight:bold">How to add your own drinks</summary>

Adding new drinks is extremely easy, using the `generate_drinks.py` script:
1. First create the texture and model in the resourcepack (don't hesitate to copy one of the existing item models if you're not sure how to do it). How you structure the resourcepack is all up to you, but you should add your CMD overrides in `minecraft/models/item/potion.json`.
2. Add the item to the lang files by adding a new line `"ggdk.item.<item id>": "<item name>"`
3. Create the item's recipe in the datapack at `data/ggdk/recipes/<item id>.json`. This recipe should give a knowledge book as an output to work properly.
4. Then create a new entry in the file `drinks.json` located at the root of the datapack. Look how each item is implemented:
   - **\<item id\>** is the id of your item,
   - **alcohol_value** is the number of seconds necessary to sober up after drinking an alcoholic drink. Keep in mind this value stacks !
   - **custom_model_data** is the CMD of this drink, which you created earlier (see step 1)
   - **effects** is a list of effects the drink will give when drank. The **name**, **seconds** and **amplifier** values are the same as the parameters of the `/effect` command.
```json
"<item id>": {
    "alcohol_value": (int),
    "custom_model_data": (int),
    "effects": [
        {"name":"<effect id>","seconds":(int),"amplifier":(int)}
    ]
}
```
5. Finally, run `generate_drinks.py` either by double-clicking the script or in command line using `python generate_drinks.py`. This requires you to have python installed though, you can find an installer at https://www.python.org/downloads/
6. **If you followed these steps properly, your new drink should now be working ingame !**

*For more info about CustomModelData, check out [this forum post](https://www.planetminecraft.com/forums/communities/texturing/new-1-14-custom-item-models-tuto-578834/).*
</details>
