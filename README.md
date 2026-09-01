# RimScent Extended: Weather Expansion

La météo, les catastrophes, et l'air du dehors. RimWorld 1.6.

**C'est le plus mince de la famille aujourd'hui, et celui qui a le plus à gagner.**

## Ce qu'il y a dedans

Les événements de *Vanilla Events Expanded* qui atteignent le nez. `GameConditionDef` est
l'un des types de def que l'extension de RimScent accepte déjà, et Vanilla Events Expanded
n'en utilise **pas un seul**.

| Condition | Odeur |
|---|---|
| sécheresse | poussière et terre sèche, plus rien de vert à sentir |
| canicule | l'air chaud emporte tout avec lui, et rien d'agréable |
| floraison psychique | quelque chose de floral et de faux, trop sucré pour être une fleur |

## Ce qui vient

- La pluie et la terre mouillée, la forêt, l'herbe coupée.
- La vase tiède au bord de l'eau quand il fait chaud, la mer.
- Les sources chaudes.
- Les colons qui ne se lavent pas, via **Dubs Bad Hygiene**. Un pion qui ne se lave pas pue —
  contrairement à un animal, qui se lave.
- Les phéromones. Personne ne les remarque consciemment, et tout le monde les remarque.
- La maladie sur l'haleine.

## Pourquoi c'est un mod à part

Une odeur de météo ne se pose sur aucun objet : elle vit sur une `GameConditionDef` ou une
`WeatherDef`, que RimScent lit à part des choses posées au sol. C'est une famille d'odeurs
qui ne partage rien avec les autres volets — d'où un mod à elle plutôt qu'un dossier de plus
ailleurs.

## Dépendances

- [RimScent](https://steamcommunity.com/sharedfiles/filedetails/?id=3645569466)
- RimScent Extended (le socle)

Vanilla Events Expanded n'est pas requis : son volet ne se charge que s'il est actif, via
`LoadFolders.xml`. Rien n'est écrit dans la sauvegarde.

## Licence

MIT — voir [LICENSE](LICENSE) et [ATTRIBUTION.md](ATTRIBUTION.md).
