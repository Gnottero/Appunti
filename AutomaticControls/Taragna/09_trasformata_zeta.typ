#import "../../template.typ": *

#show : project.with(
  title: "Concetti di Base sulla Trasformata Zeta",
  course: "Controlli Automatici"
)

= Definizione della Trasfromata Zeta
Mentra Laplace usava un integrale da $0$ a infinito, nel mondo discreto gli intervalli diventano delle *sommatorie*

Data una sequenza di valori reali $f(k)$ (i nostri campioni), la Trasformata Zeta è un operatore matematico che la trasforma in una funzione $F(z)$ dipendente da una nuova variabile complessa $z$. La definizione matematica (unilatera) è:
$ F(z) eq cal(Z){f(k)} eq sum_(k eq 0)^infinity f(k)z^(-k) $

Dove:
- $f(k)$: È la nostra sequenza di valori nel tempo discreto (es. le letture di un sensore)

- $z$: È una variabile complessa $(z in CC)$, che prende il posto che aveva la $s$ in Laplace

- $z^(-k)$: Rappresenta fisicamente un "ritardo" di $k$ passi di campionamento

= Proprietà della Trasformata Zeta
== Proprietà di Linearità
Proprio come Laplace, anche la Trasformata Zeta è un'operatore *lineare*. Questo ci permette di studiare sistemi complessi scomponendoli in parti più semplici

Se abbiamo due sequenze $f_1 (k)$ e $f_2 (k)$ con le rispettive trasformate $F_1 (z)$ e $F_2 (k)$, e due costanti reali $c_1$ e $c_2$, vale la regola d'oro
$ cal(Z){c_1 f_1 (k) + c_2 f_2 (k)} eq c_1 F_1(z) + c_2 F_2(z) $

== Proprietà di Traslazione nel Tempo (Ritardo e Anticipo)
È l'esatto equivalente della derivazione nel dominio di Laplace. Nei sistemi discreti non abbiamo le derivate, ma abbiamo i campioni precedenti o successivi

=== Teorema del Ritardo (Shift a destra)
Se ritardo un segnale di $n$ passi di campionamento, nel dominio complesso equivale a moltiplicare la sua trasformata per $z^(-n)$
$ cal(Z){f(k - n)} eq F(z) z^(-n) $

Significato pratico: Moltiplicare per $z^(-1)$ significa letteralmente prendere il campione precedente

=== Teorema dell'Anticipo (Shift a sinistra)
Se guardo al campione futuro (anticipo di 1 passo), la regola è:
$ cal(Z){f(k + 1)} eq z F(z) - z f(0) $

Questo rappresenta un'analogia formare con Laplace: la derivata era $s X(s) - s x(0)$

== Prodotto di Convoluzione
Esattamente come nel tempo continuo, se nel dominio del tempo discreto due segnali "convoluiscono" (cioè se facciamo passare un ingresso attraverso la risposta impulsiva di un sistema), nel dominio $z$ questo si traduce in una banale *moltiplicazione algebrica*:
$ cal(Z){f_1(k) convolve f_2(k)} eq F_1(z) dot F_2(z) $

Questa proprietà ci permetterà di definire il concetto di *Funzione di Trasferimento* anche per i sistemi digitali

== Teorema del Valore Iniziale e del Valore Finale
Questi due teoremi ci permettono di scoprire come inizia e come finisce una sequenza nel tempo, guardando _soltanto_ la sua trasformata $F(z)$, senza doverla antitrasformare

=== Teorema del Valore Iniziale
Ci dice quanto vale il primo campione al tempo zero:
$ lim_(k arrow.r 0) f(k) eq lim_(z arrow.r infinity) F(z) $

=== Teorema del Valore Finale
Ci dice a quale valore si assesterà il sistema a regime (per $k arrow.r infinity$). È fondamentale per calcolare gli errori a regime dei sistemi di calcolo
$ lim_(k arrow.r infinity) f(k) eq lim_(z arrow.r 1) (z - 1) F(z) $

In Laplace si faceva il limite per $s arrow.r 0$ moltiplicando per $s$. In Zeta, il punti di equilibrio stabile si sposta e si fa il limite per $z arrow.r 1$ moltiplicando per $(z - 1)$

= Scomposizione di Funzioni Razionali Fratte
Il problema nasce da una semplice osservazione: quando studiavamo i sistemi a tempo continuo, lo sviluppo in fratti semplici ci portava ad avere termini del tipo $R/(s-a)$, che antitrasformavamo banalmente nell'esponenziale $R e^(a t)$

Tuttavia, se facessimo la stessa scomposizione standard per una funzione $F(z)$, otterremmo termini del tipo $R/(z-a)$. Il problema è che *questi termini non compaiono nelle tabelle fondamentali delle Trasformate Zeta*

Nelle tabelle, la trasformata fondamentale (quella che corrisponde al movimento elementare $a^k$) si presenta sempre con una $z$ al numeratore: $z/(z-a)$

== Il Procedimento (Divisione per $z$)
Invece di scomporre direttamente la nostra Funzione di Trasferimento $F(z)$, eseguiamo questi tre passaggi:

=== Creazione della Funzione Ausiliaria
Dividiamo l'intera $F(z)$ per la variabile $z$, creando una nuova funzione che chiameremo $tilde(F)(z)$
$ tilde(F)(z) eq (F(z))/(z) $

=== Scomposizione Standard
A questo punto, eseguiamo lo sviluppo in fratti semplici (calcolo dei residui, etc) sulla funzione ausiliaria $tilde(F)(z)$, esattamente con le stesse regole algebriche che usavamo per Laplace. Otterremo una somma di termini del tipo $R_i/(z-p_i)$

=== Ricostruzione di $F(z)$
Per tornare alla nostra funzione originale $F(z)$, moltiplichiamo tutti i fratti appena trovati per la variabile $z$ che avevamo "messo da parte"
$ F(z) eq z dot tilde(F)(z) eq sum (R_i z)/(z-p_i) $

In questo modo, abbiamo forzato ogni singolo termine ad avere una $z$ al numeratore, rendendolo prefettamente compatibile con le tabelle per l'antitrasformazione

= Il Caso delle Radici Complesse Coniugate
Il calcolo dei residui della decomposizione in fratti semplici è chiaramente identico al caso della trasformata di Laplace

L'unico accorgimento riguarda la coppia di radici complesse coniugate $a eq sigma + j omega, a^* eq sigma - j omega$. Anche in questo caso si ha una coppia di fratti:
$ (R z)/(z-a) + (R^* z)/(z-a^*) $

Che si antitrasforma complessivamente come:
$ 2 abs(R)abs(a)^k cos((angle a)k + angle R) $