# RimScent Extended: Weather Expansion

L'air du dehors, et le sol sur lequel il repose. RimWorld 1.6.

## Le sol — un terrain neuf pour RimScent

RimScent ne lit que le `thingGrid` : des objets posés sur des cases. **Le terrain n'est pas
un objet** — l'eau, la vase, le sable et la glace n'ont pas de `ThingDef` — donc rien de ce
qui fait l'odeur d'un lieu n'était accessible.

Le socle a gagné `ModExtension_TerrainScent` pour ça, et `ScentScan` lit la grille de
terrain sur les mêmes cases qu'il parcourt déjà : un accès indexé, aucun coût de parcours
supplémentaire.

| Terrain | Odeur | Humeur |
|---|---|---|
| eau douce (rivière, lac, crue) | eau fraîche et pierre mouillée | +1 |
| océan | sel, iode, grand large | +2 |
| vase, marécage, boue | eau stagnante, soufrée et douceâtre | −3 |
| source chaude (Odyssey), geyser | vapeur minérale, soufre et fer | +3 |
| eaux toxiques (Odyssey) | **réutilise** `RimScent_ToxicScent` | |
| lave (Odyssey) | **réutilise** `RimScent_AshScent` | |
| sol moussu, sol de forêt-lueur | même odeur que les arbres | +2 |

**La vase ne sent qu'au-dessus de 18 °C.** C'est la température qui fait l'odeur d'un
marécage, pas le marécage. En dessous du seuil, la case ne compte pas du tout — ce qui est
distinct du facteur de température global du socle : celui-là atténue une odeur présente,
celui-ci décide qu'elle n'existe pas.

### Le comptage par case

Le terrain est compté **par case**, contrairement à la météo qui est lue une fois pour toute
la carte. Trois cases d'eau au bord d'un ruisseau ne sentent pas comme un marécage à perte
de vue, et le `stackLimit` de la pensée plafonne le total. Le nombre de cases devient donc
une mesure de « combien il y en a autour de toi », gratuitement.

## La forêt

Tous les arbres, par le marqueur **`plant/treeCategory`** que le jeu utilise déjà pour
distinguer un arbre d'une plante — pas par une liste écrite à la main. Les opérations de
patch s'appliquant au XML brut, avant la résolution de l'héritage, viser `TreeBase` suffit
et couvre tous ses enfants d'un coup, mods compris. Un mod qui déclare son propre parent
d'arbres est attrapé par le même xpath sans être nommé.

**Six arbres sont exclus nommément**, parce qu'ils déclarent chacun leur propre
`treeCategory` au lieu d'hériter de `TreeBase`, et qu'aucun ne sent la forêt : l'anima et le
gauranlen ont une présence à eux, le polux et l'archéen sont des artefacts, le harbinger
d'Anomaly est une horreur, et le bonsaï est un objet de décoration d'intérieur.

## Météo et conditions

RimScent couvre déjà six defs : `Rain`, `Fog`, `RainyThunderstorm` et `FoggyRain` pour le
pétrichor, `ToxicFallout` et `VolcanicWinter`. Rien ici ne les redouble.

| Cible | Odeur |
|---|---|
| orage sec, tempête d'éclairs | ozone, +1 |
| neige, blizzard, vague de froid, gel profond | air froid et pur, +1 |
| canicule, chaleur anormale, évents de chaleur | air suffocant, −2 |
| sécheresse (Odyssey) | air desséché, −2 |
| spores bioluminescentes (Odyssey) | spores, −1 |
| pluie torrentielle (Odyssey) | **réutilise** `RimScent_PetrichorScent` |
| pluie de sang (Anomaly) | **réutilise** `RimScent_BloodScent` |
| voile gris (Anomaly) | **réutilise** `RimScent_GrayFleshScent` |
| brume nocive (Biotech) | **réutilise** `RimScent_ToxicScent` |
| cendre, débris, coulée de lave (Odyssey) | **réutilise** `RimScent_AshScent`, pyromane exempté |
| Vanilla Events Expanded | sécheresse, canicule, floraison psychique |

Les valeurs restent basses : la météo et les conditions sont lues à l'échelle de la carte,
hors boucle de cases, donc chaque odeur touche toute la colonie d'un coup.

**Aucun `MayRequire` nulle part.** Une opération conditionnelle dont le xpath ne correspond à
rien ne fait rien et ne lève aucune erreur : les defs d'Anomaly, de Biotech et d'Odyssey sont
visées directement, et le mod fonctionne sans eux.

Beaucoup de conditions n'ont **volontairement** aucune odeur : éclipse, éruption solaire,
aurore, bourdonnement psychique, obscurité anormale. Le ciel qui change ne sent rien, et lui
inventer une odeur serait du bruit.

## Ce qui n'y est pas, et pourquoi

**Les phéromones.** RimScent ne lit sur un pion voisin que ses `HediffDef`, et aucun hediff
vanilla ne les marque. Une odeur posée sur `Human` serait simplement permanente pour toute
colonie — exactement ce que le seuil de `ModExtension_PawnScent` existe pour éviter. Il
faudrait un déclencheur : ce n'est pas écarté, c'est en attente d'un crochet honnête.

**Les colons qui ne se lavent pas.** Déjà couvert par RimScent lui-même, dans son volet Dubs
Bad Hygiene (`RimScent_BadHygiene`). Rien à ajouter.

**La maladie sur l'haleine.** RimScent lit les hediffs d'un voisin : patcher les maladies
fonctionnerait nativement, sans une ligne de code. Mais c'est de la putréfaction, pas de la
météo — ça revient à **Decay Expansion**, qui porte déjà l'air de chambre de malade.

## Dépendances

- [RimScent](https://steamcommunity.com/sharedfiles/filedetails/?id=3645569466)
- RimScent Extended (le socle) — c'est lui qui porte `ModExtension_TerrainScent`

Vanilla Events Expanded n'est pas requis : son volet ne se charge que s'il est actif, via
`LoadFolders.xml`. Rien n'est écrit dans la sauvegarde.

## Licence

MIT — voir [LICENSE](LICENSE) et [ATTRIBUTION.md](ATTRIBUTION.md).
