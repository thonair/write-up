
# Cyber Security Challenge Helmo 2024 : ChallengeCeption 1

**Catégorie:** Networking

**Points:** 200

**Description:** 

> Nous avons intercepté des communications mystérieuses. Pouvez-vous aider à les déchiffrer?
> Un fichier pcap suspect a été attaché à ce message. Bonne chance, et n'oubliez pas : la réponse est toujours quelque part dans les données.
> [`challenge.pcap`](challenge.pcap)

## Write-up
Ce challenge se concentre sur l'analyse d'un fichier pcap afin de récupérer des informations cachées. Le fichier pcap, commun dans les défis de type Capture The Flag, contient des données de trafic réseau qui peuvent être examinées pour retrouver des indices ou des données cachées.

### Solution
Le challenge commence par l'ouverture du fichier `challenge.pcap` avec Wireshark. Ce logiciel permet d'analyser les trames et paquets contenus dans le fichier.

Après avoir parcouru les premières trames, une en particulier attire l'attention de par sa taille supérieure et le texte anglais contenu :

```
FLAG1: CSC{Stand back. The portal will open in 3, 2, 1... #uERB9xzxQ8FSJj6M}..Hello and welcome to the computer-aided enrichment center. We hope your brief detention in the relaxation vault has been a pleasant one. The vendor class ApertureScience has been processed and we are maintenant...
```

Il est clair que cette trame contient le premier flag. Le texte semble être une référence ludique, mais le plus important ici est le flag : `CSC{Stand back. The portal will open in 3, 2, 1... #uERB9xzxQ8FSJj6M}`.

Ce flag correspond au format attendu pour le challenge, indiquant que la première partie de la solution a été trouvée.

### Conclusion
L'analyse de fichiers pcap peut révéler une multitude d'informations cachées, des messages codés aux flags dans le cadre de challenges CTF. La clé est de scruter chaque détail, même dans ce qui semble être de simples paquets de données.
