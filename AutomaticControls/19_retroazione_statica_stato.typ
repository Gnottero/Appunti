#import "../template.typ": *

#show : project.with(
  title: "Retroazione Statica dello Stato",
  course: "Controlli Automatici"
)

= Introduzione e Formulazione della Legge di Controllo
== Obiettivi del Controllo in Retroazione
Consideriamo un sistema dinamico LTI a tempo continuo, SISO (Single Input - Single Output), descritto dall'equazione di stato:
$ dot(x)(t) eq A x(t) + B u(t) $

con $x in RR^n, u in RR, A in RR^(n times n), B in RR^(n times 1)$

Il comportamento dinamico del sistema è interamente determinato dagli *autovalori della matrice $A$* (i poli del sistema). L'obiettivo del controllo in retroazione è *modificare artificialmente la dinamica* del sistema per:
+ *Rendere asintoticamente stabile* un sistema intrinsecamente instabile

+ *Migliorare le prestazioni* del transitorio (rapidità di risposta, smorzamento delle oscillazioni)

+ *Portare l'uscita* a un valore desiderato (regolazione)

== Struttura della Legge di Controllo (State Feedback)
Per agire sugli autovalori, l'ingresso $u(t)$ non può essere scelto a priori, ma deve essere una *funzione dello stato attuale* del sistema. Si adotta la seguente *legge di controllo per retroazione statica dallo stato*:
$ u(t) eq - K x(t) + alpha r (t) $

Dove:
- $K in RR^(1 times n)$ è il *vettore (o matrice) dei guadagni* di retroazione

- $r(t)$ è l'*ingresso di riferimento* esterno (il segnale che vogliamo che l'uscita insegua)

- $alpha in RR$ è un *guadagno di feedforward* (azione diretta)

Il termine $ - K x(t)$ è la *retroazione negativa*. Misurando (o stimando) lo stato $x(t)$, lo moltiplichiamo per $-K$ e lo sommiamo all'ingresso. Questo crea un "cortocircuito virtuale" che altera la matrice di stato del sistema

== Il Sistema Controllato (Sistema ad Anello Chiuso)
Sostituendo la legge di controllo nell'equazione di stato originale:
$ dot(x)(t) eq A x(t) + B[ -K x(t) + alpha r (t)] \ eq (A - B K) x(t) + B alpha r(t) $

La nuova *matrice di stato ad anello chiuso* è $A_("cl") eq A - B K$. Gli autovalori di questa matrice determinano la stabilità e la dinamica del sistema controllato

== Il Problema di Assegnazione degli Autovalori
Il problema di sintesi si formalizza come segue: "Esistono condizioni sotto le quali è possibile scegliere $K$ in modo tale che gli $n$ autovalori della matrice $A - B K$ coincidano esattamente con un insieme arbitrario di $n$ autovalori desiderati ${lambda_(1, "des"), dots, lambda_(n, "des")}$?"

= Il Teorema dell'Assegnazione degli Autovalori
== Enunciato del Teorema
Il problema di assegnazione degli autovalori mediante retroazione statica dallo stato ammette soluzione se e soltanto se il sistema dinamico LTI è *completamente raggiungibile*

In termini algebrici, la matrice dei guadagni $K$ tale per cui $lambda_i (A - B K) eq lambda_(i, "des")$ esiste se e solo se:
$ rho(M_R) eq rho(mat(delim: "[", B, A B, dots, A^(n - 1) B)) eq n $

Questo teorema, attribuito a *W.M. Wonham* per il caso MIMO, è il fondamento del controllo moderno. Esso stabilisce un legame indissolubile tra la *sintesi del controllore* (retroazione) e l'*analisi strutturale* (raggiungibilità)

- *Se il sistema è completamente raggiungibile*: L'ingresso $u$ ha "abbastanza autorità" per influenzare tutte le $n$ componenti dello stato. Possiamo, quindi, riposizionare *tutti* gli $n$ poli del sistema ovunque desideriamo nel piano complesso (purchè siano a coppie complesse coniugate)

- *Se il sistema NON è completamente raggiungibile*: Il sottospazio di raggiungibilità ha dimensione $r lt n$. La matrice $A$ può essere partizionata in una parte raggiungibile (di dimensione $r$) e una parte non raggiungibile (di dimensione $n - r$). La retroazione $u eq - K x$ può agire solo sulla parte raggiungibile. Pertanto, potremo assegnare arbitrariamente solo $r$ autovalori. I rimanenti $n - r$ autovalori (quelli della parte non raggiungibile) sono *fissi* e non possono essere modificati da alcune retroazione statica dallo stato

== Implicazioni Pratiche
+ *Prima di progettare $K$*: È imperativo calcolare il rango di $M_R$. Se $rho(M_R) lt n$, il progetto è fallito in partenza se l'obiettivo è stabilizzare modi instabili non raggiungibili

+ *Caso SISO vs MIMO*: Nel caso SISO (Single Input, $p eq 1$), la matrice $K$ è un vettore riga univocamente determinato (per un dato insieme di autovalori). Nel caso MIMO (Multi Input, $p gt 1$), $K$ è una matrice $p times n$ e la soluzione non è unica: esiste un intero sottospazio di guadagni che assegnano gli stessi autovalori. Questa ridondanza (gradi di libertà) è sfruttata per ottimizzare altre prestazioni (robustezza, minimizzazione dell'energia di controllo)

= Estensione e Formalizzazione Generale
== Estensione al Caso MIMO (Multi-Input Multi-Output)
Il teorema di assegnazione degli autovalori conserva piena validità anche nel caso di sistemi a *più ingressi* ($u(t) in RR^p$, con $p gt 1$)

In questo scenario, la legge di controllo mantiene la medesima struttura algebrica:
$ u(t) eq - K x(t) + alpha r (t) $
Tuttavia le dimensioni delle matrici coinvolte variano:
- $K in RR^(p times n)$ è la *matrice dei guadagni*

- Se il riferimento $r(t)$ ha dimensione $q$ (tipicamente pari al numero di uscite, $r(t) in RR^q$), allora $alpha in RR^(p times q)$

Nel caso MIMO, l'assegnazione degli autovalori non determina univocamente $K$. Come accennato, esistono molteplici scelte di $K$ che producono lo stesso polinomio caratteristico. Questa libertà progettuale è sfruttata per soddisfare specifiche aggiuntive, quali il disaccoppiamento dei canali o la minimizzazione di un indice di costo quadratico (Controllo LQR)

== Equazioni Ingresso-Stato-Uscita del Sistema Controllato
Consideriamo il sistema LTI completo, comprensivo dell'equazione di uscita:
$ cases(
  dot(x)(t) eq A x(t) + B u(t),
  y(t) eq C x(t) + D u(t)
) $

Sostituendo la legge di controllo $u(t) eq - K x(t) + alpha r(t)$:
*Equazione di Stato*:
$ dot(x)(t) eq A x(t) + B[- K x(t) + alpha r(t)] eq (A - B K) x(t) + B alpha r(t) $

*Equazione di Uscita*:
$ y(t) eq C x(t) + D[ - K x(t) + alpha r(t)] \ eq (C - D K) x(t) + D alpha r(t) $

Il sistema ad anello chiuso è, quindi, descritto dalla quaterna di matrici ($A - B K$, $B alpha$, $C - D K$, $D alpha$)

== Funzione di Trasferimento ad Anello Chiuso
La funzione di trasferimento tra il riferimento $r(t)$ e l'uscita $y(t)$ del sistema controllato si ottiene applicando la formula standard $H(s) eq C_"cl" (s I - A_"cl")^(-1) B_"cl" + D_"cl"$:
$ H_"cl" (s) eq [(C - D K)(s I - (A - B K))^(-1) B + D] alpha $

La matrice $K$ agisce sul *denominatore* della funzione di trasferimento (i poli), mentre la matrice $alpha$ agisce come un semplice fattore di scala sul *numeratore* (influenza il guadagno statico e gli zeri, ma non la stabilità)

== Estensione ai Sistemi a Tempo Discreto
Il teorema e la struttura della legge di controllo si estendono in modo naturale ai sistemi a *tempo discreto*:
$ x(k + 1) eq A x(t) + B u(k) $

Con legge di controllo:
$ u(k) eq - K x(k) + alpha r(k) $

Le equazioni del sistema controllato diventano:
$ x(k + 1) eq (A - B K) x(k) + B alpha r(k) $
$ y(k) eq (C - D K) x(k) + D alpha r(k) $

E la corrispondente funzione di trasferimento nel dominio $z$ è:
$ H_"cl" (z) eq [(C - D K)(z I - (A - B K))^(-1) B + D] alpha $

= Il Problema della Regolazione dell'Uscita
== Formulazione del Problema
Consideriamo il sistema LTI SISO a tempo continuo, già retroazionato staticamente dallo stato, descritto dalle equazioni:
$ dot(x)(t) eq (A - B K) x(t) + B alpha r(t) $
$ y(t) eq (C - D K) x(t) + D alpha r(t) $

Si assuma che:
+ La matrice dei guadagni $K$ sia stata progettata in modo tale che il sistema ad anello chiuso risulti *asintoticamente stabile* (ovvero $Re(lambda_i (A - B K)) lt 0, forall i$)

+ Il sistema sia *SISO* ($r(t) in RR, y(t) in RR, alpha in RR$)

+ L'ingresso di riferimento sia *costante*: $r(t) eq dash(r), forall t gt.eq 0$

L'obiettivo è determinare il valore del guadagno di feedforward $alpha$ tale che, a regime (cioè per $t arrow.r oo$), l'uscita y(t) coincida esattamente con il riferimento costante $dash(r)$:
$ lim_(t arrow.r oo) y(t) eq dash(y) eq dash(r) $

Questo è noto come *problema della regolazione dell'uscita* (o _set-point tracking_)

== Calcolo dei Valori di Equilibrio
Poichè il sistema ad anello chiuso è asintoticamente stabile, sotto l'azione dell'ingresso costante $dash(r)$, lo stato e l'uscita convergeranno a valori di equilibrio costanti, denotati rispettivamente con $dash(x)$ e $dash(y)$

All'equilibrio, la derivata dello stato è nulla: $dot(dash(x)) eq 0$. Sostituendo nelle equazioni del sistema controllato:
$ 0 eq (A - B K) dash(x) + B alpha dash(r) $
$ dash(y) eq (C - D K) dash(x) + D alpha dash(r) $

Dalla prima equazione, essendo ($A - B K$) invertibile (poichè asintoticamente stabile, nessun autovalore è nullo), si ricava lo stato di equilibrio:
$ dash(x) eq - (A - B K)^(-1) B alpha dash(r) $

Sostituendo nell'equazione di uscita:
$ dash(y) eq (C - D K) [- (A - B K)^(-1) B alpha dash(r)] + D alpha dash(r) \ eq [- (C - D K)(A - B K)^(-1) B + D] alpha dash(r) $

== Determinazione del Guadagno di Regolazione $alpha$
Imponiamo la condizione di regolazione $dash(y) eq dash(r)$. Poichè $dash(r) eq.not 0$ in generale, possiamo dividere per $dash(r)$ e ottenere:
$ [- (C - D K)(A - B K)^(-1) B + D] alpha eq 1 $

Si noti che il termine tra parentesi quadre è uno *scalare*. Denotiamolo con $H_"cl" (0)$, ovvero il guadagno statico della funzione di trasferimento ad anello chiuso (valutata per $s eq 0$) prima dell'introduzione di $alpha$. Pertanto:
$ H_"cl" (0) dot alpha eq 1 space.en space.en space.en arrow.r.double.long alpha eq 1/(H_"cl" (0)) eq [- (C - D K)(A - B K)^(-1) B + D]^(-1) $

Il guadagno $alpha$ *compensa l'attenuazione* (o amplificazione) introdotta dal sistema in catena chiusa a regime, garantendo che l'uscita insegua fedelmente il riferimento costante. Questo meccanismo è noto come *inversione del modello a regime*

== Estensione a Tempo Discreto
Per i sistemi LTI a tempo discreto, le equazioni di equilibrio sono:
$ dash(x) eq (A - B K) dash(x) + B alpha dash(r) $
$ dash(y) eq (C - D K) dash(x) + D alpha dash(r) $

Risolvendo per $dash(x)$ (nell'ipotesi che $I - (A - B K)$) sia invertibile, condizione garantita dalla stabilità asintotica che implica $abs(lambda_i (A - B K)) lt 1 arrow.r.double.long lambda_i eq.not 1$):
$ dash(x) eq [I - (A - B K)]^(-1) B alpha dash(r) $

Sostituendo nell'uscita e imponendo $dash(y) eq dash(r)$, si ottiene la condizione di regolazione per il tempo discreto:
$ alpha eq {(C - D K)[I - (A - B K)]^(-1) B + D}^(-1) $