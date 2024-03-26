
# Cyber Security Challenge Helmo 2024 : ChallengeCeption 1

**Catégorie:** Networking

**Points:** 200

**Description:** 

> Nous avons intercepté des communications mystérieuses. Pouvez-vous aider à les déchiffrer?
> Un fichier pcap suspect a été attaché à ce message. Bonne chance, et n'oubliez pas : la réponse est toujours quelque part dans les données.
> [`challenge.pcap`](challenge.pcap)

## Write-up
Le deuxième challenge implique également l'analyse d'un fichier pcap, cette fois avec un accent particulier sur la recherche de trames contenant le mot 'flag'.

### Solution
En utilisant le filtre `frame contains 'flag'` dans Wireshark, j'ai rapidement isolé la trame 39 qui semblait contenir des informations cruciales.

La trame contenait le message en anglais :

```
The Enrichment Center regrets to inform you that this next test is impossible. Make no attempt to solve it.
```

Suivi par un message cryptique :

```
YXFenk xpaaowLi .lzm ei Agc iWPspneGhuTek8isah3tbh!Vg  pT:eee MkeSm{ d  #MNkEoCC DcZ}GaOcS
```

Et finalement, un indice en Zoulou traduit par Google Traduction comme :

```
Pour retrouver le drapeau : lisez la première lettre du recto, puis le premier caractère du verso, puis le deuxième du recto, et ainsi de suite. Répétez 4 fois.
```

En suivant cette méthode, j'ai découvert que les lettres et les symboles étaient mélangés de manière à former un message une fois réorganisés correctement. Après avoir appliqué l'instruction du message en Zoulou à la partie mélangée, le flag révélé était :

```
FLAG3: CSC{The weighted companion cube DOES speak. The cake is a lie! #ZGNkg8PmpxzWkVMM}
```

### Conclusion
Ce challenge a montré l'importance de l'attention aux détails et la connaissance des langues pour déchiffrer les messages cachés. L'utilisation de filtres spécifiques et la traduction de langues moins connues peuvent s'avérer cruciales dans l'analyse de données réseau complexes.
