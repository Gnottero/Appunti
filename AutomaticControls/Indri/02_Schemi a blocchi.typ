#import "../../template.typ": *

#show : project.with(
  title: "Schemi a Blocchi",
  course: "Controlli Automatici"
)

= Convenzioni Generali ed Elementi di Base
== Definizione e Scopo
Gli schemi a blocchi costituiscono un metodo grafico semplice ed efficace per rappresentare il modello matematico di un sistema dinamico. Essi si costruiscono a partire dalle equazioni del modello, espresse nel dominio del tempo o della variabile complessa $s$, introducendo opportune variabili di ingresso, di uscita ed interne. La rappresentazione a blocchi evidenzia il flusso dei segnali e le relazioni funzionali tra le variabili, facilitando l'analisi e la sintesi del sistema di controllo

== I Quattro Elementi Base
Gli schemi a blocchi sono composti da quattro elementi fondamentali

- *Rami*: sono archi orientati che rappresentano il percorso di propagazione di una variabile (segnale) all'interno dello schema. A ciascun ramo è associata una variabile scalare (nel caso SISO) o vettoriale (nel caso MIMO)

- *Blocchi*: a ciascun blocco è associata una *funzione di trasferimento* (o matrice di trasferimento) che lega la variabile in ingresso al blocco con quella in uscita. L'uscita è data dal prodotto (nel dominio $s$) tra la funzione di trasferimento e l'ingresso: $ y(s) eq G(s) e(s) $ Il blocco rappresenta l'operazione dinamica compiuta dal componente fisico (sistema, attuatore, trasduttore, controllore) sulla variabile d'ingresso

- *Punti di Derivazione*: un punto di derivazione permette di prelevare una variabile e trasferirla, inalterata, su più rami di uscita. Non modifica il segnale: la stessa variabile è disponibile simultaneamente su tutti i rami uscenti

- *Sommatore (o Nodi di Somma)*: la variabile associata al ramo di uscita di un sommatore è data dalla somma algebrica delle variabili associate ai rami entranti. I segni con cui ciascun contributo partecipa alla somma sono indicati esplicitamente in corrispondenza dei rami entranti. Ad esempio: $ e(s) eq y_"des" (s) - y(s) $ Il nodo di confronto tra riferimento e misura dell'uscita è un caso particolare di sommatore

== Estensione ai Sistemi MIMO
Gli schemi a blocchi possono rappresentare anche sistemi multivariabili (MIMO). In tal caso, a ciascun ramo è associata una variabile vettoriale e a ciascun blocco una matrice di trasferimento. In questa trattazione ci si limita al caso SISO, per il quale tutte le variabili sono scalari e le funzioni di trasferimento sono funzioni razionali in $s$

= Dall'Equazione alla Rappresentazione Grafica
== Principio Generale
È sempre possibile associare alle equazioni del modello di un sistema dinamico il corrispondente schema a blocchi, realizzando le operazioni matematiche richieste per mezzo degli elementi base e mantenendo inalterate le relazioni tra le variabili

== Esempio: Motore in Corrente Continua
Si consideri il modello dinamico di un motore in corrente continua comandato in tensione d'armatura, espresso nel dominio $s$:
$ V_a (s) - K_m Omega(s) eq (s L + R_a) I_a (s) \ K_m I_a (s) eq (s J + beta)Omega(s) $

Dove:
- $V_a, I_a$: tensione e corrente in armatura

- $K_m$: costante di coppia (e di forza contro-motrice)

- $Omega$: velocità angolare dell'albero

- $J, beta$: momento d'inerzia e coefficiente di attrito viscoso

La costruzione dello schema a blocchi procede come segue:
+ *Prima Equazione*: $I_a (s) eq 1/(s L + R_a) (V_a (s) - K_m Omega(s))$. Si rappresenta un sommatore con ingressi $V_a$ e $-K_m Omega$, la cui uscita alimenta un blocco con funzione di trasferimento $1/(s L + R_a)$, producendo $I_a$

+ *Seconda Equazione*: $omega(s) eq 1/(s J + beta) (K_m I_a (s))$. La variabile $I_a$ alimenta un blocco con guadagno $K_m$, la cui uscita alimenta un blocco $1/(s J + beta)$, producendo $Omega$

+ *Retroazione*: la velocità $Omega$ viene riportata tramite un punto di derivazione e moltiplicata per $K_m$ per generare la forza contro-elettromotrice $K_m Omega$, che chiude l'anello della retroazione negativa al primo sommatore

Lo schema risultante mostra l'interazione tra la dinamica elettrica (primo blocco) e la dinamica meccanica (secondo blocco), con una retroazione intrinseca dovuta alla forza contro-elettromotrice

= L'Algebra dei Blocchi
== Scopo dell'Algebra dei Blocchi
L'algebra dei blocchi consiste in un insieme di regole di trasformazione che permettono di ridurre schemi complessi a strutture equivalenti più semplici. L'obiettivo è calcolare agevolmente la funzione di trasferimento tra una variabile assunta come ingresso e una variabile di interesse assunta come uscita. Le equivalenze illustrate di seguito possono essere applicate singolarmente o combinate fra loro

== Blocchi a Cascata (Serie)
Due o più blocchi posti in cascata (cioè l'uscita del primo è l'ingresso del secondo) equivalgono a un unico blocco la cui funzione di trasferimento è il *prodotto* delle singole funzioni di trasferimento:
$ G_"eq" (s) eq G_1(s) dot G_2(s)  $

== Blocchi in Parallelo
Due o più blocchi i cui ingressi sono alimentati dalla stessa variabile e le cui uscite sono sommate algebricamente equivalgono a un unico blocco la cui funzione di trasferimento è la *somma algebrica* delle singole funzioni di trasferimento:
$ G_"eq" (s) eq plus.minus G_1(s) plus.minus G_2(s) $

== Spostamento di un Blocco rispetto a un Sommatore
=== Da monte a valle (spostamento "in avanti")
Se un blocco $G(s)$ è posto a valle di un sommatore, lo si può spostare a monte del sommatore, a condizione di *dividere* tutti i rami entranti nel sommatore per la funzione di trasferimento del blocco spostato:
$ y eq G(u_1 plus.minus u_2) eq G u_1 plus.minus G u_2 space.en space.en space.en arrow.r.double.long space.en space.en space.en y eq G u_1 plus.minus G u_2 $
Dopo lo spostamento a monte, il blocco $G$ compare su ciascun ramo entrante prima del sommatore

=== Da valle a monte (spostamento "all'indietro")
Se un blocco $G(s)$ è posto a monte di un sommatore, lo si può spostare a valle, a condizione di *moltiplicare* tutti i rami entranti nel sommatore per la funzione di trasferimento del blocco spostato

== Spostamento di un Blocco rispostto a un Punto di Derivazione
=== Da monte a valle (spostamento "in avanti")
Se un blocco $G(s)$ è posto a valle di un punto di derivazione, lo si può spostare a monte del punto, a condizione di *moltiplicare* tutti i rami uscenti dal punto di derivazione per la funzione di trasferimento del blocco spostato

=== Da valle a monte (spostamento "all'indietro")
Se un blocco $G(s)$ è posto a monte di un punto di derivazione, lo si può spostare a valle, a condizione di *dividere* tutti i rami uscenti dal punto di derivazione per la funzione di trasferimento del blocco spostato

= Calcolo di Funzioni di Trasferimento di Schemi Interconnessi
== Funzione di Trasferimento ad Anello Chiuso
Consideriamo lo schema di controllo in retroazione:
- $G(s)$: funzione di trasferimento del *ramo diretto* (controllore, attuatore, sistema)

- $H(s)$: funzione di trasferimento del *ramo di retroazione* (tipicamente il trasduttore)

- $y_"des" (s)$: riferimento

L'uscita è data da:
$ y(s) eq G(s) e(s) eq G(s) [y_"des" (s) plus.minus y_h (s)] eq G(s) [y_"des" (s) plus.minus H(s) y(s)] $

Raccogliendo $y(s)$ si ottiene:
$ y(s) eq [1 minus.plus G(s)H(s)] eq G(s) y_"des" (s) $

La *funzione di trasferimento ad anello chiuso* (o funzione di sensitività complementare) è quindi:
$ W_y (s) eq y(s)/(y_"des" (s)) eq G(s)/(1 minus.plus G(s)H(s)) $
Dove il segno al denominatore è *opposto* a quello del nodo di somma. Per retroazione negativa (il caso più comune), il nodo è $y_"des" - y_h$ e si ha:
$ W_y (s) eq G(s)/(1 - G(s)H(s)) $

== Funzione di Trasferimento d'Anello
Il prodotto delle funzioni di trasferimento di tutti i blocchi presenti sull'anello di retroazione è detto *funzione di trasferimento d'anello* (o guadagno d'anello):
$ G_a (s) eq G(s) H(s) $
Essa rappresenta il guadagno complessivo che un segnale subisce percorrendo l'intero anello (dal nodo di somma, attraverso il ramo diretto, la retroazione, e tornando al nodo di somma). La stabilità e le prestazioni del sistema ad anello chiuso dipendono in modo cruciale da $G_a (s)$

== Calcolo di Altre Funzioni di Trasferimento
La formula dell'anello chiuso può essere generalizzata per calcolare la funzione di trasferimento tra un qualsiasi ingresso (riferimento, disturbo) e una qualsiasi uscita. La regola mnemonica è:
$ W(s) eq "FdT del ramo diretto tra l'ingresso e l'uscita considerati"/(1 minus.plus G_a (s)) $
Dove il segno al denominatore è opposto a quello della retroazione complessiva dell'anello

== Esempio: Funzione di trasferimento disturbo-uscita
Si consideri un disturbo $d(s)$ agente sull'uscita del sistema, con riferimento $y_"des" eq 0$. Il ramo diretto tra $d$ e $y$ ha funzione di trasferimento unitaria (il disturbo si somma direttamente all'uscita). La retroazione è negativa. Pertanto:
$ W_d (s) eq 1/(1 + G(s)H(s)) $
Questa funzione è detta *funzione di sensitività* e indica la capacità del sistema di controllare e reiettare i disturbi all'uscita