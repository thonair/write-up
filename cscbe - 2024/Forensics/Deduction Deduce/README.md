# Cyber Security Challenge 2024 : Deduction Deduce

**Catégorie:** Forensics

**Points:** 50

**Description:** 

> Une femme est sûre d'avoir été piratée, mais nos agents ont commis une énorme erreur en acquérant les preuves et la plupart ont été perdues !
> Il ne reste que deux fichiers de configuration et un extrait des tâches planifiées ainsi qu'une copie de l'entretien mené avec la victime.
> Pouvez-vous faire les bonnes hypothèses et déduire quelle tâche planifiée est la plus probablement responsable de la folie actuelle ?
> [`deduction_deduce`](deduction_deduce)

## Write-up
Comme pour chaque challenge dans le cadre d'un Capture The Flag, le but étant de retrouver un drapeau (flag). Dans notre cas, le drapeau est sous le format suivant : `CSC{XXXXXXX}`

### Solution
Le dossier du challenge contient 4 fichiers nous permettant de récupérer des indices sur le piratage. Après ouverture du fichier XML, on se rend compte qu'il faut retrouver la tâche lié au piratage pour récupérer le drapeau.

#### Analyse du fichier Interview.pdf :
Ce fichier semble être une transcription d'une interview entre l'officier Bar Brady et Elizabeth Dunquin. L'interview concerne une plainte liée à un piratage potentiel d'un ordinateur portable d'entreprise. Dans l'interview, Dunquin décrit des comportements inhabituels sur l'ordinateur portable partagé, notamment des couleurs étranges à l'écran de connexion. Elle mentionne également des mécanismes de persistance et des alertes d'antivirus concernant des backdoors et des virus. Elle précise que les incidents ont commencé le 9 novembre 2023 lors d'une réunion avec un client. Elle partage également que d'autres utilisateurs, notamment Esther et Elisa, ont également remarqué ces comportements suspects. Enfin, elle indique que chaque utilisateur a son propre compte sur l'ordinateur portable partagé.

#### Analyse du fichier [`Microsoft.PowerShell_profile.ps1`](deduction_deduce/Microsoft.PowerShell_profile.ps1):
Ce script PowerShell personnalise les couleurs de la console en définissant des couleurs spécifiques pour différents éléments de la syntaxe PowerShell, tels que les commandes, les nombres, les variables, etc. Il utilise la commande Set-PSReadlineOption pour définir ces couleurs, ainsi que les options de lecture de la console. Ensuite, il définit la couleur de fond de la console sur vert et la couleur du texte sur noir. Enfin, il efface le contenu de la console pour appliquer les nouvelles couleurs.

#### Analyse du fichier [`config.properties`](deduction_deduce/config.properties) :
Ce code Java crée un objet Properties et définit différentes propriétés pour un schéma de couleur nommé "Hacker". Il spécifie la couleur de fond en vert, la couleur des nombres en rouge, la couleur du texte de sortie en noir et la couleur des connexions en vert.

#### Analyse du fichier [`ScheduledTasks.xml`](deduction_deduce/ScheduledTasks.xml) :
Le fichier XML semble contenir la configuration d'une tâche planifiée. Il comprend des informations telles que l'auteur de la tâche, les paramètres de sécurité, les déclencheurs d'exécution de la tâche, les actions à effectuer lors de l'exécution de la tâche, ainsi que d'autres paramètres de configuration.

#### Corrélation entres les analyses :
En mettant toutes ces informations ensemble, il est raisonnable de supposer que la tâche planifiée la plus susceptible d'être responsable de ces incidents est celle qui modifie les couleurs de l'écran de connexion et de la console PowerShell pour correspondre au schéma inhabituel décrit par la victime. Cette tâche planifiée pourrait être configurée pour s'exécuter chaque semaine le jour où la victime rencontre le problème (mardi ou jeudi). Ces incidents ont commencé le 9 novembre 2023, et se reproduisent chaque semaine depuis lors.

#### Résultat :
La première information qui va m'interreser est la date de commencement de ces incidents : le `9 novembre 2023`. Je l'ai donc transformé au format XML ce qui donne `2023-11-9T`. En faisant une recherche (CTRL + F) dans le fichier de tâches [`ScheduledTasks.xml`](deduction_deduce/ScheduledTasks.xml), je tombe sur cette tâche : 
```xml
<Task version="1.2"
    xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task">
    <RegistrationInfo>
        <Date>2023-11-9T2:37:49:8833954</Date>
        <Author>Sora</Author>
        <URI>CSC{Th-_Grwat7sb_kktecti!e_to_liv§}</URI>
    </RegistrationInfo>
    <Principals>
        <Principal id="Author">
            <UserId>S-1-5-21-1308737159-2471153319-3326108015-1001</UserId>
            <LogonType>InteractiveToken</LogonType>
            <RunLevel>LeastPrivilege</RunLevel>
        </Principal>
    </Principals>
    <Settings>
        <MultipleInstancesPolicy>IgnoreNew</MultipleInstancesPolicy>
        <DisallowStartIfOnBatteries>FALSE</DisallowStartIfOnBatteries>
        <StopIfGoingOnBatteries>FALSE</StopIfGoingOnBatteries>
        <AllowHardTerminate>true</AllowHardTerminate>
        <StartWhenAvailable>false</StartWhenAvailable>
        <RunOnlyIfNetworkAvailable>false</RunOnlyIfNetworkAvailable>
        <IdleSettings>
            <StopOnIdleEnd>true</StopOnIdleEnd>
            <RestartOnIdle>false</RestartOnIdle>
        </IdleSettings>
        <AllowStartOnDemand>true</AllowStartOnDemand>
        <Enabled>true</Enabled>
        <Hidden>true</Hidden>
        <RunOnlyIfIdle>false</RunOnlyIfIdle>
        <WakeToRun>false</WakeToRun>
        <ExecutionTimeLimit>PT72H</ExecutionTimeLimit>
        <Priority>7</Priority>
    </Settings>
    <Actions Context="Author">
        <Exec>
            <Command>cmd.exe</Command>
            <Arguments>if (Get-Process -id 1337){./acquisition.exe}</Arguments>
        </Exec>
    </Actions>
    <Triggers xmlns="">
        <LogonTrigger>
            <Enabled>True</Enabled>
        </LogonTrigger>
    </Triggers>
</Task><?xml version="1.0" encoding="UTF-16"?>
```
Cette tâche planifiée est configurée pour s'exécuter lors de la connexion de l'utilisateur. Elle vérifie si un processus avec l'ID 1337 est en cours d'exécution, et si c'est le cas, elle lance un fichier "acquisition.exe".

On y retrouve également le flag : `CSC{Th-_Grwat7sb_kktecti!e_to_liv§}`
