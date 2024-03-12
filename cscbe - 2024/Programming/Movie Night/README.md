# Cyber Security Challenge 2024 : Movie Night

**Catégorie:** Programmation

**Points:** 50

**Description:** 

> Bienvenue à notre soirée cinéma ! Le pop-corn est offert !
> [`Movie.gif`](Movie.gif)

## Write-up
Comme pour chaque challenge dans le cadre d'un Capture The Flag, le but étant de retrouver un drapeau (flag). Dans notre cas, le drapeau est sous le format suivant : `CSC{XXXXXXX}`

Pour commencer, j'ai visionné le GIF. Je me suis rendu compte alors que le défi consiste en un GIF contenant de nombreux QR codes qui défilent. L'objectif est de séparer les QR codes et de les scanner.

### Première réflection
Pour séparer les QR codes, j'ai d'abord utiliser un outil en ligne de commande `convert` fourni par ImageMagick sous Kali Linux. Voici les étapes à suivre :
1. Installer ImageMagick en utilisant la commande suivante :
```
sudo apt-get update
sudo apt-get install imagemagick
```
2. Une fois ImageMagick installé, j'ai utilisé la commande `convert` pour diviser le GIF en images individuelles. Voici un exemple de commande :
```
convert le_gif.gif /chemin/vers/repertoire_de_sortie/nom_de_sortie_%d.png
```
Le résultat de sortie de cette commande est un dossier avec plus de 400 images de QR codes. A la base je m'étais dit que j'allais scanner les QR codes un à un mais ça va me prendre un temps fou ce pourquoi je vais changer de méthode.

### Solution
Pour des raisons de simplicité et de rapidité, je me suis dis que j'allais créer un script Python permettant d'extraire les QR codes et de les scanner.

Voici le script Python :
```py
import cv2
from pyzbar.pyzbar import decode

def decode_qr_codes(gif_path):
    # Ouvrir le GIF
    gif = cv2.VideoCapture(gif_path)

    frames = []
    success, frame = gif.read()
    while success:
        # Convertir l'image en niveaux de gris pour une meilleure détection des QR codes
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        frames.append(gray)
        success, frame = gif.read()

    # Décoder les QR codes dans chaque image
    qr_codes = []
    for frame in frames:
        decoded_objects = decode(frame)
        for obj in decoded_objects:
            qr_data = obj.data.hex()  # Convertir en hexadécimal
            qr_codes.append(qr_data)

    return qr_codes

if __name__ == "__main__":
    gif_path = "chemin/vers/le/gif.gif"
    qr_codes = decode_qr_codes(gif_path)
    print(" ".join(qr_codes))
```
#### Installation des bibliothèques :
```
pip install opencv-python pyzbar
```

#### Explications :
* Ce script utilise les bibliothèques `OpenCV` (cv2) et `pyzbar` pour détecter et décoder les QR codes dans un GIF.

* Il commence par définir une fonction decode_qr_codes(gif_path) qui prend en entrée le chemin vers le GIF. Ensuite, il ouvre le GIF et extrait chaque image. Chaque image est convertie en niveaux de gris pour faciliter la détection des QR codes.

* Ensuite, il parcourt chaque image, détecte les QR codes à l'aide de pyzbar, et les décode. Les données des QR codes sont converties en format hexadécimal pour une meilleure lisibilité.

* Enfin, le script imprime les données hexadécimales des QR codes détectés dans le GIF.

#### Résultat :
```
3438 3635 3732 3635 3230 3639 3733 3230 3631 3230 3663 3666 3665 3637 3230 3734 3635 3738 3734 3230 3734 3638 3631 3734 3230 3639 3733 3230 3666 3665 3663 3739 3230 3634 3635 3733 3639 3637 3665 3635 3634 3230 3734 3666 3230 3631 3665 3666 3739 3230 3739 3666 3735 3265 3230 3439 3230 3664 3635 3631 3665 3230 3639 3734 3230 3733 3638 3666 3735 3663 3634 3665 3237 3734 3230 3632 3635 3230 3734 3638 3631 3734 3230 3631 3665 3666 3739 3639 3665 3637 3230 3631 3733 3230 3739 3666 3735 3230 3631 3732 3635 3230 3733 3735 3730 3666 3733 3635 3634 3230 3734 3666 3230 3631 3735 3734 3666 3664 3631 3734 3635 3230 3734 3638 3635 3230 3635 3738 3734 3732 3631 3633 3734 3639 3666 3665 3230 3666 3636 3230 3734 3638 3635 3230 3734 3635 3738 3734 3230 3631 3665 3634 3230 3665 3666 3734 3230 3733 3633 3631 3665 3230 3635 3631 3633 3638 3230 3633 3666 3634 3635 3230 3666 3665 3635 3230 3632 3739 3230 3666 3665 3635 3265 3230 3439 3230 3733 3735 3732 3635 3230 3638 3666 3730 3635 3230 3739 3666 3735 3230 3634 3639 3634 3665 3237 3734 3230 3634 3666 3230 3734 3638 3631 3734 3230 3632 3635 3633 3631 3735 3733 3635 3230 3734 3638 3631 3734 3230 3737 3666 3735 3663 3634 3230 3632 3635 3230 3631 3230 3664 3631 3733 3639 3736 3635 3230 3737 3631 3733 3734 3635 3230 3666 3636 3230 3734 3639 3664 3635 3265 3230 3537 3638 3639 3663 3635 3230 3739 3666 3735 3230 3631 3732 3635 3230 3638 3635 3732 3635 3263 3230 3661 3735 3733 3734 3230 3637 3732 3631 3632 3230 3734 3638 3635 3230 3636 3663 3631 3637 3361 3230 3433 3533 3433 3762 3439 3566 3733 3535 3732 3333 3566 3638 3466 3730 3635 3566 3739 3666 3735 3566 3663 3331 3662 3635 3634 3566 3534 3638 3333 3566 3664 3666 3736 3639 3333 3764 3265 3230 3439 3230 3662 3665 3666 3737 3230 3734 3638 3631 3734 3230 3665 3666 3230 3666 3665 3635 3230 3639 3733 3230 3637 3666 3639 3665 3637 3230 3734 3666 3230 3732 3635 3631 3634 3230 3734 3638 3639 3733 3230 3632 3735 3734 3230 3439 3230 3631 3664 3230 3661 3735 3733 3734 3230 3637 3666 3665 3631 3230 3662 3635 3730 3230 3666 3665 3230 3737 3732 3639 3734 3639 3665 3637 3230 3661 3735 3733 3734 3230 3734 3666 3230 3632 3635 3230 3631 3230 3663 3639 3734 3663 3635 3230 3664 3666 3732 3635 3230 3631 3665 3666 3739 3639 3665 3637 3265
```

Une fois le résultat obtenu, je le copie-colle dans [CyberChef](https://gchq.github.io/CyberChef/) et j'y applique le filtre `Magic`. [CyberChef](https://gchq.github.io/CyberChef/) trouve un résultat en y appliquant les filtres `From Hexdump` pour convertir des données affichées sous forme de dump hexadécimal en données binaires ou textuelles et `From Hex` pour convertir des données hexadécimales en un format texte ou binaire.

#### Résultat final :
```
Here is a long text that is only designed to anoy you. I mean it shouldn't be that anoying as you are suposed to automate the extraction of the text and not scan each code one by one. I sure hope you didn't do that because that would be a masive waste of time. While you are here, just grab the flag: CSC{I_sUr3_hOpe_you_l1ked_Th3_movi3}. I know that no one is going to read this but I am just gona kep on writing just to be a litle more anoying.
```

Le drapeau est : `CSC{I_sUr3_hOpe_you_l1ked_Th3_movi3}`
