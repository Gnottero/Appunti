#import "../../template.typ": *

#show: project.with(
    title: "Introduzione e Modellistica dei Sistemi",
    course: "Controlli Automatici"
)

= Nozione di Sistema e Modellistica
Un *sistema* è definito come un ente (fisico o astratto) costituito dall'interconnessione di parti elementari che interagiscono tra loro secondo il principio di azione e reazione

In ambito ingegneristico, lo studio di un sistema si focalizza su tre problematiche principali:

- *Previsione*: Noti il modello S e l'ingresso $u(dot)$, determinare l'uscita $y(dot)$

- *Controllo*: Noti il modello S e l'uscita desiderata $y_("des")(dot)$, determinare l'ingresso $u(dot)$ idoneo

- *Identificazione*: Noti l'ingresso $u(dot)$ e l'uscita $y(dot)$, determinare il modello matematico S

== Rappresentazione Matematica
Il comportamento è descritto da un insieme di relazioni che legano l'ingresso $u(t)$ (causa) all'uscita $y(t)$ (effetto/reazione)

== Notazione
$ u(dot), y(dot) arrow.r.double.long "funzioni di ingresso e di uscita" $
$ u(t), y(t) arrow.r.double.long "valori dell'ingresso e dell'uscita all'istante t" $

= Sistemi Statici vs. Sistemi Dinamici
La prima grande classificazione riguarda la dipendenza temporale delle variabili

== Sistemi Statici
In un sistema statico, il legame tra ingresso e uscita è *istantaneo*. L'uscita al tempo $t$ dipende esclusivamente dal valore dell'ingresso al medesimo istante:
$ y(t) eq g(u(t)) $
- *Esempio classico*: Il resistore ideale, dove $v_R (t) eq R dot i_R (t)$. Possiamo scriverlo anche nel seguente modo: 
    $ u(t) eq i_R (t) $
    $ y(t) eq v_R (t) eq R dot i_R (t) = g(u(t)), forall t $

== Sistema Dinamico
Un sistema si definisce dinamico quando l'uscita al tempo $t$ dipende dalla "storia" passata dell'ingresso, ovvero dai valori assunti nell'intervallo $(-infinity, t]$: 
    $ y(t) eq g(u((-infinity, t])) $
- *Esempio classico*: Il condensatore ideale, la cui tensione dipende dall'integrale della corrente nel tempo. Possiamo scriverlo nel seguente modo:
    $ u(t) eq i_C (t) eq C dot (d v_C (t))/ "dt" $
    $ y(t) eq v_C (t) eq 1/C integral_(-infinity)^(t) i_C (sigma) d sigma eq 1/C integral_(-infinity)^(t) u(sigma) d sigma eq g(u(]-infinity, t])), forall t $

= Il Concetto di Stato
Per rendere trattabile matematicamente un sistema dinamico senza dover conoscere l'intera storia passata, introduciamo la variabile *stato* $x(tau)$

Lo stato è il "vettore memoria" che racchiude tutta l'informazione necessaria a determinare l'evoluzione futura del sistema, dati gli ingressi futuri


Riscriviamo l'esempio del condensatore facendo uso della variabile *stato* $x(tau)$:
$ u(t) eq i_C (t) eq C dot (d v_C (t))/ "dt" $
$ y(t) eq v_C (t) eq 1/C integral_(-infinity)^(t) i_C (sigma) d sigma $
Adesso definiamo: 
$ x(tau) eq 1/C integral_(-infinity)^(tau) i_C (sigma) d sigma eq v_C (tau) $
Otteniamo:
$ y(t) eq 1/C integral_(-infinity)^(tau) i_C (sigma) d sigma + 1/C integral_(-infinity)^(t) i_C (sigma) d sigma $
Che possiamo riscrivere come:
$ y(t) eq x(tau) + 1/C integral_(-infinity)^(t) u(sigma) d sigma eq g(x(tau), u([tau, t])), forall t gt.eq tau $

= Definizione Assiomatica di Sistema Dinamico
Un sistema dinamico è un ente matematico definito da una "ottupla" di elementi:
$ S(T, U, Omega, X, Y, Gamma, phi, eta) $
Gli insiemi fondamentali:
- *T*: L'insieme ordinato dei tempi (continuo o discreto)
- *U*: L'insieme dei valori che può assumere l'ingresso $u$
- $Omega$: L'insieme delle funzioni di ingresso ammissibili nel tempo
- X: Lo spazio di stato (l'insieme dei valori assunti dallo stato $x$)
- Y: L'insieme dei valori assunti dall'uscita $y$
- $Gamma$: L'insieme delle funzioni di uscita

Per cui sono definita le seguenti funzioni $phi, eta$ che ne determinano la *rappresentazione di stato* (o *rappresentazione ingresso-stato-uscita*)
\
\
\
\
\

== Le Funzioni Caratteristiche
La dinamica del sistema è governata da due funzioni principali:

=== Funzione di Transizione dello Stato ($phi$)
Descrive l'evoluzione temporale dello stato (chiamata anche *movimento dello stato*). La formula generale è:
$ x(t) eq phi(t, tau, x(tau), u(dot)) $

Dove:
- $t$: istante finale

- $tau$: istante iniziale (con $tau lt.eq t$)

- $x(tau)$: valore iniziale dello stato (la condizione di partenza)

- $u(dot)$: la funzione d'ingresso applicata nell'intervallo $[tau, t]$

Per essere valida, questa funzione deve soddisfare quattro proprietà matematiche fondamentali: *consistenza, irreversibilità, composizione e causalità*



=== Funzione di Uscita ($eta$)
Descrive l'evoluzione dell'uscita, definita anche come *movimento dell'uscita* o *risposta*. Si presenta in due forme:
- $y(t) eq eta(t, x(t), u(t))$: L'uscita dipende sia dallo stato che dall'ingresso istantaneo (sistama improprio, non fisicamente realizzabile)

- $y(t) eq eta(t, x(t))$: L'uscita dipende solo dallo stato (sistema proprio, fisicamente realizzabile)

== Realizzabilità Fisica
- *Sistema Proprio*: È un sistema *fisicamente realizzabile*. In questo caso, la funzione di uscita $eta$ è una funzione *istantanea* (statica) dello stato  e dell'eventuale ingresso attuale

- *Sistema Improprio*: È un sistema *non fisicamente realizzabile*. Questo accade tipicamente quando l'uscita dipende da valori futuri dell'ingresso o da derivate dell'ingresso che non possono essere calcolate istantaneamente senza rumore infinito




= I Cinque Criteri di Classificazione
Per classificare correttamente un sistema, dobbiamo analizzare cinque caratteristiche chiave dei suoi insiemi e delle sue funzioni

== Insieme dei Tempi (T)
- *Tempo Continuo*: Se $T subset.eq RR$. Le equazioni che governano il sistema sono equazioni differenziali

- *Tempo Discreto*: Se $T subset.eq ZZ$. Il sistema evolve a istanti prefissati (indicati con k) e le leggi sono espresse tramite equazioni alle differenze finite

== Insieme dei Valori di Ingresso e Uscita (U, Y)
- *SISO (Single Input - Single Output)*: Il sistema ha un solo ingresso e una sola uscita ($p eq q eq 1$)

- *MIMO (Multiple Input - Multiple Output)*: Il sistema è multivariabile, con più ingressi e/o più uscite ($p gt 1$ e/o $q gt 1$)

- *Sistemi Quantizzati*: Se gli insiemi dei valori sono discreti

\

== Dimensione dello Stato (X)
- *Dimensione Finita (Parametri Concentrati)*: Lo stato è descritto da un numero finito $n$ di variabili (vettore in $RR^n$). Nei sistemi a tempo continuo, si usano equazioni differenziali ordinarie (ODE)

- *Dimensione Infinita (Parametri Distribuiti)*: Lo stato richiede un numero infinito di variabili. In questo caso, si utilizzano equazioni differenziali alle derivate parziali (PDE)

== Linearità delle Funzioni ($phi, eta$)
Un sistema è *Lineare* se le funzioni di transizione e di uscita soddisfano il principio di sovrapposizione degli effetti rispetto a stato e ingresso
- *Sistema Lineare*: Le equazioni assumono la forma $dot(x) eq A(t)x + B(t)u$ e $y = C(t)x + D(t)u$

- *Sistema Non Lineare*: Se compaiono termini come $x^2, sin(x)$ o prodotti tra variabili $x dot u$

== Stazionarietà (Invarianza Temporale)
- *Stazionario (Tempo-Invariante)*: Se le funzioni $phi$ e $eta$ non dipendono esplicitamente dal tempo $t$. I parametri del sistema (le matrici A, B, C, D) sono costanti. Questo può essere espresso dicendo che:
$ phi(t, tau, x^*, u(dot)) eq phi(t + Delta tau, tau Delta tau, x^*, u^(Delta tau)(dot)) $

$ y(t) eq eta(x(t), u(t)) $

Essendo 
$ u^(Delta tau)(dot)) eq u(sigma - Delta tau), forall sigma in [tau + Delta tau, t + Delta tau], Delta tau gt.eq 0 $

- *Non Stazionario (Tempo-Variante)*: Se i parametri del sistema cambiano nel tempo (es. un coefficiente $k$ che moltiplica lo stato)

= Sistemi Dinamici a Tempo Continuo
Nei sistemi a tempo continuo, le variazioni avvengono in ogni istante infinitesimo. Per questo motivo, la matematica di riferimento è quella delle *equazioni differenziali*

== Caso Generale (Non Lineare, Tempo-Variante)
Il movimento dello stato $x(t)$ è la soluzione di un sistema di $n$ equazioni differenziali ordinarie del primo ordine

- *Equazione di stato*: 
$ dot(x)(t) eq (d x(t))/"dt" eq f(t, x(t), u(t)) $

- *Equazione di uscita*:
$ y(t) eq g(t, x(t), u(t)) $

== Caso Lineare
Se il sistema è lineare, le funzioni $f$ e $g$ diventano combinazioni lineari di stato $x(t)$ e ingresso $u(t)$. Introdotte le matrici, abbiamo:

\
\
\
\

- *Equazione di stato*:
$ dot(x)(t) eq A(t)x(t) + B(t)u(t) $
    - $A(t) in RR^(n times n)$: Matrice di stato (descrive la dinamica interna)
    - $B(t) in RR^(n times p)$: Matrice degli ingressi (descrive come gli ingressi influenzano le derivate dello stato)

- *Equazione di uscita*:
$ y(t) eq C(t)x(t) + D(t)u(t) $
    - $C(t) in RR^(q times n)$: Matrice delle uscite (lega lo stato all'uscita)
    - $D(t) in RR^(q times p)$: Matrice del legame diretto ingresso-uscita

== Caso Lineare Tempo-Invariante (LTI)
Questa è la forma più importante. Le equazioni sono lineari e *a coefficienti costanti* (le matrici non dipendono più dal tempo $t$)

L'evoluzione temporale dello stato è descritta da $n$ equazioni differenziali lineari in $x(t)$ e $u(t)$ *a coefficienti costanti*:
$ hat(x)(t) eq A x(t) + B u(t) $

L'evoluzione temporale dell'uscita è descritta da $q$ equazioni lineari in $x(t), u(t)$ *a coefficienti costanti*:
$ y(t) eq C x(t) + D u(t) $

Con A, B, C, D matrici costanti

= Sistemi Dinamici a Tempo Discreto
Se compioniamo un sistema (ad esempio tramite un microcontrollore), il tempo avanza a scatti discreti $k$. Qui abbandoniamo le derivate e passiamo alle *equazioni alle differenze finite*. Invece di calcolare la "velocità di variazione" $dot(x)$, calcoliamo direttamente "il valore dello stato al passo successivo" $x(k + 1)$

== Caso Generale (Non Lineare, Tempo-Variante)
- *Equazione di stato*: 
$ x(k + 1) eq f(k, x(k), u(k)) $

- *Equazione di uscita*: 
$ y(k) eq g(k, x(k), u(k)) $

== Caso Lineare
Analogamente al caso continuo, introduciamo matriche che però dipendono dall'istante discreto $k$
- *Equazione di stato*: 
$ x(k + 1) eq A(k)x(k) + B(k)u(k) $

- *Equazione di uscita*: 
$ y(k) eq C(k)x(k) + D(k)u(k) $

Le dimensioni delle matrici A(k), B(k), C(k), D(k) rimangono le medesime viste sopra

== Caso Lineare Tempo-Invariante (LTI)
Ancora una volta, se i parametri del sistema non cambiano nel tempo, i coefficienti delle equazioni diventano costanti
- *Equazione di stato*: 
$ x(k + 1) eq A x(k) + B u(k) $

- *Equazione di uscita*: 
$ y(k) eq C x(k) + D u(k) $