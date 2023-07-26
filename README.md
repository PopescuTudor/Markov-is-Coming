# Markov-is-Coming
Un algoritm in OCTAVE care ghideaza un robot in afara labirintului, folosind lantul lui Markov.

Primul pas este sa parsam labirintul aflat in fisierul de intrare, deschis pt. citire. Utilizez functia fscanf() pt a citi dimensiunile de pe prima linie si matricea ce urmeaza.

Matricea de adiacenta a labirintului se calculeaza prin analizarea pe biti a valorilor din matricea initiala. Astfel, putem afla exact ce biti sunt setati pe 0, adica nu exista zid in acea directie.
In cazul in care starea analizata se afla pe marginile de sud sau nord si nu au zid inspre exterior, atunci putem ajunge in starea WIN. In cazul starilor de pe marginile de la vest si est, ajungem in
starea LOSE. Matricea de legaturi urmeaza acelasi principiu, insa trebuie numarate starile accesibile din fiecare stare pt a calcula probabilitatea de a ajunge acolo.

Pentru a aplica algoritmul Jacobi, avem nevoie de matricea si vectorul de iteratie. In cazul nostru, vectorul de iteratie (c) reprezinta probabilitatile ca, din fiecare stare, sa se ajunga DIRECT 
in starea WIN. Matricea de iteratie (G) este insasi matricea de legaturi, fara definitia starilor de WIN si LOSE. Se va rezolva apoi sistemul p = Gp + c prin metoda Jacobi,
unde p reprezinta probabilitatile ca, din orice pozitie, sa se ajunga pe o cale la WIN. 

Pentru a gasi calea catre starea WIN, aplicam un algoritm euristic Greedy simplu. Ideea care sta la baza acestui algoritm este verificarea vecinilor nevizitati pt fiecare stare dintr-o coada.
Se alege, conform vectorului aflat cu metoda Jacobi vecinul cu cea mai mare probabilitate de a ajunge la WIN si se adauga la acea coada (Path).

Calea trebuie, apoi, decodificata in perechi [linie coloana] prin simple operatii de impartire cu si fara rest a indexului fiecarei stari.
