# Space Game

Ein einfaches 2D-Weltraumspiel mit Powerups und Highscore-Liste, entwickelt mit [pygame-ce](https://pyga.me).

![Startmenü](screenshots/menu.png)

![Gameplay mit Powerups](screenshots/powerups.png)

## Installation

Voraussetzung: Python 3 (mit `venv`) und git.

```bash
git clone https://github.com/bawsuser/space_game.git
cd space_game/
bash install.sh
source ~/.bashrc
```

`install.sh` legt ein virtuelles Environment (`.venv`) an, installiert `pygame-ce` und richtet den Alias `spacegame` in `~/.bashrc` ein. Das Skript kann beliebig oft ausgeführt werden.

## Starten

```bash
spacegame                # von überall, nach der Installation
# oder direkt im Projektordner:
.venv/bin/python main.py
```

Immer `main.py` starten, nicht `game_loop.py` (wegen des zirkulären Imports).

## Steuerung

| Taste        | Aktion                    |
|--------------|---------------------------|
| `W` `A` `S` `D` | Schiff bewegen         |
| `←` `→`      | Schiff drehen             |
| `Leertaste`  | Schießen                  |
| `ESC`        | Pause-Menü                |
| `W` / `S` + `Enter` | Menü bedienen      |

![Gameplay](screenshots/gameplay.png)

## Powerups

| Item | Wirkung |
|------|---------|
| Health | +10 Leben |
| Shield | Schutzschild für 10 Sekunden |
| Speed | doppelte Feuerrate |
| Shockwave | Druckwelle, die Asteroiden und gegnerische Schüsse zerstört |
| 4-Way-Shoot | Schüsse in vier Richtungen |

![Powerups einsammeln](screenshots/powerups2.png)

![Schild und Gegner](screenshots/gegner.png)

## Highscore

Nach dem Game-Over trägst du deinen Namen ein, die Ergebnisse landen in einer lokalen SQLite-Datenbank (`scores.db`).

![Namenseingabe](screenshots/scoreboard.png)

## Einstellungen

Im Startmenü unter `settings` lassen sich Fullscreen und Auflösung (720p bis 4K) einstellen. Beim ersten Start wird die Monitorauflösung automatisch erkannt. Fullscreen gilt sofort, eine neue Auflösung nach dem nächsten Start.
