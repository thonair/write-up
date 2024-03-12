# Cyber Security Challenge 2024 : Welcome From Mars

**Catégorie:** Divers

**Points:** 50

**Description:** 

> Découvrez ce selfie envoyé par l'un de nos premiers Martiens !
> Le drapeau est au format csc xxxxxxxxx, ajoutez vous-même les accolades.
> [`MARS.webp`](MARS.webp)

## Write-up
Comme pour chaque challenge dans le cadre d'un Capture The Flag, le but étant de retrouver un drapeau (flag). Dans notre cas, le drapeau dans avoir le format suivant : `csc{XXXXXXX}`

Pour commencer, j'ai ouvert le fichier du challenge. Ce fichier est une image d'un astronaute tenant une pancarte sur Mars.

### Solution
Sur la pancarte tenue par l'astronaute, il y a quelque chose d'inscrit avec des petits points. On se rend assez rapidement compte que cette écriture est du braille. Le principe du braille est d'utiliser le sens du toucher pour l'écriture et la lecture au moyen de points en relief (comme sur les boites de médicaments). 

Le site web que j'ai utilisé pour traduire le texte braille est [ABC Braille](https://abcbraille.com/braille)
#### Message en braille :
```
⠓⠑⠽ ⠉⠎⠉⠃⠑ ⠉⠕⠝⠞⠑⠎⠞⠁⠝⠞⠎⠨ ⠺⠑⠇⠉⠕⠍⠑ ⠋⠗⠕⠍ ⠍⠁⠗⠎⠨ ⠉⠎⠉ ⠝⠑⠭⠞⠍⠊⠎⠎⠊⠕⠝⠞⠕⠞⠓⠑⠍⠕⠕⠝
```

#### Message traduit en Anglais :
```
hey cscbe contestants\46/ welcome from mars\46/ csc nextmissiontothemoon
```

#### Message traduit en Français :
```
salut les candidats cscbe\46/ bienvenue de mars\46/ csc nextmissiontothemoon
```

Le drapeau est : `CSC{nextmissiontothemoon}`
