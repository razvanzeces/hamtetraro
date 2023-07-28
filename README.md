# hamtetraro
HAMTETRA REPO
Scripturile sunt create de catre YO6RZV. Daca doriti sa le utilizati, pur si simplu copiati fisierul .sh direct pe nodul SVXLINK, pozitionati-l in folderul /etc/svxlink, dupa care prin comanda crontab -e, adaugati intervalul dorit de timp la care sa ruleze fiecare script in parte.
A se nota, trebuie sa modificati TELEGRAM-BOT-KEY si TELEGRAM-CHAT-ID, fara acestea, scriptul va genera tot mesajul, insa nu va putea sa il trimita catre Telegram prin API.

checkdimension.sh - script care verifica daca fisierul svxlink.log este prezent, ce dimensiune are, iar daca are mai mult de 1MB, il muta intr-un folder adiacent, il redenumeste tinand cont de data/ora, si sterge tot continutul din fisierul original svxlink.log. Este de ajutor pentru a trunchia log-urile in fiecare ora, in cazul in care fisierul depaseste 1MB. Se poate modifica cerinta de verificare a spatiului.
tetrasystemstatus.sh - script care verifica urmatorii parametri: utilizare CPU, RAM, HDD, media utilizarii CPU-ului, statusul serviciului SVXLINK, de cand este pornit serviciul SVXLINK, uptime-ul sistemului care ruleaza script-ul. Si acesta trimite alerta catre Telegram, prin API.
tetratxcount.sh - script care verifica de cate ori s-a pornit TX-ul din softul SVXLINK, intr-un anumit interval de timp. Se poate seta sa trimita alerte pe Telegram, prin API, alerte care pot fi customizate dupa bunul plac. 

Repo-ul este la inceput, find prezente doar cateva scripturi, pentru automatizarea unor functii. Toate actualizarile se vor efectua pe acest repo.

73 de YO6RZV
