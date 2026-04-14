#import "../template.typ": *

#show : project.with(
  title: "Proprietà Strutturali e Leggi di Controllo",
  course: "Controlli Automatici"
)

= Introduzione e Definizioni Fondamentali
Dopo aver trattato la stabilità (che riguarda la risposta libera e la convergenza a punti di equilibrio), ci occupiamo ora di *Raggiungibilità* e *Controllabilità*. Queste proprietà rispondono alla domanda: "È possibile, agendo opportunamente sull'ingresso $u(t)$, pilotare lo stato del sistema da una condizione iniziale a una condizione finale desiderata?"

== Definizione Formale di Raggiungibilità
*Definizione (Stato Raggiungibile)*: \
Uno stato $x^* in RR^n$ si dice *raggiungibile* dallo stato zero $x_0$ al tempo $t^*$ se esiste un istante temporale finito $t^* gt.eq t_0$ ed una funzione d'ingresso $u(dot)$ definita su $[t_0, t^*]$ tale che, partendo da $x(t_0) eq 0$, il movimento dello stato soddisfi: $ x(t^*) eq x^* $

*Definizione (Insieme di Raggiungibilità)*: \
L'insieme di tutti gli stati raggiungibili al tempo $t^*$ costituisce un *sottospazio lineare* dello spazio di stato, denotato con $X_R (t^*)$. L'insieme $X_R (t^*)$ costituisce un sottospazio lineare dello spazio di stato $X$

Il *Sottospazio di Raggiungibilità $X_R$* è definito come l'insieme di raggiungibilità di dimensione massima al variare del tempo: $ X_R eq max_(t in [t_0, oo)) X_R (t) $

Un sistema è *Completamente Raggiungibile* se: $ X_R eq X $

Per i sistemi non completamente raggiungibili si definisce il *sottospazio di non raggiungibilità* $N_("NR")$ come il complemento ortogonale di $X_R$: $ X_("NR") eq X^tack.t.short_R $

== Definizione Formale di Controllabilità
La Controllabilità è il concetto duale (o inverso) della Raggiungibilità. Invece di partire da zero e arrivare a $x^*$, si parte da $x^*$ e si cerca di portale il sistema a zero

*Definizione (Stato Controllabile)*: \
Uno stato $x^* in RR^n$ si dice *controllabile* allo stato $x_0$ al tempo $t^*$ se esiste un istante temporale finito $t^* gt.eq t_0$ ed una funzione d'ingresso $u(dot)$ definita su $[t_0, t^*]$ tale che, partendo da $x(t_0) eq x^*$, il movimento dello stato soddisfi: $ x(t^*) eq x_0 $

*Definizione (Insieme di Controllabilità)*: \
Analogamente, l'insieme degli stati controllabili al tempo $t^*$ è un sottospazio lineare $X_C (t^*)$. Il *Sottospazio di Controllabilità $X_C$* è l'insieme di controllabilità $X_C (t)$ di dimensione massima: $ X_C eq max_(t in [t_0, oo)) X_C(t) $

Un sistema è *Completamente Controllabile* se: $ X_C eq X $

Per i sistemi non completamente controllabili si definisce il *sottospazio di non controllabilità* $X_("NC")$ come il complemento ortogonale di $X_C$: $ X_("NC") eq X^tack.t.short_C $

== Il Concetto di Stato Zero
Lo *stato zero* $x_0$ è uno stato prefissato considerato come _obiettivo_. Tipicamente si tratta di uno stato di equilibrio non coincidente, in generale, con l'origine dello spazio di stato: $x_0 eq.not 0$

Tuttavia, per semplicità di trattazione e senza perdere generalità, si assumerà $x_0$ coincidente con lo stato nullo. In modo analogo, si può assumere: $t_0 eq 0$

== Relazione tra Raggiungibilità e Controllabilità
- *Sistemi a Tempo Continuo (LTI)*: La matrice di transizione $e^(A t)$ è sempre non singolare. Di conseguenza, i sottospazi coincidono sempre: $ X_R eq X_C $

- *Sistemi a Tempo Discreto (LTI)*: La matrice di transizione è $A^k$. Se $A$ è *singolare* (ha autovalori nulli), lo spazio degli stati raggiungibili può essere più piccolo dello spazio degli stati controllabili. In generale si ha: $ X_R subset.eq X_C $

Se $A$ è non singolare (invertibile), allora $ X_R eq X_C $

*Conseguenza Pratica*: \
Poichè la Raggiungibilità implica la Controllabilità (e per i sistemi TC coincidono), nel seguito della trattazione ci concentreremo sull'analisi della *Raggiungibilità* come proprietà cardine per la sintesi del controllore

== Interpretazione Geometrica e Scomposizione
Se un sistema non è completamente raggiungibile, lo spazio di stato $RR^n$ può essere scomposto in due spazi ortogonali:

+ *Sottospazio di Raggiungibilità ($X_R$)*: Di dimensione $r lt n$. L'ingresso $u$ agisce direttamente solo su questa parte. A questo sottospazio sono associati $r$ degli $n$ autovalori della matrice $A$

+ *Sottospazio di non Raggiungibilità ($X_("NR")$)*: Di dimensione $n - r$. L'ingresso *non può influenzare* la dinamica di questa parte. Gli autovalori associati a questa parte sono "fissi" e non possono essere modificati dal alcune legge di controllo (sono poli non confrontabili). A questo sottospazio sono associati $n - r$ degli $n$ autovalori della matrice $A$

La dinamica della parte non raggiungibile può comunque influenzare la parte raggiungibile e, tramite esse, l'uscita del sistema. Se la parte non raggiungibile è instabile (autovalori a parte reale positiva), il sistema non potrà mai essere stabilizzato tramite retroazione dello stato (o dall'uscita)

= Analisi della Raggiungibilità per Sistemi Dinamici LTI
== Derivazione della Matrice di Raggiungibilità (Caso Tempo Discreto SISO)
Consideriamo un sistema LTI a tempo discreto, SISO (Single Input - Single Output), descritto da: $ x(k + 1) eq A x(k) + B u(k) $
Dove $x in RR^n, u in RR, A in RR^(n times n), B in RR^(n times 1)$

Assumiamo, per semplicità e senza perdere generalità, che lo stato iniziale sia l'origine: $x(0) eq 0$. Calcoliamo l'evoluzione dello stato passo dopo passo:
- *Passo 1*: $x(1) eq A dot 0 + B u(0) eq B u(0)$

- *Passo 2*: $x(2) eq A x(1) + B u(1) eq A B u(0) + B u(1)$

- *Passo 3*: $x(3) eq A x(2) + B u(2) eq A^2 B u(0) + A B u(1) + B u(2)$

Generalizzando all'istante generico $cal(l)$: $ x(cal(l)) eq A^(cal(l) - 1) B u(0) + A^(cal(l) - 2) B u(1) + dots + A B u(cal(l) - 2) + B u(cal(l) - 1) $

Si osservi la struttura: lo stato al passo $cal(l)$ è una *combinazione lineare* dei vettori colonna $B$, $A B$, $A^2 B$, $dots$, $A^(cal(l) - 1) B$, i cui coefficienti sono i valori dell'ingresso $u(0)$, $u(1)$, $dots$, $u(cal(l) - 1)$

== Formulazione Matriciale e Spazio Immagine
L'espressione precedente può essere riscritta in forma matriciale compatta. Definiamo il vettore degli ingressi $U(cal(l)) in RR^(cal(l))$ come: 
$ U(cal(l)) eq mat(delim: "[", u(cal(l) - 1); u(cal(l) - 2); dots.v; u(0)) $

È la *Matrice di Raggiungibilità* al passo $cal(l)$, denotata con $M_R (cal(l))$, come la matrice le cui colonne sono i vettori della sequenza di Krylov:
$ M_R (cal(l)) eq mat(delim: "[", B, A B, A^2 B, dots, A^(cal(l) - 1) B) in RR^(n times cal(l)) $

Pertanto:
$ x(cal(l)) eq M_R (cal(l)) U(cal(l)) $

L'insieme di tutti gli stati raggiungibili esattamente in $cal(l)$ passi, denotato $X_R (cal(l))$, è dato dallo *spazio immagine* (o range) della matrice $M_R (cal(l))$:
$ X_R (cal(l)) eq op("rank")(M_R (cal(l))) eq op("span"){B, A B, dots, A^(cal(l) - 1) B} $

== La Matrice di Raggiungibilità $M_R$ e il Teorema di Kalman
Per determinare l'intero sottospazio di raggiungibilità $X_R$, dobbiamo considerare il massimo spazio generabile al variare del numero di passi $cal(l)$. Il *Teorema di Cayley-Hamilton* ci garantisce che, per una matrice $A in RR^(n times n)$, tutte le potenze di $A^k$ con $k gt.eq n$ sono esprimibili come combinazione lineare delle potenze inferiori $I$, $A$, $A^2$, $dots$, $A^(n - 1)$

Di conseguenza, aggiungere colonne $A^cal(l) B$ per $cal(l) gt.eq n$ *non può aumentare il rango* della matrice. Il massimo rango si raggiunge al più per $cal(l) eq n$

Si definisce quindi la *Matrice di Raggiungibilità* del sistema come:
$ M_R eq.delta M_R (n) eq mat(delim: "[", B, A B, A^2 B, dots, A^(n - 1) B) in RR^(n times n) $

Il *Sottospazio di Raggiungibilità* è lo spazio generato dalle colonne di $M_R$:
$ X_R eq op("rank")(M_R) $

== Condizione di Completa Raggiungibilità
Dalla definizione di $X_R$ come spazio immagine di $M_R$, la dimensione del sottospazio raggiungibile è pari al rango della matrice $M_R$:
$ dim(X_R) eq rho (M_R) eq r $

*Teorema (Condizione Necessaria e Sufficiente)*: \
Un sistema dinamico LTI (TC o TD) è *completamente raggiungibile* se e solo se il rango della matrice di raggiungibilità $M_R$ è massimo, ovvero pari alla dimensione $n$ del sistema: $ rho(M_R) eq n $

Ovvero la matrice $M_R$ ha determinante diverso da zero (nel caso SISO) o comunque $n$ colonne linearmente indipendenti (nel caso MIMO)

== Estensione al Caso MIMO e a Tempo Continuo
- *Sistemi MIMO (Multi-Input)*: Se $u in RR^p space.en (p gt 1)$, la matrice $B$ ha dimensioni $n times p$. La matrice di raggiungibilità si costruisce includendo tutte le colonne del tipo $A^k b_j$, dove $b_j$ è la j-esima colonna di $B$. In pratica $ M_R eq mat(delim: "[", B, A B, dots, A^(n - 1) B) $ ha dimensioni $n times (n dot p)$ e la condizione di rango massimo rimane $rho(M_R) eq n$

- *Sistemi a Tempo Continuo*: La derivazione tramite serie di potenze (o trasformata di Laplace) conduce esattamente alla *stessa* condizione algebrica. La matrice di raggiungibilità per un sistema $dot(x) eq A x + B u$ è identica: $ M_R eq mat(delim: "[", B, A B, dots, A^(n - 1) B) $

== Nota Operativa per Matlab
Per l'analisi computazionale, l'ambiente Matlab/Simulink fornisce il comando diretto:
```
MR = ctrb(A, B);
r = rank(MR);
```

Se `r == n`, il sistema è completamente raggiungibile

= Il Problema della Realizzazione e la Forma Canonica di Raggiungibilità
== Le Due Rappresentazioni del Sistema
Un sistema dinamico LTI SISO può essere descritto in due modi equivalenti, ma con contenuto informativo potenzialmente diverso:

=== Rappresentazione Ingresso-Stato-Uscita

$ cases(
  dot(x) eq A x(t) + B u(t),
  y(t) eq C x(t) + D u(t) 
) space.en space.en space.en ("Tempo Continuo")
$

$ cases(
  x(k + 1) eq A x(k) + B u(k),
  y(k) eq C x(k) + D u(k) 
) space.en space.en space.en ("Tempo Discreto")
$

=== Rappresentazione Ingresso-Uscita (Funzione di Trasferimento)
$ H(s) eq (b_m s^m + b_(m - 1) s^(m-1) + dots b_1 s + b_0)/(a_n s^n + a_(n - 1) s^(n - 1) + dots + a_1 s + a_0) space.en space.en space.en ("Tempo Continuo") $

$ H(z) eq (b_m z^m + b_(m - 1) z^(m-1) + dots b_1 z + b_0)/(a_n z^n + a_(n - 1) z^(n - 1) + dots + a_1 z + a_0) space.en space.en space.en ("Tempo Discreto") $

*Passaggio ISU $arrow.r$ Funzione di Trasferimento*: \
È univoco. La relazione è data da:
$ H(s) eq C(s I - A)^(-1) B + D $
$ H(z) eq C(z I - A)^(-1) B + D $

Il calcolo del determinante e dell'aggiunta della matrice ($s I - A$) produce sempre la stessa $H(s)$, indipendentemente dalla scelta delle coordinate di stato

*Passaggio Funzione di Trasferimento $arrow.r$ ISU*: \
Questo è noto come *Problema di Realizzazione*. La soluzione *non è unica*: esistono infinite quaterne ($A$, $B$, $C$, $D$) che producono la stessa $H(s)$. Esse differiscono per una trasformazione di similitudine (cambio di base nello spazio di stato)

== Preliminare: Funzioni di Trasferimento Proprie e Strettamente Proprie
Prima di procedere alla realizzazione, è necessario verificare il *grado relativo*. Se la funzione di trasferimento non è strettamente propria, ovvero se il grado del numeratore $m$ è uguale al grado del denominatore $n$:
$ H(s) eq (b_m s^m + b_(m - 1) s^(m-1) + dots b_1 s + b_0)/(s^n + a_(n - 1) s^(n - 1) + dots + a_1 s + a_0) space.en space.en space.en "Dove è stato posto" a_n eq 1 "per comodità" $

Si effettua la *divisione polinomiale* tra numeratore e denominatore per estrarre il termine diretto $D$:
$ H(s) eq (b^'_(n - 1) s^(n - 1) + dots + b^'_1 s + b^'_0)/(s^n + a_(n - 1) s^(n - 1) + dots + a_1 s + a_0) + D $

Dove $D eq b^'_n$ (nell'ipotesi $a_n eq 1$) e i coefficienti $b^'_i$ sono i resti della divisione. Il termine $D$ rappresenta il *legame algebrico diretto* ingresso-uscita, che non coinvolge la dinamica dello stato

== La Forma Canonica di Raggiungibilità
Esiste una struttura standard, detta *Forma Canonica di Raggiungibilità* (o _Forma Compagna Inferiore_), che garantisce _per costruzione_ la completa raggiungibilità del sistema

Data la funzione di trasferimento strettamente propria (o resa tale dopo divisione):
$ H(s) eq (beta_(n - 1)s^(n - 1) + dots + beta_1 s + beta_0)/(s^n + alpha_(n - 1) s^(n - 1) + dots + alpha_1 s + alpha_0) + D $

La realizzazione in *Forma Canonica di Raggiungibilità* è definita dalle seguenti matrici:

*Matrice di Stato A (Matrice Compagna Inferiore)*:
$ A eq mat(delim: "[", 0, 1, 0, dots, 0; 0, 0, 1, dots, 0; dots.v, dots.v, dots.v, dots.down, dots.v; 0, 0, 0, dots, 1; -alpha_0, -alpha_1, -alpha_2, dots, -alpha_(n - 1))_(n times n) $

Struttura: Sovradiagonale di "1", ultima riga contenente i coefficienti del denominatore cambiati di segno

*Matrice di Ingresso B*:
$ B eq mat(delim: "[", 0; 0; dots.v; 0; 1) $

Struttura: Tutti zeri, tranne l'ultimo elemento pari a 1

*Matrice di Uscita C*:
$ C eq mat(delim: "[", beta_0, beta_1, dots, beta_(n - 1))_(1 times n) $

Struttura: I coefficienti del numeratore (dopo divisione), in ordine crescente di potenza

*Matrice di Legame Diretto D*:
$ D eq mat(delim: "[", D)_(1 times 1) $

== Proprietà della Forma Canonica di Raggiungibilità
+ *Polinomio Caratteristico*: Il polinomio caratteristico della matrice $A$ è immediato: $ det(s I - A) eq s^n + alpha_(n - 1) s^(n - 1) + dots + alpha_1 s + alpha_0 $ Coincide esattamente con il denominatore della funzione di trasferimento

+ *Raggiungibilità Garantita*: Questa forma è detta "canonica di raggiungibilità" perchè la matrice $M_R$ risultante ha *sempre rango pieno* ($n$). È fisicamente impossibile che un sistema scritto in questa forma non sia raggiungibile

