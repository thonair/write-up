# Cyber Security Challenge 2024 : Majorette Emergency

**Catégorie:** Cryptographie

**Points:** 50

**Description:** 

> Je suis en retard pour mon cours de cheerleading et je n'arrive pas à sortir mes drapeaux de cet horrible coffre-fort !
> Je me souviens avoir écrit comment l'ouvrir dans mon journal, mais je ne peux même pas lire ma propre écriture !
> Que vais-je faire...
> [`challenge`](challenge)

## Write-up
Comme pour chaque challenge dans le cadre d'un Capture The Flag, le but étant de retrouver un drapeau (flag). Dans notre cas, le drapeau est sous le format suivant : `CSC{XXXXXXX}`

### Solution
Le challenge contient un fichier contenant une chaîne de caractères ainsi que qu'un ZIP protégé par un mot de passe. Le but étant de trouver le mot de passe et déverrouiller le dossier.

En regardant de plus près le fichier [`secret_diary.txt`](secret_diary.txt) :
```
98b6a84b03f5aca7e23a13c627d62037
```

Cette chaîne de caractères correspond à de l'hexadécimal. Le déchiffrement via [CyberChef](https://gchq.github.io/CyberChef) ne donne rien ce qui signifie que cela peut être un hash. En passant le hash dans [hashes.com](https://hashes.com/en/decrypt/hash) on obtient le résultat suivant :
```
98b6a84b03f5aca7e23a13c627d62037:Use_A_Key
```

Il nous reste plus qu'à dézipper le dossier avec le mot de passe `Use_A_Key`.

Le fichier contenu dans le ZIP contient le flag : `CSC{N0t_v3ry_57urdy_15_it_N0w}`

