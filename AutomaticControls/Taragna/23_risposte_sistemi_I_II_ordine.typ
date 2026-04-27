#import "../../template.typ": *

#show: project.with(
  title: "Risposte ai Sistemi del I e II ordine",
  course: "Controlli Automatici",
)

= Introduzione
== Perchè studiare la risposta al gradino?
Lo studio della risposta al gradino per sistemi LTI esternamente stabili (cioè con tutti i poli a parte reale negativa) è motivato da due ragioni principali:
+ *Analisi del transitorio*: Permette di studiare il comportamento del sistema nella transizione tra due situazioni di equilibrio (ad esempio, l'accensione di un sistema o una variazione a gradino del riferimento)

+ *Identificazione sperimentale*: In molti casi, a partire dal rilievo sperimentale della risposta al gradino, è possibile determinare la funzione di trasferimento del sistema

== Contesto e ipotesi
- Consideriamo solo sistemi *a tempo continuo (TC)*

- Faremo riferimento alla descrizione mediante *funzione di trasferimento*:
$ H(s) eq (N_H (s))/(D_H (s)) $
$space.en space.en$ Dove $N_H (s)$ e $D_H (s)$ sono polinomi senza radici in comune

- Concentreremo l'attenzione su:
  - *Sistemi del I ordine*: $D_H (s)$ polinomio di primo grado

  - *Sistemi del II ordine*: $D_H (s)$ polinomio di secondo grado
  Con poli a parte reale strettamente negativa

- Studieremo il caso di *sistemi elementari*, cioè con $N_H (s)$ di grado zero (polinomio costante). In altre parole, la funzione di trasferimento è priva di zeri

= Risposta al Gradino di Sistemi del I Ordine
== Forma della funzione di trasferimento
La funzione di trasferimento di un sistema elementare del primo ordine può essere espressa come:
$ H(s) eq (K^*)/(s - p) $
Dove $K^*$ è il guadagno e $p$ è il polo

Poichè il sistema è esternamente stabile, il polo deve avere parte reale negativa: $ p lt 0 $

Introduciamo le seguenti definizioni:
$ tau eq abs(1/p) eq 1/abs(p), space.en space.en space.en K eq - (K^*)/p $

La funzione di trasferimento assume la forma canonica:
$ H(s) eq K/(1 + tau s) $
Dove:
- K è il *guadagno statico* (valore della risposta a regime per ingresso costante unitario)

- $tau$ è la *costante di tempo* (esprime la velocità di risposta del sistema)

== Calcolo della risposta al gradino
Applichiamo un ingresso a grandino di ampiezza $dash(u)$:
$ u(t) eq dash(u) dot epsilon(t) space.en space.en space.en arrow.r.double space.en space.en space.en U(s) eq dash(u)/s $

La risposta in trasformata è:
$ Y(s) eq H(s)U(s) eq K/(1 + tau s) dot dash(u)/s $

Antitrasformando (si può procedere per scomposizione in fratti semplici), si ottiene:
$ y(t) eq dash(u) K (1 - e^(-t/tau)), space.en space.en space.en t gt.eq 0 $

== Parametri caratteristici della risposta
=== Valore a regime $y_infinity$
È il valore a cui tende la risposta a $t arrow.r infinity$:
$ y_infinity eq lim_(t arrow.r infinity) y(t) eq dash(u)K $

In alternativa, applicando il teorema del valore finale:
$ y_infinity eq lim_(s arrow.r 0) s Y(s) eq lim_(s arrow.r 0) s dot K/(1 + tau s) dot dash(u)/s eq dash(u)K $

=== Costante di tempo $tau$
Dalla soluzione $y(t) eq dash(u)K (1 - e^(-t/tau))$, si osserva che:

- Per $t eq tau$:
$ y(tau) eq dash(u)K (1 - e^(-1)) approx dash(u)K dot 0.632 eq 0.632 y_infinity $

- Per $t eq 3 tau$:
$ y(3 tau) approx 0.95 y_infinity $

- Per $t eq 4 tau$:
$ y(4 tau) approx 0.98 y_infinity $

- Per $t eq 5 tau$:
$ y(5 tau) approx 0.993 y_infinity $

La costante di tempo $tau$ rappresenta, quindi, la *velocità di risposta*: minore è $tau$, più veloce è il transitorio

=== Tempo di salita $t_r$ ($10% - 90%$)
È il tempo necessario affinchè la risposta passi per la prima volta dal $10%$ al $90%$ del valore di regime

Per un sistema del I ordine, si ricava:
$ t_r approx 2.2 tau $

=== Tempo di assestamento
È il tempo necessario affinchè la risposta entri definitivamente in una fascia di tolleranza $plus.minus epsilon %$ attorno al valore di regime

Per un sistema del I ordine:
$
  t_(a, 5%) approx 3 tau space.en space.en space.en t_(a, 2%) approx 4 tau space.en space.en space.en t_(a, 1%) approx 4.6 tau
$

=== Nota
Dopo che è trascorso un tempo pari alla costante di tempo $tau$, la risposta del sistema raggiunge il $63%$ circa del valore a regime $y_infinity$

= Determinazione di un Modello del I Ordine dalla Risposta Sperimentale
Dato un rilievo sperimentale della risposta al gradino unitario ($dash(u) eq 1$) è possibile determinare i parametri $K$ e $tau$

== Determinazione del guadagno $K$
Il valore a regime $y_infinity$ si legge direttamente dal grafico. Poichè $dash(u) eq 1$:
$ K eq y_infinity $

== Determinazione della costante di tempo $tau$
Esistono due metodi:
+ *Metodo del $63%$*: Si individua l'istante $t$ in cui $y(t) eq 0.632 y_infinity$. Tale istante corrisponde a $tau$

+ *Metodo della tangente all'origine*: Si traccia la tangente alla curva nell'origine. Questa interseca l'asintoto orizzontale $y eq y_infinity$ nell'istante $t eq tau$

= Risposta al Gradino di Sistemi del II Ordine
== Forma della funzione di trasferimento
Consideriamo sistemi elementari del secondo ordine con funzione di trasferimento in forma canonica:
$ H(s) eq K (omega_n^2)/(s^2 + 2 zeta omega_n s + omega_n^2) $

Dove:
- $K$: *guadagno statico*

- $omega_n gt 0$: *pulsazione naturale* (frequenza propria non smorzata)

- $0 lt zeta lt 1$: *coefficiente di smorzamento* (adimensionale)

Il denominatore può essere riscritto come:
$ s^2 + 2 zeta omega_n s + omega_n^2 eq (s + zeta omega_n)^2 + omega_n^2 (1 - zeta^2) $

I poli del sistema sono:
$ s_(1, 2) eq - zeta omega_n plus.minus j omega_n sqrt(1 - zeta^2) $

== Classificazione in base a $zeta$
#table(
  columns: (1fr, 2fr, 2fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header([*Condizione*], [*Tipo di sistema*], [*Poli*], [*Comportamento*]),
  $ zeta gt 1 $,
  "Sovrasmorzato",
  "Reali, distinti, negativi",
  "Transitorio aperiodico (lento)",

  $ zeta eq 1 $,
  "Smorzamento critico",
  "Reali, coincidenti, negativi",
  "Transitorio aperiodico (il più veloce senza oscillazioni)",

  $ 0 lt zeta lt 1 $,
  "Sottosmorzato",
  "Complessi coniugati a parte reale negativa",
  "Transitorio oscillatorio smorzato",

  $ zeta eq 0 $,
  "Non smorzato",
  "Immaginari puri",
  "Oscillazioni persistenti (marginalmente stabile)"
)

Nel seguito, ci concentreremo sul caso *sottosmorzato* $0 lt zeta lt 1$, che presenta il maggior interesse applicativo

= Risposta al Gradino per Sistemi Sottosmorzati ($0 lt zeta lt 1$)
== Espansione analitica
Applicando un gradino di ampiezza $dash(u)$, la risposta in trasformata è:
$ Y(s) eq H(s)U(s) eq K (omega_n ^ 2)/(s^2 + 2 zeta omega_n s + omega_n ^ 2) dot dash(u)/s $

Antitrasformando, si ottiene:
$ y(t) eq dash(u)K [1 - (e^(-zeta omega_n t))/(sqrt(1 - zeta^2)) sin(omega_n sqrt(1 - zeta^2)t) + arccos(zeta)], space.en space.en space.en t gt.eq 0 $

== Parametri caratteristici
=== Valore a regime $y_infinity$
Come per il primo ordine:
$ y_infinity eq dash(u) K $

=== Valore di picco $y_max$
È il valore istantaneo massimo della risposta $y(t)$:
$ y_max eq max_t y(t) $

=== Sovraelongazione massima $hat(S)$
Definizione:
$ hat(S) eq (y_max - y_infinity)/(y_infinity) $

Spesso espressa in percentuale $hat(S)_% eq 100 dot hat(S)$. È il rapporto tra il massimo scostamento in ampiezza della risposta rispetto al valore di regime e il valore di regime

La sovraelongazione massima dipende *solo* dal coefficiente di smorzamento $zeta$:
$ hat(S) eq e^(- (pi zeta)/sqrt(1 - zeta^2)) $

Inversamente, noto $hat(S)$, si può ricavare $zeta$:
$ zeta eq (abs(ln(hat(S))))/(sqrt(pi^2 + ln^2(hat(S)))) $

=== Tempo di picco $hat(t)$
È l'istante in cui si raggiunge il valore di picco:
$ y(hat(t)) eq y_max $

Il tempo di picco $hat(t)$ dipende ia dallo smorzamento $zeta$ sia dalla pulsazione naturale $omega_n$
$ hat(t) eq pi/(omega_n sqrt(1 - zeta^2)) $

=== Tempo di salita $t_s$ (prima intersezione con $y_infinity$)
È il primo istante in cui la risposta raggiunge il valore di regime:
$ t_s eq (pi - arccos(zeta))/(omega_n sqrt(1 - zeta^2)) $

Per il tempo di salita $10% - 90$, si utilizza l'approssimazione:
$ t_r approx (2.16 zeta + 0.6)/(omega_n) $

=== Tempo di assestamento $t_(a, epsilon %)$
Approssimativamente, l'inviluppo della risposta è $1 plus.minus (e^(- zeta omega_n t))/(sqrt(1 - zeta^2))$. Trascurando il termine $1/sqrt(1 - zeta^2)$ (conservativo), si ottiene:
$ t_(a, epsilon %) approx - (ln(0.01 epsilon))/(zeta omega_n) $

Per valori tipici:
- $t_(a, 5%) approx 3/(zeta omega_n)$

- $t_(a, 2%) approx 4/(zeta omega_n)$

- $t_(a, 1%) approx 4.6/(zeta omega_n)$

= Caso Critico: Smorzamento Critico ($zeta eq 1$)
Per $zeta eq 1$, i poli sono reali e coincidenti:
$ s_(1, 2) eq - omega_n eq - 1/tau, space.en space.en space.en tau eq 1/omega_n $

La funzione di trasferimento diventa:
$ H(s) eq K/(1 + tau s)^2 $

La risposta al gradino di ampiezza $dash(u)$ è:
$ y(t) eq dash(u) K [1 - e^(- t/tau) - t/tau e^(-t/tau)], space.en space.en space.en t gt.eq 0 $

*Caratteristiche*:
- *Assenza di oscillazioni* e di sovraelongazione

- Transitorio periodico con la massima velocità di risposta ottenibile senza superamento del valore di regime

- Il tempo di salita $10% - 90%$ è approssimativamente $t_r approx 3.36 tau$

= Determinazione di un Modello del II Ordine dalla Risposta Sperimentale
Dato un rilievo sperimentale della risposta al gradino unitario ($dash(u) eq 1)$ di un sistema sottosmorzato, è possibile determinare i parametri $K$, $zeta$, e $omega_n$

*Procedura*:
- *Guadagno $K$*: 
$ K eq y_infinity $

- *Coefficiente di smorzamento $zeta$*:
  - Leggere dal grafico il valore di picco $y_max$

  - Calcolare la sovraelongazione: 
$ hat(S) eq (y_max - y_infinity)/(y_infinity) $

  - Ricavare $zeta$ dalla formula inversa:
$ zeta eq (abs(ln(hat(S))))/(sqrt(pi^2 + ln^2(hat(S)))) $

- *Pulsazione naturale $omega_n$*:
  - Leggere dal grafico il tempo di picco $hat(t)$ (istante in cui si raggiunge $y_max$)

  - Utilizzare la relazione:
$ hat(t) eq pi/(omega_n sqrt(1 - zeta^2)) $