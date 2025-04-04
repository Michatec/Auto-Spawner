# Auto-Spawner
Auto Spawner für FiveM.

Dieses Skript ermöglicht es Admins, Fahrzeuge zu spawnen und zu löschen. Fahrzeuge werden mit den Standardfarben des Spiels gespawnt, außer mann gibt eine Farbe an.

# Features

Fahrzeug spawnen: /car [fahrzeugname] Optional RGB: [r, g, b] 

Bsp: /car sultan 0 0 255
--> Blauer Sultan

Fahrzeug löschen: /delcar 
--> Das nächstgelegene Auto wird gelöscht das durch dieses Skript gespawnt.

Standardfarbe: Fahrzeuge werden mit den Standardfarben des Spiels gespawnt, außer mann gibt eine Farbe 
an.

# Admin-Berechtigungen

Das Skript überprüft, ob der Spieler Admin ist, bevor er den Befehl verwenden kann. Du kannst die Admin-Berechtigung in der isAdmin-Funktion anpassen.

# Installation
1. Lade den ZIP-Ordner herunter:
Lade die ZIP-Datei des car_spawner-Skripts [hier](https://github.com/Michatec/Auto-Spawner/releases) herunter.

2. Entpacke den ZIP-Ordner:
Entpacke die ZIP-Datei auf deinem Computer.

3. Füge das Skript in deinen Server-Ordner ein:
Kopiere den entpackten Ordner car_spawner in den resources-Ordner deines FiveM-Servers.

4. Aktiviere das Skript auf deinem Server:
Öffne deine server.cfg und füge den folgenden Befehl hinzu, um das Skript zu starten:

```plaintext
     start car_spawner
```

5. Server Neustart/Hochfahren:

Starte deinen Server (neu), damit das Sk
ript geladen wird.
