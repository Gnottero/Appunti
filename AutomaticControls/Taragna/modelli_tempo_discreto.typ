#import "../../template.typ": *

#show : project.with(
  title: "Modellistica dei Sistemi Dinamici a Tempo Discreto",
  course: "Controlli Automatici"
)

= Introduzione
I sistemi dinamici a tempo discreto sono sistemi in cui tutte le grandezze variabili sono funzioni della variabile indipendente temporale $k$ che è intera.

I sistemi dinamici a tempo discreto sono descritti dalle seguenti *equazioni di stato* ed *equazioni d'uscita*:
$ x_i (k + 1) eq f_i (k, x(k), u(k)) $
$ y_l (k) eq g_l (k, x(k), u(k)) $

= Sistemi dinamici a tempo discreto
== Proprietà dei modelli a classi di età
I *modelli a classi di età* sono utilizzati per studiare l'evoluzione temporale di determinate "classi di popolazione" in periodi di tempo fissati.

In questi sistemi, la componente i-esima dello stato $x_i (k)$ rappresenta la numerosità della popolazione della classe $i$ nel periodo $k$ considerato

L'evoluzione di ogni classe considerata dal periodo $k$ al successivo periodo $k + 1$ avviene tenendo conto:
- *Del tasso di mortalità* ($0 lt.eq gamma_i lt.eq 1$)

- *Del tasso di sopravvivenza* ($0 lt.eq 1 - gamma_i lt.eq 1 $)

== Classificazione
- *Lineare*: se $f$ e $g$ sono funzioni lineari in $x$ e $u$ (con eventuali termini noti)

- *Tempo invariante (stazionario)*: se $f$ e $g$ non dipendono esplicitamente da $k$

- *Proprio*: se l'uscita $y(k)$ dipende solo da $x(k)$ e $u(k)$ (nessuna dipendenza diretta da ingressi futuri)

= Forma lineare tempo invariante (LTI)
Nel caso più comune (sistemi lineari, tempo invarianti, a dimensione finita):
$ cases(
  x(k + 1) eq A x(k) + B u(k),
  y(k) eq C x(k) + D u(k)
) $

Dove $A$ ($n times n$), $B$ ($n times m$), $C$ ($p times n$), D ($p times m$)  sono matrici costanti

Questa rappresentazione è analoga a quella del tempo continuo, ma con l'operatore di *anticipo* (spostamento in avanti) al posto della derivata

= Soluzione dell'equazione di stato LTI
Per $k gt.eq k_0$:
$ x(k) eq A^(k - k_0) x(k_0) + sum_(j eq k_0)^(k - 1) A^(k - 1 - j) B u(j) $

che ricorda la formula di Lagrange del tempo continuo, con $e^A(t - t_0)$ sostituita da $A^(k - k_0)$

= Stabilità
Per sistemi LTI a tempo discreto:
- Asintoticamente stabile se tutti gli autovalori di $A$ hanno modulo $lt 1$

- Stabile (semplice) se $abs(lambda) lt.eq 1$ e gli autovalori con $abs(lambda) eq 1$ sono semplici (molteplicità geometrica $eq$ algebrica)

- Instabile se esiste un autovalore con $abs(lambda) gt 1$

= Struttura generale di un sistema a dati campionati
Qui viene descritto il seguente schema:
+ *Ingresso discreto* $u(k)$

+ *Convertitore D/A* (Digitale $arrow.r$ analogico)
  - Ricostruisce un segnale continuo $u(t)$ a partire da $u(k)$

  - Nel caso più semplice: mantenitore di ordine zero $("ZOH") arrow.r u(t)$ costante tra un campione e il successivo

+ *Sistema dinamico a tempo continuo* (descritto da equazioni differenziali)

+ *Uscita continua* $y(t)$

+ *Convertitore A/D* (Analogico $arrow.r$ Digitale)
  - Campiona $y(t)$ a intervalli regolari $T_s arrow.r y(k)$

L'obiettivo è *trovare un modello discreto equivalente* che leghi direttamente $u(k)$ a $y(k)$

= Discretizzazione
La discretizzazione di un sistema a tempo continuo corrisponde a studiare l'evoluzione degli stati valutati negli istanti di campionamento

Nel processo di discretizzazione partiamo dalle matrici $A$, $B$, $C$, $D$ del sistema a tempo continuo per arrivare a trovare la matrici $A_d$, $B_d$, $C_d$, $D_d$ di un sistema a tempo discreto

$ cases(
  x(t) eq A x(t) + B u(t),
  y(t) eq C x(t) + D u(t)
) space.en space.en space.en arrow.r space.en space.en space.en cases(
  x(k) eq A_d x(k) + B_d u(k),
  y(k) eq C_d x(k) + D_d u(k)
) $

con $k eq i dot T_s$

Si ipotizza che l'ingresso $u(t)$ sia costante tra un istante di campionamento e l'altro
$ u(tau) eq "costante" eq u(i dot T_s) space.en space.en space.en "per" space.en space.en space.en i dot T_s lt.eq tau lt.eq (i + 1) dot T_s $

Si consideri la formula di Lagrange:
$ x(t) eq e^(A(t- t_0)) x(t_0) + integral_(t_0)^(t) e^(A(t - tau)) B u(tau) d tau $

- $t_0 eq i dot T_s eq k$

- $t eq (i + 1) dot T_s eq k + 1$

- $x(t_0) eq x(i dot T_s) eq x(k)$

Si ottiene:
$ x(k + 1) eq e^(A T_s) x(k) + (integral_0^T_s e^(A(T_s - tau)) d tau) B u(k) $

Quindi:
$ A_d eq eq e^(A T_s) $ 
$ B_D eq B (integral_0^T_s e^(A(T_s - tau)) d tau) $

Poichè il legame con l'uscita dello stato e l'ingresso è di tipo statico, si ha:
$ C_d eq C $
$ D_d eq D $