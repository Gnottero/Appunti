#import "../template.typ": *

#show : project.with(
  title: "Osservabilità e Rilevabilità",
  course: "Controlli Automatici"
)

= Introduzione e Definizioni Fondamentali
== Collocazione del Problema
Le proprietà di *osservabilità* e *rilevabilità* descrivono le possibilità di stimare lo stato del sistema $x(dot)$ tramite la misura del movimento dell'uscita $y(dot)$ e dell'ingresso $u(dot)$

La proprietà di *osservabilità* descrive la possibilità di stimare lo stato iniziale del sistema mediante la misura dell'uscita $y(dot)$ e dell'ingresso $u(dot)$ su un dato intervallo di tempo

La proprità di *rilevabilità* descrive la possibilità di stimare lo stato finale del sistema mediante la misura dell'uscita $y(dot)$ e dell'ingresso $u(dot)$ su un dato intervallo di tempo

== Definizione di Non Osservabilità
Per definire l'osservabilità, è conveniente partire dal concetto complementare di stato *non osservabile*

=== Definizione (Stato Non Osservabile)
Uno stato $x^* eq.not 0$ si dice *non osservabile* nell'intervallo $[t_0, t^*]$ se, assumendo ingresso nullo $u(t)$ (studio del movimento libero), il movimento dell'uscita $y_cal(l)(t)$ generato dalla condizione iniziale $x(t_0) eq x^*$ è identicamente nullo per ogni $t in [t_0, t^*]$:
$ y_cal(l)(t) eq C e^(A(t - t_0)) x^* eq 0, space.en forall t in [t_0, t^*] $

In altre parole, lo stato iniziale $x^*$ è "invisibile" dall'uscita: non produce alcuna traccia misurabile

=== Definizione (Sottospazio di Non Osservabilità $X_"NO"$)
L'insieme di tutti gli stati non osservabili costituisce un sottospazio vettoriale dello spazio di stato, denotato con $X_"NO" (t^*)$. Il *Sottospazio di Non Osservabilità* del sistema è definito come l'intersezione (minimo) di tali insiemi al variare del tempo:
$ X_"NO" eq min_(t in [t_0, oo)) X_"NO" (t) $

=== Definzione (Sottospazio di Osservabilità $X_"O"$)
Il *Sottospazio di Osservabilità* è il complemento ortogonale del sottospazio di non osservabilità:
$ X_"O" eq X_"NO"^tack.t.short $
Un sistema si dice *Completamente Osservabile* se e solo se 
$ X_"O" eq X $
Dove:
$ X_"O" inter X_"NO" eq emptyset space.en space.en space.en e space.en space.en space.en X_"O" + X_"NO" eq X $

== Definizione di Rilevabilità
La Rilevabilità è il concetto duale della controllabilità, ma proiettato nel futuro

=== Definizione (Stato Non Rilevabile)
Uno stato $x^* eq.not 0$ si dice *non rilevabile* se, partendo da una condizione iniziale qualsiasi e giungendo allo stato finale $x(t^*) eq x^§$, il movimento libero dell'uscita è nullo. In termini pratici: la componente $x^*$ dello stato, sebbene presente alla fine, non ha influenzato l'uscita durante l'evoluzione. Pertanto, non possiamo accorgerci della sua presenza "a posteriori"

=== Definizione (Sottospazio di Non Rilevabilità $X_"ND"$)
Si definisce il *sottospazio di non rilevabilità* $X_"ND"$ come l'insieme di non rilevabilità $X_"ND" (t)$ di dimensione minima:
$ X_"ND" eq min_(t in [t_0, oo)) X_"ND" (t) $

=== Definizione (Sottospazio di Rilevabilità $X_"D"$)
Si definisce il *sottospazio di rilevabilità* $X_"D"$ come il complemento ortogonale di $X_"ND"$:
$ X_"D" eq X_"ND"^tack.t.short $
Un sistema è completamente rilevabile se $ X_"D" eq X $

== Relazione tra Osservabilità e Rilevabilità
- *Osservabilità*: Riguarda la determinazione dello stato *iniziale* $x(0)$ guardando l'uscita *futura*

- *Rilevabilità*: Riguarda la determinazione dello stato *finale* $x(t^*)$ guardando l'uscita *passata*

Per i sistemi LTI:
- *Tempo Continuo*: $X_"O" eq X_"D"$. Le due proprietà coincidono sempre

- *Tempo Discreto*: In generale $X_"O" subset.eq X_"D"$. Se la matrice $A$ è non singolare (invertibile), allora $X_"O" eq X_"D"$

*Conseguenza Pratica*: poichè l'Osservabilità implica la Rilevabilità, nel seguito ci concentreremo sull'analisi dell'*Osservabilità*

== Scomposizione Strutturale
Se un sistema non è completamente osservabile, lo spazio di stato può essere decomposto in:
+ *Parte Osservabile ($X_"O"$)*: Di dimensione $o lt n$. Le dinamiche di questa parte influenzano l'uscita. Al *sottospazio di osservabilità* sono associati $o$ degli $n$ autovalori della matrice $A$

+ *Parte Non Osservabile ($X_"NO"$)*: Di dimensione $n - o$. Le dinamiche di questa parte sono completamente *scollegate dall'uscita*. Qualsiasi evoluzione in questo sottospazio non produce alcun segnale su $y(t)$. Al *sottospazio di non osservabilità* sono associati $n - o$ degli $n$ autovalori della matrice $A$.

Se la parte non osservabile è *instabile* (autovalori a parte reale positiva), il sistema fisico può "esplodere" internamente senza che sia rilevabile dai sensori. Questo è un fenomeno che uno stimatore (osservatore) non può nè rilevare nè correggere

Gli stati osservabili possono influenzare la parte non osservabile, ma non il viceversa

= Analisi dell'Osservabilità per Sistemi LTI
== Derivazione della Matrice di Osservabilità (Caso Tempo Discreto SISO)
Consideriamo un sistema LTI a tempo discreto, SISO, descritto dalle equazioni:
$ x(k + 1) eq A x(k) + B u(k) $
$ y(k) eq C x(k) + D u(k) $

Con $x in RR^n$, $y in RR$, $C in R^(1 times n)$
Per studiare l'osservabilità, ci concentriamo sul *movimento libero*, ponendo l'ingresso a zero: $u(k) eq 0, forall k gt.eq 0$. L'uscita è, quindi, determinata unicamente dallo stato iniziale $x(0)$:
$ y(k) eq C x(k) eq C A^k x(0) $

Scrivendo esplicitamente i primi valori dell'uscita in funzione di $x(0)$ abbiamo:
- *Passo 0*: $y(0) eq C x(0)$

- *Passo 1*: $y(1) eq C A x(0)$

- *Passo 2*: $y(2) eq C A^2 x(0)$

- *Passo $cal(l)$*: $y(cal(l)) eq C A^cal(l) x(0)$

== Formulazione Matriciale e Spazio Nullo
Le equazioni precedenti possono essere compattate in forma matriciale. Definiamo il vettore delle uscite $Y(cal(l)) in RR^(cal(l) + 1)$:
$ Y(cal(l)) eq mat(delim: "[", y(0); y(1); y(2); dots.v; y(cal(l))) $

E la *Matrice di Osservabilità* al passo $cal(l)$, denotata con $M_"O" (cal(l))$:

$ M_"O" (cal(l)) eq mat(delim: "[", C; C A; C A^2; dots.v; C A^cal(l)) in RR^(cal(l) + 1) times n $

Pertanto:
$ Y(cal(l)) eq M_"O" (cal(l)) x(0) $

L'insieme degli stati iniziali che producono uscita identicamente nulla (stati *non osservabili* in $cal(l) + 1$ passi) è detto *spazio nullo* (o kernel) della matrice $M_"O" (cal(l))$:
$ X_"NO" (cal(l)) eq cal(N)(M_"O" (cal(l))) eq {x(0) in RR^n | M_"O" (cal(l)) x(0) eq 0} $

== La Matrice di Osservabilità $M_"O"$ e il Test di Kalman
Per determinare l'intero sottospazio di non osservabilità $X_"NO"$, dobbiamo considerare l'intersezione degli spazi nulli al variare del numero di passi $cal(l)$. Ancora una volta, il *Teorema di Cayley-Hamilton* ci garantisce che le righe $C A^k$ per $k gt.eq n$ sono combinazioni lineari delle prime $n$ righe ($C, C A, dots, C A^(n - 1)$)

Di conseguenza, aggiungere righe oltre $k eq n - 1$ *non può aumentare il rango* della matrice $M_"O" (cal(l))$. Il massimo rango (e quindi la minima dimensione dello spazio nullo) si raggiunge per $cal(l) eq n - 1$

Si definisce, quindi, la *Matrice di Osservabilità* del sistema come:
$ M_"O" eq.delta M_"O" (n - 1) eq mat(delim: "[", C; C A; C A^2; dots.v; C A^(n - 1)) in RR^(n times n) $

Per sistemi a più uscite, $M_"O"$ avrà dimensione $(n dot q) times n$, ma il principio del rango rimane valido

== Condizione di Completa Osservabilità
Dalla definizione, il sottospazio di non osservabilità è lo spazio nullo di $M_"O"$:
$ X_"NO" eq cal(N)(M_"O") $

Per le proprietà dell'algebra lineare, il complemento ortogonale dello spazio nullo è lo spazio delle righe (o immagine trasposta):
$ X_"O" eq X_"NO"^tack.t.short eq cal(N)(M_"O")^tack.t.short eq cal(R)(M_"O"^"T") $

La dimensione del sottospazio di osservabilità è, quindi, pari al rango della matrice $M_"O"$:
$ dim(X_"O") eq rho(M_"O") eq o $

=== Teorema (Condizione Necessaria e Sufficiente per l'Osservabilità)
Un sistema dinamico LTI (TC o TD) è *completamente osservabile* se e solo se il rango della matrice di osservabilità $M_"O"$ è massimo, ovvero pari alla dimensione $n$ del sistema:
$ rho(M_"O") eq n $

Ovvero la matrice $M_"O"$ ha determinante diverso da zero (nel caso SISO) o comunque $n$ righe linearmente indipendenti

== Estensione e Nota Operativa
- *Sistemi a Tempo Continuo*: La derivazione tramite derivate successive dell'uscita $(dot(y), dot.double(y), dots)$ conduce esattamente alla *stessa* condizione algebrica. La matrice di osservabilità è identica:
$ M_"O" eq mat(delim: "[", C; C A; C A^2; dots.v; C A^(n - 1)) $

In Matlab, il comando per il calcolo è: `Mo = obsv(A, C);` E il rango si valuta con  `rank(Mo)`

= Osservabilità e Realizzazione: La Forma Canonia di Osservabilità
== Il Problema della Realizzazione
Come già discusso, il *problema della realizzazione* consiste nel determinare una rappresentazione in spazio di stato ($A$, $B$, $C$, $D$) a partire dalla funzione di trasferimento $H(s)$ o $H(z)$

Abbiamo già introdotto la *Forma Canonica di Raggiungiblità*, che garantisce per costruzione la completa raggiungibilità del sistema realizzato. Esiste una forma duale, detta *Forma Canonica di Osservabilità*, che garantisce per costruzione la completa *osservabilità*

La scelta della forma canonica dipende dall'obiettivo progettuale. Se si intende progettare un controllore (retroazione dello stato), è conveniente la forma di raggiungibilità. Se si intende progettare uno stimatore (osservatore dello stato), è conveniente la forma di osservabilità

== Funzione di Trasferimento Strettamente Propria
Anche in questo caso, prima di procedere, è necessario assicurarsi che la funzione di trasferimento sia *strettamente propria* (grado del numeratore $m$ $lt$ grado del denominatore $n$). Se $m eq n$, si effettua la divisione polinomiale per estrarre il termine diretto $D$:
$ H(s) eq (b^'_(n-1) s^(n - 1) + dots + b^'_1 s + b^'_0)/(s^n + a_(n - 1)s^(n - 1) + dots + a_1 s + a_0) + D $

== La Forma Canonica di Osservabilità
Data la funzione di trasferimento strettamente propria (o resa tale):
$ H(s) eq (beta_(n - 1)s^(n - 1) + dots + beta_1 s + beta_0)/(s^n + alpha_(n - 1) s^(n - 1) + dots + alpha_1 s + alpha_0) + D $

La realizzazione in *Forma Canonica di Osservabilità* è definita dalle seguenti matrici:

*Matrice di Stato $A$ (Matrice Compagna Destra)*:
$ A eq mat(delim: "[", 0, 0, dots, 0, -alpha_0; 1, 0, dots, 0, -alpha_1; 0, 1, dots, 0, -alpha_2; dots.v, dots.v, dots.down, dots.v, dots.v; 0, 0, dots, 1, -alpha_(n - 1))_(n times n) $

Struttura: Sottodiagonale di $1$, ultima colonna contenente i coefficienti del denominatore cambiati di segno

*Matrice di Ingresso $B$*:
$ B eq mat(delim: "[", beta_0; beta_1; beta_2; dots.v; beta_(n - 1))_(n times 1) $

Struttura: I coefficienti del numeratore (dopo la divisione), in ordine crescente di potenza

*Matrice di Uscita $C$*:
$ C eq mat(delim: "[", 0, 0, dots, 0, 1)_(1 times n) $

Struttura: Tutti zeri, tranne l'ultimo elemento pari a $1$

*Matrice di Legame Diretto $D$*:
$ D eq mat(delim: "[", D)_(1 times 1) $

== Proprietà della Forma Canonica di Osservabilità
+ *Polinomio Caratteristico*: Il polinomio caratteristico della matrice $A$ è: $ det(s I - A) eq s^n + alpha_(n - 1)s^(n - 1) + dots + alpha_1 s + alpha_0 $ Coincide esattamente con il denominatore della funzione di trasferimento

+ *Osservabilità Garantita*: Questa forma è detta "canonica di osservabilità" perchè la matrice $M_"O"$ risultante ha *sempre rango pieno* ($n$). È fisicamente impossibile che un sistema scritto in questa forma non sia osservabile. La matrice $C eq mat(delim: "[", 0, dots, 0, 1)$ seleziona l'ultima variabile di stato. La struttura a catena di integratori (o ritardi) fa si che l'informazione fluisca all'indietro, rendendo tutte le variabili di stato visibili dall'uscita

+ *Dualità*: Si confronti questa forma con la Forma Canonica di Raggiungibilità. Si noti che: $ A_"oss" eq A^"T"_"ragg", space.en space.en space.en B_"oss" eq C^"T"_"ragg", space.en space.en space.en C_"oss" eq B^"T"_"ragg" $ Questa è una manifestazione del *Principio di Dualità*

= Il Principio di Dualità
== Introduzione al Concetto di Sistema Duale
Vi è una simmetria strutturale tra le proprietà di *Raggiungibilità* e *Osservabilità*:
- *Raggiungibilità*: Si basa sullo spazio immagine della matrice $ mat(delim: "[", A, A B, dots, A^(n - 1) B) $

- *Osservabilità*: Si basa sullo spazio nullo (o spazio immagine della trasposta) della matrice $ mat(delim: "[", C; C A; dots; C A^(n - 1)) $

Questa simmetria non è casuale, ma è formalizzata dal *Principio di Dualità*

=== Definizione (Sistema Duale)
Dato un sistema LTI a tempo continuop, detto *Sistema Primale* $S^P$, descritto dalla quaterna di matrici $(A, B, C, D)$:
$ dot(x) (t) eq A x(t) + B u(t) $
$ y(t) eq C x(t) + D u(t) $

Con $x in RR^n$, $u in RR^p$, $y in RR^q$

Si definisce il *Sistema Duale* $S^D$ il sistema dinamico ottenuto mediante le seguenti sostituzioni:
$ A arrow.r.l A^T, space.en space.en space.en B arrow.r.l C^T, space.en space.en space.en C arrow.r.l B^T, space.en space.en space.en D arrow.r.l D^T $

Il sistema duale è, quindi, descritto dalle equazioni:
$ dot(w)(t) eq A^T w(t) + C^T v(t) $
$ z(t) eq B^T w(t) + D^T v(t) $

Dove $w in RR^n$ è lo stato duale, $v in RR^q$ è l'ingresso duale e $z in RR^p$ è l'uscita duale

Si noti l'inversione dei ruoli. L'ingresso del sistema duale $v$ ha la dimensione dell'uscita del sistema primale $(q)$. L'uscita del sistema duale $z$ ha la dimensione dell'ingresso del sistema primale $(p)$. Le matrici $B$ e $C$ si scambiano di ruolo (e vengono trasposte)

== Il Legame tra i Sottospazi Strutturali
Applichiamo le definizioni di raggiungibilità e osservabilità al sistema duale e confrontiamole con il sistema primale

=== Raggiungibilità del Duale vs. Osservabilità del Primale
Il sottospazio di raggiungibilità del sistema duale $S^D$ è lo spazio immagine della sua matrice di raggiungibilità:
$ M_R^D eq mat(delim: "[", C^T, A^T C^T, dots, (A^T)^(n - 1) C^T) $

Osserviamo questa matrice. La sua trasposta è:
$ (M_R^D)^T eq mat(delim: "[", C; C A; dots.v; C A^(n - 1)) eq M_"O"^P $

Ma $M_"O"^P$ è esattamente la *matrice di osservabilità del sistema primale*

Poichè il rando di una matrice è uguale al rango della sua trasposta, si ha:
$ rho(M_R^D) eq rho(M_"O"^P) $

Pertanto, il sottospazio di raggiungibilità del sistema duale coincide con il sottospazio di osservabilità del sistema primale:
$ X_R^D eq X_"O"^P $

=== Osservabilità del Duale vs. Raggiungibilità del Primale
In modo perfettamente simmetrico, la matrice di osservabilità del sistema duale è:
$ M_"O"^D eq mat(delim: "[", B^T; B^T A^T; dots.v; B^T (A^T)^(n - 1)) $

La sua trasposta è:
$ (M_"O"^D)^T eq mat(delim: "[", B, A B, dots, A^(n - 1) B) eq M_R^P $

che è la *matrice di raggiungibilità del sistema primale*. Di conseguenza:
$ X_"O"^D eq X_R^P $

== Enunciato Formale del Principio di Dualità
Dalle relazioni appena dimostrate sui ranghi delle matrici, discende il seguente teorema fondamentale

=== Principio di Dualità (Enunciato)
Il sistema primale $S^P (A, B, C, D)$ è *completamente raggiungibile* se e soltanto se il sistema duale $S^D (A^T, C^T, B^T, D^T)$ è *completamente osservabile*

Viceversa, il sistema primale $S^P (A, B, C, D)$ è *completamente osservabile* se e soltanto se il sistema duale $S^D (A^T, C^T, B^T, D^T)$ è *completamente raggiungibile*


