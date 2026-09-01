# Attribution

## RimScent

par **reo / ocarina0001** — MIT.
[Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3645569466)

Mod compagnon, pas un fork. Aucun fichier de RimScent n'est copié ni redistribué. Il est
déclaré en dépendance dure et on utilise `RimScentReworked.ModExtension_Scent`, son propre
point d'extension public, sur des `WeatherDef` et des `GameConditionDef` — deux des types
qu'il accepte et que personne n'utilisait au-delà de six defs.

**Six de ses `ThoughtDef` sont réutilisées par leur `defName`**, jamais recopiées :
`RimScent_PetrichorScent`, `RimScent_BloodScent`, `RimScent_GrayFleshScent`,
`RimScent_ToxicScent`, `RimScent_AshScent`. Là où il avait déjà écrit l'odeur qui convient,
on la cite plutôt que d'en ajouter une de plus.

## Mods lus par cette extension

Rien n'en est copié. Visé uniquement par des `PatchOperation`, dans un dossier qui ne se
charge que si le mod est actif :

- **Vanilla Events Expanded** (`vanillaexpanded.vee`)

Les patchs météo, terrain et forêt ne visent aucun mod : ils ciblent le jeu de base et ses
quatre DLC, plus le marqueur `plant/treeCategory` qui attrape les arbres de n'importe quel
mod sans le nommer ni le lire.

## Ce mod

MIT, © nelim. Defs, patchs, seuils et traductions sont un travail original.
