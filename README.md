# Procsiab Dotfiles

## Installazione

Ho preparato questo repository per gestire i dotfile tramite GNU Stow; per installare i file eseguire il seguente comando:

```bash
cd dotfiles; stow *
```

Il comando precedente permette, se ci si trova nella cartella superiore a questa repository, di installare tutti i file in essa contenuti; se volete installare solo file per un singolo programma, allora usate:

```bash
stow <nomeprogramma>
```

Dove `nomeprogramma` è il nome di una cartella nel livello più alto di questo repository.

## Disinstallazione

Spostarsi nella radice di questo repository e lanciare il comando:

```bash
stow -D
```

## Note

Ovviamente è necessario installare il pacchetto `stow`; questo repository contiene le impostazioni per i seguenti programmi:

- Bash
- Tilix
- Tmux
- NeoVim (configurato per usare il file di impostazioni di Vim)
- Zathura
- ZSH

Dopo aver installato le impostazioni, sarà comunque necessario installare i plug-in di Vim tramite il comando `PluginInstall` e anche i file dizionario per Inglese e Italiano; inoltre sarà opportuno installare i plugin di Zsh tramite gestore di pacchetti `zpm`.
Infine, è necessario installare `oh-my-zsh` per completare la configurazione.
