#import "../../template.typ": *

#show : project.with(
  title: "Tipicità dei Disturbi",
  course: "Controlli Automatici"
)

= Tipicità dei Disturbi
== Definizione e Origini
Un disturbo è un segnale indesiderato che agisce sul sistema di controllo, modificandone il comportamento dinamico e alterando l'andamento dell'uscita. Le cause possono essere molteplici: rumore dei dispositivi elettronici, variazioni di carico di un braccio robotico, raffiche di vento su un'antenna radar, attrito in un sistema meccanico

== Punti di Ingresso del Disturbo
A seconda della natura fisica del fenomeno, il disturbo può entrare in punti diversi dell'anello di controllo:

- *Disturbo sull'uscita $d_y$*: agisce direttamente sulla variabile controllata (es. offset di misura, carico additivo)

- *Disturbo sul comando $d_u$*: agisce tra il controllore e l'attuatore (es. offset sull'azionamento)

- *Disturbo intermedio $d_i$*: agisce in un punto qualsiasi del ramo diretto, tra due blocchi $G_1 (s)$ e $G_2 (s)$

- *Disturbo sul riferimento $d_r$*: agisce alterando il segnale di set-point

- *Disturbo sulla retroazione $d_m$*: agisce alterando il segnale nel ramo di retroazione

== Classificazione dei Disturbi
Analogamente ai riferimenti, è di particolare interesse considerare disturbi descritti da funzioni polinomiali (tipicamente di grado zero o uno) o sinusoidali

- *Disturbo costante (grado 0)*: rappresenta un offset (es. variazione di carico a gradino)

- *Disturbo a rampa (grado 1)*: rappresenta una deriva lenta del segnale

- *Disturbo sinusoidale*: rappresenta una componente di rumore a frequenza nota

= Effetti sull'Uscita di Disturbi Polinomiali
== Metodologia di Analisi
L'analisi viene condotta isolando l'effetto di ciascun disturbo, ponendo a zero il riferimento ($y_"des" eq 0$). Per sistemi lineari, vale la sovrapposizione degli effetti: in presenza di più disturbi, l'effetto complessivo sull'uscita a regime è la somma dei singoli contributi

L'errore in inseguimento totale a regime, in presenza di un riferimento e di disturbi, è dato da:
$ e_oo eq e_(r, oo) + e_(d, oo) $
Dove $e_(d, oo) eq -y_(d, oo)$ (il disturbo che aumenta l'uscita riduce l'errore, e viceversa)

== Disturbo sull'Uscita $d_y$
Si consideri lo schema con $G_a (s) eq C(s)F(s)$ in forma minima e priva di zeri in $s eq 0$. La funzione di trasferimento tra il disturbo sull'uscita e l'uscità stessa è:
$ W_"dy" (s) eq y(s)/(d_y (s)) eq 1/(1 + G_a (s)) $

Sotto l'ipotesi di asintotica stabilità, l'effetto a regime si calcola con il teorema del valore finale:
$ y_(d y, oo) eq lim_(s arrow.r 0) s dot W_"dy" (s) dot d_y (s) $

*Disturbo costante*: $d_y (t) eq D_y space.en arrow.r.double.long space.en d_y (s) eq D_y/s$

- Se $G_a (s)$ è di *tipo 0*: $y_(d y, oo) eq D_y/(1 + K_G_a)$, effetto finito e non nullo

- Se $G_a (s)$ è di *tipo $gt.eq 1$*: $y_(d y, oo) eq 0$, il disturbo è completamente reiettato. Un sistema si dice *astatico* a un disturbo costante sull'uscita se è almeno di tipo 1

*Disturbo a rampa*: $d_y (t) eq alpha_(d y) t space.en arrow.r.double.long space.en d_y (s) eq alpha_(d y)/s^2$

- Se $G_a (s)$ è di *tipo 0*: $y_(d y, oo) eq oo$ (diverge)

- Se $G_a (s)$ è di *tipo 1*: $y_(d y, oo) eq alpha_(d y)/K_G_a$, effetto finito e non nullo

- Se $G_a (s)$ è di *tipo $gt.eq 2$*: $y_(d y, oo) eq 0$

== Disturbo Intermedio sul Ramo Diretto $d_i$
Si consideri un disturbo che entra tra due blocchi $G_1 (s)$ e $G_2 (s)$, con $G_a (s) eq G_1 (s) G_2 (s)$. La funzione di trasferimento disturbo-uscita è:
$ W_(d i)(s) eq (G_2(s))/(1 + G_1(s)G_2(s)) eq (G_2(s))/(1 + G_a(s)) $

*Regola mnemonica fondamentale*: l'effetto del disturbo dipende dal tipo e dal guadagno dei soli blocchi *a monte* del punto di ingresso, ovvero da $G_1(s)$

*Disturbo costante*: $d_i (t) eq D_i$
- Se $G_1(s)$ e $G_2(s)$ sono entrambe di tipo 0: $y_(d i, oo) eq (D_i K_G_2)/(1 + K_G_1 K_G_2)$, effetto finito

- Se $G_1(s)$ è almeno di *tipo 1*: $y_(d i, oo) eq 0$, reiezione totale. *È sufficiente un polo in $s eq 0$ a monte del disturbo*

*Disturbo a rampa*: $d_i (t) eq alpha_(d i) t$
- Se $G_1(s)$ è di tipo 0: $y_(d i, oo) eq oo$

- Se $G_1(s)$ è di tipo 1: $y_(d i, oo) eq alpha_(d i)/K_G_1$

- Se $G_1(s)$ è di tipo $gt.eq 2$: $y_(d i, oo) eq 0$

= Implicazioni sul Progetto del Controllore
Le specifiche sulla reiezione di disturbi polinomiali impongono vincoli sul controllore $C(s)$

== Vincoli sul Numero di Poli in $s eq 0$ (Tipo)
Per *reiettare completamente* un disturbo polinomiale di grado $h$, la funzione di trasferimento $G_1(s)$ a monte del punto di ingresso del disturbo deve avere almeno $h + 1$ poli in $s eq 0$. Se il disturbo è sull'uascita, $G_1(s) eq G_a (s)$. Se il controllore è l'unico elemento a monte, dovrà fornire i poli necessari

Per ottenere un effetto *finito e non nullo* (attenuato ma non annullato), $G_1(s)$ deve avere esattamente $h$ poli in $s eq 0$. In particolare:
- Un *disturbo costante* produce sempre effetto finito se $G_1(s)$ è di tipo 0, ovvero non richiede mai l'introduzione di poli in $s eq 0$ nel controllore per la sola specifica di attenuazione

- Un *disturbo a rampa* produce effetto finito solo se $G_1(s)$ è almeno di tipo 1, ovvero può richiedere un polo in $s eq 0$ nel controllore

== Vincoli sul Guadagno Stazionario
Se, dopo aver fissato il tipo, $G_1(s)$ risulta di tipo $h$ (effetto finito non nullo), una specifica sull'effetto massimo accettabile $y_(d, oo) lt.eq y_(d, max)$ impone un vincolo sul guadagno stazionario $K_G_1$:
$ y_(d, oo) eq alpha_d/K_G_1 lt.eq y_(d, max) arrow.r.double.long K_G_1 gt.eq alpha_d/y_(d, max) $

Poichè $K_G_1$ è proporzionale al guadagno del controllore $K_C$, si ottiene un vincolo sul guadagno minimo di $C(s)$

Se, invece, $G_1(s)$ ha almeno $h + 1$ poli in $s eq 0$, l'effetto del disturbo è nullo e *non* si hanno vincoli sul guadagno del controllore