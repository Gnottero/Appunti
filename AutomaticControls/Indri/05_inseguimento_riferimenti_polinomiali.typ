#import "../../template.typ": *

#show : project.with(
  title: "Precisione in Regime Permanente",
  course: "Controlli Automatici"
)

= Introduzione: Regime Permanente e Segnali di Riferimento
== Schema di Controllo di Riferimento
Si consideri il consueto schema di controllo in retroazione. La funzione di trasferimento d'anello è $G_a (s) eq C(s) F(s)$, dove $C(s)$ rappresenta il controllore e $F(s)$ il processo (includendo attuatore e trasduttore). La funzione di trasferimento in catena chiusa è:
$ W_y (s) eq (G_a (s))/(1 + G_a (s)) $
Nell'ipotesi di retroazione unitaria ($H(s) eq 1$)

L'asintotica stabilità del sistema in catena chisua, che deve essere garantita dal controllore, assicura l'esistenza della condizione di regime permanente. La precisione con cui l'uscita $y(t)$ insegue il riferimento $y_"des" (t)$ in tale condizione è oggetto di specifica. Le specifiche vengono formulate rispetto al valore massimo in regime permanente dell'*errore di inseguimento*:
$ e(t) eq y_"des" (t) - y(t) $

== Famiglie di Segnali Canonici
Le famiglie di segnali canonici di riferimento di maggiore interesse pratico sono i *segnali polinomiali* e i *segnali sinusoidali*. I segnali polinomiali sono definiti come:
$ r(t) eq (t^k)/(k!) epsilon(t), space.en space.en space.en k eq 0, 1, 2, dots $
Da cui $y_"des" (t) eq K_r dot r(t)$, dove $K_r$ è un fattore di scala che assegna l'ampiezza desiderata

IL Significato fisico dei prime tre gradi è immediato:
- $k eq 0$: $r(t) eq epsilon(t)$ (gradino). Corrisponde a imporre una posizione desiderata costante

- $k eq 1$: $r(t) eq t$ (rampa). Corrisponde a imporre una velocità desiderata costante

- $k eq 2$: $r(t) eq (t^2)/(2)$ (parabola). Corrisponde a imporre un'accelerazione desiderata costante

In ambito robotico, un tipico profilo di posizione per spostare un braccio da una posizione iniziale a una finale è il profilo *2-1-2* (accelerazione costante, velocità costante, decelerazione costante). Questo genera un profilo di velocità trapezoidale e un profilo di accelerazione a gradini. Tale profilo rispetta i vincoli di velocità e accelerazione massime consentite dagli attuatori

= Strumenti per l'Analisi della Precisione a Regime
== Tipo di Sistema
Un sistema chiuso in retroazione si dice di tipo *tipo $h$* se la funzione di trasferimento d'anello $G_a (s)$, supposta in forma minima e priva di zeri in $s eq 0$, presenta un polo di molteplicità $h$ nell'origine:
$ G_a (s) eq K_G/s^h dot G_a^' (s), space.en space.en space.en "con " G_a^' (0) eq 1 $
Il tipo $h$ rappresenta il numero di integratori presenti nel ramo d'anello

== Guadagno Stazionario della Funzione d'Anello
Il *guadagno stazionario* $K_G_a$ della funzione d'anello è definito come:
$ K_G_a eq lim_(s arrow.r 0) s^h dot G_a (s) $
A seconda del tipo di sistema, assume nomi specifici:
- *Tipo 0*: $K_G_a eq G_a (0)$, detto guadagno di posizione

- *Tipo 1*: $K_G_a eq lim_(s arrow.r 0) s dot G_a (s)$, detto guadagno di velocità

- *Tipo 2*: $K_G_a eq lim_(s arrow.r 0) s^2 dot G_a (s)$, detto guadagno di accelerazione

Il guadagno stazionario quantifica il guadagno della funzione d'anello a bassa frequenza. Ad esempio, per:
$ G_a (s) eq 200 (s + 0.1)/(s(s^2 + 0.2s + 1)(s + 10)) $
Si ha:
$ K_G_a eq lim_(s arrow.r 0) s dot G_a (s) eq 2 $
Ovvero un guadagno di velocità

== Funzione di Trasferimento d'Errore
La funzione di trasferimento tra il riferimento $y_"des"$ e l'errore di inseguimento $e$ è:
$ W_(e, y) (s) eq (e(s))/(y_"des" (s)) eq 1/(1 + G_a (s)) $
Essa lega il riferimento all'errore e gioca un ruolo centrale nell'analkisi della precisione a regime

$ W_e (s) eq e(s)/r(s) eq K_r/(1 + G_a (s) ) $

== Teorema del Valore Finale
Sotto l'ipotesi che il sistema in catena chiusa sia asintoticamente stabile (condizione indispensabile per l'esistenza del regime permanente), l'errore a regime si calcola mediante il *teorema del valore finale*:
$ e_oo eq lim_(t arrow.r oo) e(t) eq lim_(s arrow.r 0) s dot e(s) eq lim_(s arrow.r 0) s dot W_e (s) dot K_r/s^(k + 1) $

$ e(s) eq W_e (s) r(s) $

Dove si è utilizzato $y_"des" (s) eq K_r/s^(k + 1)$ per un riferimento polinomiale di grado $k$

= Errori a Regime
Applicando il teorema del valore finale ai diversi casi di tipo di sistema e grado del riferimento, si perviene ai seguenti risultati:

#align(
  center,
  table(
    columns: (auto, auto, auto, auto),
    align: center,
    inset: 0% + 0.8em,
    table.header[Sistema][Riferimento: $epsilon (t)$][Riferimento: $t$][Riferimento: $t^2/2$],
    [Tipo 0], [$e_oo eq K_r/(1 + K_G_a)$], [$e_oo eq oo$], [$e_oo eq oo$],
    [Tipo 1], [$e_oo eq 0$], [$e_oo eq K_r/K_G_a$], [$e_oo eq oo$],
    [Tipo 2], [$e_oo eq 0$], [$e_oo eq 0$], [$e_oo eq K_r/K_G_a$],
  )
)

Dall'analisi della tabella si traggono le seguenti conclusioni fondamentali

== Errore Finito non Nullo
Dato un riferimento polinomiale di grado $k$, un sistema di tipo $h eq k$ garantisce un errore di inseguimento *finito e non nullo*. L'errore è inversamente proporzionale al guadagno stazionario $K_G_a$: può essere ridotto aumentano opportunamento $K_G_a$, ma non annullato

== Errore Nullo
Un sistema di tipo $h gt k$ garantisce errore di inseguimento *nullo* in regime permanente per riferimenti polinomiali di grado $k lt h$. In questo caso, il valore di $K_G_a$ è ininfluente sull'errore a regime (che è comunque zero)

== Errore Divergente
Un sistema di tipo $h lt k$ *non è in grado di inseguire* un riferimento polinomiale di grado $k gt h$: l'errore di inseguimento in regime permanente *diverge* all'infinito

== Sistemi con Zeri in $s eq 0$
Se la funzione d'anello $G_a (s)$ presenta (almeno) uno zero in $s eq 0$, il sistema è certamente di tipo 0 (non può avere poli in $s eq 0$ per l'ipotesi di forma minima) e il guadagno stazionario $K_G_a$ è nullo. Per un riferimento a gradino, l'errore a regime risulta $e_oo eq K_r$: l'uscita del sistema in catena chiusa tende a zero, indipendentemente dal riferimento applicato. Il sistema è incapace di inseguire qualsiasi riferimento costante

= Implicazioni sul Progetto del Controllore
Le specifiche di precisione sull'errore di inseguimento in regime permanente a riferimenti polinomiali impongono vincoli diretti sulla struttura e sul guadagno del controllore $C(s)$

== Vincoli sul Numero di Poli in $s eq 0$ (Tipo)
Poichè $G_a (s) eq C(s) dot F(s)$, il tipo $h$ del sistema è la somma dei poli in $s eq 0$ del controlore e del processo. Sia $n_(0, F)$ il numero di poli in $s eq 0$ di $F(s)$ (noto) e $n_(0, C)$ quello di $C(s)$ (da progettare)
- Per garantire errore *finito* a un riferimento di grado $k$: $G_a (s)$ deve essere di tipo $h eq k$. Se $n_(0, F) lt k$, si deve introdurre $n_(0, C) eq k - n_(0, F)$ poli nell'origine nel controllore

- Per garantire errore *null* a un riferimento di grado $k$: $G_a (s)$ deve essere di tipo $h gt.eq k + 1$. Se $n_(0, F) lt k + 1$, si deve introdurre $n_(0, C) eq k + 1 - n_(0, F)$ poli nell'origine

Se $n_(0, F)$ è gia sufficiente a garantire il tipo richiesto, non è necessario introdurre ulteriori integratori in $C(s)$

== Vincoli sul Guadagno Stazionario
Una specifica sull'errore massimo accettabile a regime, $e_oo lt.eq e_max$, si traduce in un vincolo sul guadagno stazionario minimo della funzione d'anello solo se, dopo aver fissato il tipo, $G_a (s)$ risulta di tipo $h eq k$ (caso di errore finito non nullo). In tal caso:
$ e_oo eq K_r/K_G_a lt.eq e_max arrow.r.double.long K_G_a gt.eq K_r/e_max $
Poichè $K_G_a eq K_C dot K_F$ (prodotto dei guadagni stazionari di controllore e processo), si ottiene un vincolo sul guadagno minimo del controllore:
$ K_C gt.eq K_r/(K_F dot e_max) $