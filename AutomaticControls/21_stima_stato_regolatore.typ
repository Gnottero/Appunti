#import "../template.typ": *

#show : project.with(
  title: "Stima dello Stato e Regolatore Dinamico",
  course: "Controlli Automatici"
)

= Introduzione: Il Problema della Misura dello Stato
== Il Limite della Retroazione Statica
Abbiamo dimostrato che, sotto l'ìpotesi di completa raggiungibilità, la legge di controllo per retroazione statica dallo stato:
$ u(t) eq -K x(t) + alpha r(t) $
consente di assegnare arbitrariamente gli autovalori del sistema ad anello chiuso, determinandone stabilità e prestazioni dinamiche

Questa soluzione teorica si scontra con un vincolo pratico: il vettore di stato $x(t)$ è raramente accessibile nella sua interezza. I sensori fisici forniscono solo la misura dell'uscita $y(t)$, che costituisce un'informazione parziale (una proiezione) dello stato interno

== Il Ruolo della Stima
La proprietà di *osservabilità*, garantisce che l'evoluzione temporale della coppia ingresso-uscita $(u(t), y(t))$ contiene informazione sufficiente per ricostruire l'intero stato $x(t)$. Sfruttando questa proprietà, è possibile realizzare un sistema dinamico ausiliario, detto *stimatore* o *osservatore dello stato*, che genera una stima $hat(x)(t)$ convergente asintoticamente allo stato vero $x(t)$

La stima $hat(x)(t)$ può, quindi, sostituire lo stato vero nella legge di controllo:
$ u(t) eq -K hat(x)(t) + alpha r(t) $

Questa architettura, che combina uno stimatore e una retroazione statica, è denominata *regolatore dinamico*

= Lo Stimatore Asintotico dello Stato
== Un Primo Tentativo (Inadeguato)
Consideriamo un sistema LTI a tempo continuo SISO:
$ dot(x) eq A x(t) + B u(t), space.en space.en space.en y(t) eq C x(t) + D u(t) $
L'approccio più immediato per stimare lo stato consiste nel replicare l'equazione di stato del sistema originale, alimentandola con lo stesso ingresso $u(t)$:
$ dot(hat(x))(t) eq A hat(x)(t) + B u(t) $
In tal caso, l'errore di stima
$ e(t) eq hat(x)(t) - x(t) $
evolve secondo l'equazione differenziale:
$ dot(e)(t) eq dot(hat(x))(t) - dot(x)(t) eq A hat(x)(t) + B u(t) - (A x(t) + B u(t)) eq A e(t) $
Da cui:
$ e(t) eq e^(A t) e(0) $
La dinamica dell'errore è governata dalla matrice $A$ del sistema originale. Affinchè l'errore converga a zero per qualsiasi condizione iniziale $e(0) eq.not 0$, è necessario che la matrice $A$ sia asintoticamente stabile ($Re(lambda_i (A)) lt 0$). Questa condizione è in generale non verificata, specialmente se il sistema da controllare è instabile. Questo stimatore "in catena aperta" è, quindi, inutilizzabile in pratica

Per ottenerre la condizione:
$ lim_(t arrow.r oo) norm(e(t)) eq 0 $
bisogna che sia valida almeno una tra:
- Tutti i modi naturali associati agli autovalori di $A$ siano convergenti, ovvero che il sistema sia asintoticamente stabile
- L'errore di stima iniziale sia nullo $e(0) eq 0$

== Struttura dello Stimatore Asintotico
Per imporre una dinamica dell'errore arbitraria e convergente, si introduce un termine di correzione proporzionale all'errore tra l'uscita misurata $y(t)$ e l'uscita stimata $hat(y)(t) eq C hat(x)(t) + D u(t)$:
$ dot(hat(x))(t) eq A hat(x)(t) + B u(t) - L(hat(y)(t) - y(t)) $
Il vettore $L in RR^(n times 1)$ (nel caso SISO) è detto *matrice dei guadagni dello stimatore*. Questo schema è noto come *Osservatore di Luenberger*

Calcoliamo la dinamica dell'errore con questa nuova struttura:
$ dot(e)(t) eq dot(hat(x))(t) - dot(x)(t) \ eq [A hat(x) + B u - L(C hat(x) + D u - C x - D u)] - [A x + B u] \ eq A (hat(x) - x) - L C (hat(x) - x) \ eq (A - L C) e(t) $

L'errore di stima evolve ora secondo il sistema lineare $ dot(e)(t) eq (A - L C) e(t) $
La convergenza asintotica a zero dell'errore
$ lim_(t arrow.r oo) norm(e(t)) eq 0 $
è garantita se e solo se tutti gli autovalori della matrice ($A - L C$) hanno parte reale strettamente negativa

== Il Problema di Assegnazione per lo Stimatore
Il progetto dello stimatore si riduce, quindi, a un problema di *assegnazione degli autovalori* per la matrice ($A - L C$). Ci chiediamo: sotto quali condizioni è possibile trovare una matrice $L$ che posizioni arbitrariamente gli autovalori di ($A - L C$)?

La risposta è fornita dal *Principio di Dualità* e dal Teorema di Assegnazione degli Autovalori per la retroazione statica. Ricordiamo che:
- La coppia $(A, C)$ è *osservabile* se e solo se la coppia duale $(A^T, C^T)$ è *raggiungibile*

- Il problema di assegnare gli autovalori di $A - L C$ è equivalente ad assegnare gli autovalori di $(A - L C)^T eq A^T - C^T L^T$

Ponendo $K_"dual" eq L^T$, ci si riconduce esattamente al problema di retroazione statica per il sistema duale $dot(w) eq A^T w + C^T v$ con legge di controllo $v eq - K_"dual" w$. Il Teorema di Assegnazione garantisce che ciò è possibile *se e solo se* la coppia $(A^T, C^T)$ è raggiungibile, ovvero se e solo se la coppia originale $(A, C)$ è *osservabile*

Se il sistema è completamente osservabile, è sempre possibile progettare lo stimatore asintotico assegnando ad arbitrio la velocità di convergenza della stima (gli autovalori di $A - L C$)

== Caso a Tempo Discreto
Per i sistemi a tempo discreto $x(k + 1) eq A x(t) + B u(k)$, lo stimatore asintotico assume la forma:
$ hat(x)(k + 1) eq A hat(x)(k) + B u(k) - L(hat(y)(k) - y(k)) $
$ hat(y)(k) eq C hat(x)(k) + D u(k) $
La dinamica dell'errore è:
$ e(k + 1) eq (A - L C) e(k) $
e la condizione di convergenza è che tutti gli autovalori di $(A - L C)$ abbiano modulo strettamente minore di 1

== Nota Matlab
In Matlab, la matrice dei guadagni $L$ può essere calcolata, nel caso di autovalori di molteplicità unitaria, mediante l'istruzione `place` sfruttando il principio di dualità: `L = place(A', C', p)'`, dove `p` è il vettore contenente gli autovalori da assegnare

Se, invece, gli autovalori da assegnare non hanno molteplicità unitaria, bisogna usare l'istruzione `L = acker(A', C', p)'`

= Il Regolatore Dinamico
== Connessione Stimatore-Controllore
Disponendo di uno stimatore asintotico, siamo in grado di generare una stima $hat(x)(t)$ dello stato. L'idea del regolatore dinamico è di utilizzare questa stima in luogo dello stato vero nella legge di controllo per retroazione statica:
$ u(t) eq -K hat(x)(t) + alpha r(t) $
Il sistema di controllo complessivo è ora descritto da $2n$ equazioni di stato: $n$ per il sistema originale e $n$ per lo stimatore

= Il Principio di Separazione
La domanda cruciale è: l'introduzione dello stimatore altera la dinamica del sistema ad anello chiuso che avevamo progettato con la retroazione statica ideale? Per rispondere, scriviamo le equazioni del sistema complessivo utilizzando come variabili di stato il vettore di stato vero $x(t)$ e l'errore di stima $e(t) eq hat(x)(t) - x(t)$

Sostituendo $u(t) eq -K(x(t) + e(t)) + alpha r(t)$ nell'equazione di stato del sistema:
$ dot(x)(t) eq A x(t) + B[-K (x + e) + alpha r] eq (A - B K)x(t) - B K e(t) + B alpha r(t) $

La dinamica dell'errore è già stata derivata e non dipende da $r(t)$:
$ dot(e)(t) eq (A - L C)e(t) $

In forma matriciale compatta:
$ mat(delim: "[", dot(x)(t); dot(e)(t)) eq mat(delim: "[", A - B K, -B K; 0, A - L C) mat(delim: "[", x(t); e(t)) + mat(delim: "[", B alpha; 0) r(t) $

La matrice di stato del sistema ad anello chiuso è *triangolare a blocchi*. I suoi autovalori sono l'unione disgiunta degli autovalori dei blocchi diagonali:
$ lambda_i (A_"cl") eq lambda_i (A - B K) union lambda_j (A - L C) $

Questo risultato fondamentale è noto come *Principio di Separazione* (o Teorema di Separazione). Esso afferma che i poli del sistema controllato sono la sovrapposizione dei poli imposti dalla retroazione statica ideale e dei poli imposti dallo stimatore. *Le due dinamiche sono indipendenti*

== Implicazioni del Principio di Separazione
Il Principio di Separazione ha una conseguenza pratica molto importante: *il progetto del controllore (scelta di $K$) e il progetto dello stimatore (scelta di $L$) possono essere condotti in modo completamente separato e indipendente*
+ Si progetta la matrice $K$ come se lo stato fosse perfettamente accessibile, scegliendo gli autovalori desiderati per la dinamica dominante del sistema controllato

+ Si progetta la matrice $L$ scegliendo gli autovalori dello stimatore. Tipicamente per non degradare le prestazioni del transitorio, si scelgono autovalori per lo stimatore con costanti di tempo più piccole (più veloci) rispetto a quelle del sistema controllato (ad esempio, parte reale 3-5 volte più negativa)

== Funzione di Trasferimento e Regolazione
Sebbene il sistema complessivo abbia $2n$ poli, la funzione di trasferimento tra il riferimento $r(t)$ e l'uscita $y(t)$ coincide esattamente con quella del sistema con retroazione statica ideale:
$ H(s) eq [(C - D K)(s I - (A - B K))^(-1) B + D] alpha $

Da cui:
$ H(s) eq (alpha {(C - D K) "Adj"[s I - (A - B K)]B + D})/(det(s I - (A - B K))) $

I poli dello stimatore $(A - L C)$ risultano *cancellati* con corrispondenti zeri e non compaiono nella risposta ingresso-uscita. Sono *non osservabili* da $y(t)$

Di conseguenza, il calcolo del guadagno di feedforward $alpha$ per la *regolazione dell'uscita* $(dash(y) eq dash(r))$ si effettua con la medesima formula già ricavata per la retroazione statica ideale:
$ alpha eq [-(C - D K)(A - B K)^(-1) B + D]^(-1) $

Risultati analoghi valgono per i sistemi LTI TD. In particolare:

- La matrice di trasferimento $H(z)$ tra l'ingresso $r(k)$ (riferimento) e l'uscita $y(k)$ è data da: $ H(z) eq {(C - D K)[z I - (A - B K)]^(-1) B + D} alpha $

- La condizione di regolazione si ottiene imponendo: $ alpha eq [(C - D K)[I - (A - B K)]^(-1) B + D]^(-1) $