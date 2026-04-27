#import "../../template.typ": *

#show : project.with(
  title: "Criteri di Stabilità per Sistemi Dinamici LTI",
  course: "Controlli Automatici"
)

= Introduzione ai Criteri di Stabilità
Per un sistema LTI a tempo continuo, la stabilià asintotica richiede che tutti gli autovalori della matrice $A$ (radici del polinomio caratteristico $p(lambda) eq det(lambda I - A)$) abbiano parte reale negativa. Per un sistema a tempo discreto, richiede che tutti gli autovalori abbiano modulo minore di $1$

Il calcolo diretto delle radici è oneroso o impossibile (polinomi di grado elevato, presenza di parametri). I criteri seguenti permettono di giudicare la stabilità senza calcolare le radici

= Regola dei Segni di Cartesio
== Enunciato
Dato un polinomio a coefficienti reali:
$ p(lambda) eq a_n lambda^n + a_(n - 1) lambda^(n - 1) + dots + a_1 lambda + a_0 $

Il numero di radici reali *positive* (contate con la loro molteplicità) è uguale al numero $v$ di *variazioni di segno* tra coefficienti consecutivi non nulli, oppure è inferiore a $v$ per un multiplo intero di $2$

*Corollario*: Il numero di radici reali *negative* si ottiene applicando la regola al polinomio $p(- lambda)$

== Condizione necessaria per stabilità (parte reale negativa)
Affinchè *tutte* le radici di $p(lambda)$ abbiano parte reale negativa, è *necessario* (ma non sufficiente) che *non ci siano variazioni di segno* tra i coefficienti, cioè tutti i coefficienti devono essere dello stesso segno (tutti positivi o tutti negativi)

Per polinomi di grado $n eq 2$:
$ p(lambda) eq a_2 lambda^2 + a_1 lambda + a_0 $

la condizione $a_2, a_1, a_0$ concordi è anche *sufficiente* per avere radici a parte reale negativa

= Criterio di Routh-Hurwitz (Tempo Continuo)
== Condizione necessaria (premessa)
Se tutti i coefficienti di $p(lambda)$ sono concordi (condizione necessaria) si può procedere con la tabella di Routh

== Costruzione della tabella di Routh
Per un polinomio di grado $n$:
$ p(lambda) eq a_n lambda^n + a_(n - 1) lambda^(n - 1) + a_(n - 2) lambda^(n - 2) + dots + a_1 lambda + a_0 $

con $a_n gt 0$ (altrimenti si moltiplica per $- 1$)

La tabella ha $n + 1$ righe (da $n$ a $0$). Le prime due righe sono
#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  inset: 10pt,
  align: horizon,
  table.header([*Riga*], [*$lambda^n$*], [*$lambda^(n - 2)$*], [*$lambda^(n - 4)$*], [*$dots$*]),
  $n$, $a_n$, $a_(n - 2)$, $a_(n - 4)$, $dots$,
  $n - 1$, $a_(n - 1)$, $a_(n - 3)$, $a_(n - 5)$, $dots$
)

Le righe successive si calcolano con determinanti:
$ b_(n-2) eq - 1/a_(n - 1) mat(delim: "|", a_n, a_(n - 2); a_(n - 1), a_(n - 3)) space.en space.en space.en b_(n-4) eq - 1/a_(n - 1) mat(delim: "|", a_n, a_(n - 4); a_(n - 1), a_(n - 5)) $
$ c_(n - 3) eq - 1/b_(n - 2) mat(delim: "|", a_(n - 1), a_(n - 3); b_(n - 2), b_(n - 4)) space.en space.en space.en c_(n - 5) eq - 1/b_(n - 2) mat(delim: "|", a_(n - 1), a_(n - 5); b_(n - 2), b_(n - 6)) $

Il processo continua fino a ottenere una riga con un solo elemento (il termine noto $a_0$)

== Criterio di Routh-Hurwitz
*Condizione necessaria e sufficiente* per avere tutte le radici con parte reale negativa è che *tutti gli elementi della prima colonna* della tabella di Routh siano *concordi* (tutti positivi se $a_n gt 0$)

== Corollario (numero di radici a parte reale positiva)
Se la tabella può essere completata (nessun elemento della prima colonna è nullo), allora il numero di radici con parte reale positiva è uguale al numero di *variazioni di segno* nella prima colonna

= Criterio di Jury (Tempo Discreto)
Per sistemi a tempo discreto, la stabilità asintotica richiede che tutte le radici del polinomio caratteristico $p(lambda)$ (con coefficienti reali) abbiano modulo minore di 1

== Condizioni preliminari (necessarie)
Per un polinomio di grado $n$:
$ p(lambda) eq a_n lambda^n + a_(n - 1) lambda^(n - 1) + dots + a_1 lambda + a_0 $

Devono essere soddisfatte tre condizioni:
+ $p(1) gt 0$

+ $(-1)^n p(-1) gt 0$

+ $abs(a_n) gt abs(a_0)$

Queste condizioni sono necessarie, ma non sufficienti, per $n gt 2$

== Tabella di Jury
Si costruisce una tabella con $2n - 3$ righe (in pratica, $n - 1$ coppie di righe). La prima riga contiene i coefficienti in ordine crescente: $a_0$, $a_1$, $dots$, $a_n$

La seconda riga contiene gli stessi coefficienti in ordine inverso: $a_n$, $a_(n - 1)$, $dots$, $a_0$

Le righe successive si ottengo calcolando i determinanti:
$ b_k eq mat(delim: "|", a_0, a_(n - k); a_n, a_k) eq a_0 a_k - a_n a_(n - k), space.en space.en space.en k eq 0, 1, dots, n - 1 $

(per $k eq 0$ sia ha $b_0 eq a_0^2 - a_n^2$, ma spesso si usa la formula con determinante $2 times 2$)

In pratica, per la terza riga si calcolano $b_0$, $b_1$, $dots$, $b_(n - 1)$ ($n$ elementi). La quarta riga è la stessa sequenza in ordine inverso. Poi si ripete il processo con le righe successive

== Condizioni di Jury
Oltre alle tre condizioni iniziali, per la stabilità asintotica (tutte le radici con $abs(lambda) lt 1$) è necessario e sufficiente che siano soddisfatte le seguenti $n - 2$ disuguaglianze:
$ abs(b_0) gt abs(b_(n - 1)) space.en space.en space.en abs(c_0) gt abs(c_(n - 2)), space.en space.en space.en dots $

Dovwe $b_0$, $b_(n - 1)$ sono gli elementi della prima e ultima colonna della terza riga (dopo la prima coppia) e così via