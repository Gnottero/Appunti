#import "../../template.typ": *

#show : project.with(
  title: "Diagrammi di Bode",
  course: "Controlli Automatici"
)

= La Risposta in Frequenza e la sua Rappresentazione
== Definizione di Risposta in Frequenza
L'analisi della risposta in frequenza di un sistema lineare si effettua valutando la funzione di trasferimento $G(s)$ per $s eq j omega$, ottenendo la *funzione di risposta in frequenza* $G(j omega)$. Essa è una funzione complessa della pulsazione $omega in [0, oo)$ e viene rappresentata in forma polare:
$ G(j omega) eq abs(G(j omega)) dot e^(j angle G(j omega)) eq M(omega) dot e^(j phi(omega)) $
Dove:
- $M(omega) eq abs(G(j omega))$ è il *modulo* (o guadagno) della risposta in frequenza, misurato in *unità naturali*, definite dal rapporto tra le unità di misura dell'uscita e dell'ingresso

- $phi(omega) eq angle G(j omega)$ è la *fase*, misurata in radianti (rad) o gradi ($degree$)

Per il modulo si utilizza comunemente l'unità logaritmica *decibel (dB)*:
$ M_(d B)(omega) eq 20 log_10 (M(omega)) $
L'uso dei decibel e della rappresentazione logaritmica è particolarmente vantaggioso quando la funzione di trasferimento è esprimibile come prodotto di fattori (blocchi in cascata). In tal caso, il logaritmo trasforma il prodotto in somma:
$ G(s) eq G_1(s)G_2(s) dots G_k (s) arrow.r.double.long cases(M_(d B)(omega) eq sum_(i eq 1)^k M_(i, d B) (omega), phi(omega) eq sum_(i eq 1)^k phi_i (omega)) $

= Diagrammi di Bode
I *Diagrammi di Bode* (DdB) sono la rappresentazione grafica standard della risposta in frequenza. Essi sono costituiti da due grafici distinti, entrambi con la pulsazione $omega$ in ascissa su scala *logaritmica*:
- *Diagramma del modulo*: $M_(d B)(omega)$ in ordinata, su scala lineare (in dB)

- *Diagramma della fase*: $phi(omega)$ in ordinata, su scala lineare (in gradi o radianti)

La scala logaritmica in ascissa consente di rappresentare un ampio intervallo di pulsazioni e rende rettilinei i contributi asintotici dei termini elementari

= Diagrammi di Bode di Funzioni di Trasferimento Elementari
Una qualunque funzione di trasferimento può essere scomposta nel prodotto di quattro tipologie di fattori elementari, espressi in forma a guadagno stazionario unitario (ad eccezione del guadagno puro). L'analisi dei DdB di questi fattori è il fondamento del tracciamento rapido (qualitativo e quantitativo) dei diagrammi di sistemi complessi

== Fattore 1: Guadagno $f_1 (s) eq K$ (con $K eq.not 0$)
È il fattore più semplice
- *Modulo*: $M_(d B) eq 20 log_10 abs(K)$, costante per ogni $omega$

- *Fase*: $phi eq 0 degree$ se $K gt 0, phi eq -180 degree$ (o $+180 degree$) se $K lt 0$, costante per ogni $omega$

== Fattore 2: Polo nell'Origine $f_2 (s) eq K/s^i$ (con $K gt 0, i gt.eq 1$)
Consideriamo dapprima il caso semplice $i eq 1$, ovvero $f_2 (s) eq K/s$

- *Modulo*: $M_(d B) eq 20 log_10 (abs(K)) - 20 log_10 (omega)$. Poichè la dipendenza da $log_10 (omega)$ è lineare, il diagramma è una retta con pendenza $-20$dB/decade
  - Per $omega eq 1$: $M_(d B) eq 20 log_10 K$

  - Per $omega eq abs(K)$: $M_(d B) eq 0 d B$ (attraversamento dell'asse a 0 dB)

- *Fase*: $phi eq -90 degree$, costante per ogni $omega$

Per un polo multiplo ($i gt 1$), la pendenza del modulo diventa $-20i$dB/dec e la fase si moltiplica per $i$ ($phi eq -90 degree dot i$)

== Fattore 3: Polo Reale $f_3 (s) eq (1 - s/lambda)^(-1)$
Qui $lambda$ è la pulsazione associata al polo. Si definisce la variabile adimensionata $Omega eq omega/abs(lambda)$

*Approssimazione in Bassa Frequenza ($omega lt.double abs(lambda), "ovvero" Omega lt.double 1$)*:
- $M_(d B) approx 0 d B$

- $phi approx 0 degree$

*Approssimazione in Alta Frequenza ($omega gt.double abs(lambda), "ovvero" Omega gt.double 1$)*:
- Il modulo decade con una *retta a pendenza $-20$dB/dec* che interseca l'asse a $0$dB in corrispondenza di $Omega eq 1$ (cioè $omega eq abs(lambda)$)

- La fase tende a $-90 degree$ se il polo è *stabile* ($lambda lt 0$), oppure $+90 degree$ se il polo è *instabile* ($lambda gt 0$). È una differenza cruciale: il modulo non distingue stabilità o instabilità, la fase si

*Punto Centrale ($omega eq abs(lambda), Omega eq 1$)*:
- Modulo: $M_(d B) approx -3"dB"$ (indipendentemente dalla stabilità)

- Fase: $phi eq -45 degree$ per polo stabile, $phi eq +45 degree$ per polo instabile

Il diagramma esatto si discosta dall'asintoto principalmente nell'intorno di $omega eq abs(lambda)$. La massima distanza è di $plus.minus 3"dB"$

== Fattore 4: Poli Complessi Coniugati $f_4 (s) eq (1 + (2 zeta)/(omega_n)s + (s^2)/(omega_n^2))^(-1)$
$omega_n$ è la pulsazione naturale e $zeta$ il fattore di smorzamento ($-1 lt zeta lt 1$). Definiamo $Omega eq omega/omega_n$

*Approssimazione in Bassa Frequenza ($omega lt.double omega_n$)*:
- $M_(d B) approx 0 "dB", phi approx 0 degree ("per" zeta eq.not 0)$

*Approssimazione in Alta Frequenza ($omega gt.double omega_n$)*:
- Il modulo decade con una *retta a pendenza $-40$dB/dec* che interseca l'asse a $0$dB in $Omega eq 1$

- La fase tende a $-180 degree$ se i poli sono *stabili* ($zeta gt 0$), oppure a $+180 degree$ se sono instabili ($zeta lt 0$)

*Punto Centrale ($omega eq omega_n, Omega eq 1$)*:
- Modulo: $M_(d B) eq 20 log_10 (1/(2 abs(zeta)))$. Tanto più $zeta$ è piccolo, tanto più il modulo è grande. Per $zeta eq 0$ (poli sull'asse immaginario), il modulo tende a infinito (risonanza)

- Fase: $phi eq -90 degree$ per poli stabili, $phi eq +90 degree$ per poli instabili

*Fenomeno della Risonanza*: Se $abs(zeta) lt 1/sqrt(2) approx 0.707$, il diagramma del modulo presenta un massimo (picco di risonanza) in corrispondenza della pulsazione di risonanza $omega_r eq omega_n sqrt(1 - 2 zeta^2) lt omega_n$. Il valore massimo è $M_r eq 1/(2 abs(zeta) sqrt(1 - zeta^2)) gt M(omega_n)$

== Casi Particolari e Regole Generali
- *Zeri*: i DdB degli zeri si ottengono da quelli dei poli cambiando il segno sia ai moduli (in dB) che alle fasi (in gradi)

- *Molteplicità*: per un fattore di molteplicità $i$, i contributi di modulo e fase vanno moltiplicati per $i$

- *Singolarità*: il modulo tende a $+oo$ dB in presenza di poli sull'asse immaginario (polo in $s eq 0$ o coppia di poli in $plus.minus j omega$)

= Tracciamento dei Diagrammi di Bode di una FDT Generica
Il tracciamento dei DdB di una gerica funzione di trasferimento $G(s)$ si riconduce a una procedura sistematica:

+ *Scomposizione*: si scompone $G(s)$ nel prodotto di fattori elementari dei quattro tipi

+ *Sommatoria dei Contributi*: il modulo in dB e la fase di $G(j omega)$ sono la somma algebrica dei contributi di tutti i fattori elementari

+ *Costruzione Asintotica*: si tracciano gli asintoti di ciascun fattore e li si sommano graficamente. Partendo dalle basse frequenze, dove dominano gli eventuali poli o zeri nell'origine, si costruisce il diagramma asintotico complessivo, modificando la pendenza in corrispondenza di ogni pulsazione caratteristica $abs(lambda)$ o $omega_n$

+ *Raffinamento*: si correggono i punti di raccordo (aggiungendo o togliendo 3 dB in corrispondenza di poli/zeri reali, e modellando il picco di risonanza per i poli complessi)

In ambiente Matlab, i diagrammi di Bode si tracciano con il comando `bode(G)`