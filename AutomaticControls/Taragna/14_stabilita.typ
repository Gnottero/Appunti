#import "../../template.typ": *

#show : project.with(
  title: "Stabilità Interna di Sistemi Dinamici",
  course: "Controlli Automatici"
)

= Introduzione
Dopo aver capito come calcolare i punti di equilibrio e come analizzare un sistema, dobbiamo porci un'ulteriore domanda: *"Questo equilibrio è robusto?"*

Cosa succede se una perturbazione sposta il nostro sistema dal suo punto stazionario? Torna al suo posto, inizia ad oscillare all'infinito o precipita?

== Definizioni di Stabilità e Instabilità
- Un sistema è detto *stabile* se la sua evoluzione è poco sensibile a perturbazioni sullo stato iniziale, per cui piccole perturbazioni iniziali danno luogo a piccole variazioni nella sua successiva evoluzione

- Un sistema è detto *instabile* se la sua evoluzione è molto sensibile a perturbazioni sullo stato iniziale, per cui piccole perturbazioni iniziali allontanano decisamente la sua successiva evoluzione dalla situazione dinamica corrispondente all'assenza di perturbazioni 

= L'Intuizione di Lyapunov e il Concetto di Perturbazione
Alla fine dell'Ottocento, il matematico russo Lyapunov formalizzò questo concetto. L'idea fondamentale è studiare la sensibilità del sistema alle variazioni dello *stato iniziale* (supponendo che gli ingressi e i parametri restino costanti e noti)

Immaginiamo due scenari:
- *Movimento Nominale $tilde(x)(t)$*: generato da uno stato iniziale nominale $tilde(x)_0$ e da un ingresso nominale $tilde(u)(t)$

- *Movimento Perturbato $x(t)$*: generato dallo stesso ingresso $tilde(u)(t)$ ma da uno stato iniziale differente $x_0 eq.not tilde(x)_0$

Definiamo la *perturbazione iniziale* come la norma della differenza tra gli stati iniziali:
$ norm(delta x(t_0 eq 0)) eq norm(x_0 - tilde(x)_0) $

Definiamo la *perturbazione all'istante t* come:
$ norm(delta x(t)) eq norm(x(t) - tilde(x)(t)) $

Sulla base dell'evoluzione nel tempo di questa norma $norm(delta x(t))$, un movimento nominale $tilde(x)(t)$ viene classificato nei seguenti modi:

== Movimento Stabile
Un movimento $tilde(x)(t)$ si dice stabile se, per ogni tolleranza prefissata $epsilon gt 0$, esiste un limite alla perturbazione iniziale $gamma gt 0$ tale per cui: se si sceglie un qualsiasi stato iniziale $x_0$ tale che $norm(delta x(t_0 eq 0)) lt gamma$, allora l'evoluzione della perturbazione rispetterà la condizione $norm(delta x(t)) lt.eq epsilon$ per ogni istante di tempo $t gt.eq 0$

*Significato formale*: Possiamo sempre "ingabbiare" la traiettoria perturbata in un tubo di raggio $epsilon$ (grande a piacere), a patto di far partire il sistema da un intorno sufficientemente piccolo (raggio $epsilon$) dello stato nominale

== Movimento Instabile
Un movimento $tilde(x)(t)$ è instabile se semplicemente non soddisfa la condizione di stabilità appena descritta.

*Formalmente*: esiste almeno un $epsilon gt 0$ tale che, per *qualsiasi* $gamma gt 0$ scelto, esiste sempre almeno uno stato iniziale $x_0$ nell'intorno $norm(delta x(t)) lt.eq gamma$ per cui la traiettoria "buca" il tubo di tolleranza, ovvero esiste un istante $t gt.eq 0$ in cui $norm(delta x(t)) gt epsilon$

== Movimento Asintoticamente Stabile
Un movimento $tilde(x)(t)$ si dice asintoticamente stabile se soddisfa *due* condizioni:
+ È un movimento *Stabile* (deve valere la devinizione $1$ con $epsilon$ e $gamma$)

+ La perturbazione tende ad annullarsi per il tempo che tende all'infinito:
$ lim_(t arrow.r infinity) norm(delta x(t)) eq lim_(t arrow.r infinity) norm(x(t) - tilde(x)(t)) eq 0 $

== Movimento Globalmente Asintoticamente Stabile
Un movimento si dice _globalmente_ asintoticamente stabile se:
+ È stabile

+ Il limite $lim_(t arrow.r infinity) norm(delta x(t)) eq 0$ risulta verificato *per qualsiasi stato iniziale* $x_0 in X$ (ovvero lo spazio degli stati), quale che sia l'entità della perturbazione iniziale

== Movimento Semplicemente Stabile
Un movimento si definisce semplicemente stabile se risulta stabile (condizione $1$ verificata), ma non asintoticamente (condizione del limite non verificata)

Per i *Sistemi a Tempo Discreto (TD)*: Valgono esattamente le stesse definizioni e i medesimi costrutti logici, con l'unica differenza formale di sostituire la variabile tempo continuo $t$ con l'indice dei campioni discreto $k$

= Stabilità dell'Equilibrio e Regione di Attrazione
Queste definizioni diventano fondamentali quando il "movimento nominale" che stiamo analizzando è uno *Stato di Equilibrio $dash(x)$*, generato da un ingresso costante $dash(u)$

Poichè un sistema non lineare può presentare molteplici stati di equilibrio con caratteristiche diverse, lo studio della stabilità è tipicamente un'analisi *"locale"*

In questo contesto si definisce la *Regione di Attrazione* (o regione di asintotica stabilità): essa è associata esclusivamente a uno stato di equilibrio asintoticamente stabile, ed è costituita dall'insieme di tutti quegli specifici stati iniziali $x_0$ che danno origine a movimento perturbati che convergono asintoticamente proprio a quello stato di equilibrio

Infine, un teorema fondamentale per l'analisi dei sistemi attesta che: in corrispondenza di un dato ingresso di equilibrio $tilde(u)$, un sistema dinamico può ammettere *al più un unico stato di equilibrio globalmente asintoticamente stabile* (se ne ammettesse due o più, ci sarebbero stati iniziali da cui il sistema non saprebbe verso quale dei due convergere)
