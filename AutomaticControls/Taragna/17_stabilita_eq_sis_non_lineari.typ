#import "../../template.typ": *

#show : project.with(
  title: "Stabilità dell'equilibrio di sistemi dinamici non lineari per linearizzazione",
  course: "Controlli Automatici"
)

= Introduzione e Definizione del Problema
== Premessa Generale
A differenza dei sistemi *LTI* (Lineari Tempo-Invarianti), dove la stabilità è una proprietà _globale_ del sistema (valida per qualsiasi stato ed ingresso), nei sistemi non lineari la stabilità è una proprietà *locale*. Essa è definita in un *intorno del punto di equilibrio* specifico considerato. Lo strumento per questa analisi è il *Metodo Indiretto di Lyapunov*, noto anche come *Metodo di Linearizzazione*

== Formulazione Matematica (Tempo Continuo)
Si consideri un sistema dinamico MIMO, stazionario, a tempo continuio, descritto dall'equazione di stato vettoriale:
$ dot(x) (t) eq f(x(t), u(t)) $

Definiamo due condizioni operative per il sistema:
+ *Movimento Nominale (Equilibrio)*: Il sistema è sollecitato da un ingresso costante d'equilibrio $u(t) eq dash(u)$ e si trova in uno stato iniziale d'equilibrio $x(0) eq dash(x)$ \ Per definizione di punto di equilibrio, lo stato rimane costante nel tempo: $ dot(dash(x)) eq f(dash(x), dash(u)) eq 0 $

+ *Movimento Perturbato*: Applichiamo lo _stesso_ ingresso nominale $dash(u)$, ma partiamo da uno stato iniziale _differente_ (perturbato) $x(0) eq x_0 eq.not dash(x)$. L'evoluzione $x(t)$ soddisferà l'equazione: $ dot(x)(t) eq f(x(t), dash(u)), space.en space.en space.en x(0) eq x_0 $

== Dinamica della Perturbazione $delta x(t)$
Per studiare se il sistema tende a ritornare verso $dash(x)$ o ad allontanarsene, definiamo il vettore *perturbazione dello stato*:
$ delta x(t) eq.delta x(t) - dash(x) space.en space.en space.en arrow.r.long.double space.en space.en space.en x(t) eq dash(x) + delta x(t) $

L'evoluzione differenziale della perturbazione è data da:
$ delta dot(x)(t) eq d/(d t)(x(t) - dash(x)) eq dot(x)(t) - 0 eq f(x(t), dash(u)) eq f(dash(x) + delta x(t), dash(u)) $

con condizione iniziale $delta x(0) eq delta x_0 eq.not 0$

Questa equazione differenziale è *non lineare* nella variabile $delta x(t)$. In generale, la sua soluzione esplicità è ardua da determinare analiticamente. Inoltre, la dinamica della perturbazione dipende esplicitamente da $dash(x)$ e $dash(u)$, confermando la natura *locale* dello studio. Questa è la differenza sostanziale rispetto ai sistemi LTI, dove l'equazione $delta dot(x) eq A delta x$ è valida ovunque nello spazio di stato

= Il Metodo di Linearizzazione
== Sviluppo in Serie di Taylor
Per aggirare la difficoltà di risolvere l'equazione non lineare $delta dot(x)(t) eq f(dash(x) + delta x(t), dash(u))$, si ricorre al *Metodo Indiretto di Lyapunov*. L'idea carine è approssimare la dinamica della perturbazione nell'intorno del punto di equilibrio

Consideriamo la funzione vettoriale $f(x, dash(u))$ e sviluppiamola in *Serie di Taylor* attorno al punto nominale $x eq dash(x)$, considerando $dash(u)$ costante (parametro):
$ f(dash(x), delta x(t), dash(u)) eq f(dash(x), dash(u)) + evaluated((partial f(x, dash(u)))/(partial x))_(x eq dash(x)) delta x(t) + h(delta x(t)) $

Dove:
- $f(dash(x), dash(u)) eq 0$ per definizione di equilibrio

- $evaluated((partial f(x, dash(u)))/(partial x))_(x eq dash(x))$ è la *Matrice Jacobiana* di $f$ rispetto allo stato $x$, valutata nell'equilibrio

- $h(delta x(t))$ è il *resto di Peano*, contenente termini di ordine superiore al primo (ovvero infinitesimi di ordine $norm(delta x)^2$ o superiroe). Essenzialmente è una funzione che contiene potenze di $delta x(t)$ di grado superiore al primo

Sostituendo, l'equazione della perturbazioen diventa:
$ delta dot(x)(t) eq underbrace(evaluated((partial f(x, dash(u)))/(partial x))_(x eq dash(x)), A) delta x(t) + h(delta x(t)) $

== Sistema Linearizzato
L'ipotesi fondamentale del metodo di linearizzazione è che, per *piccole perturbazioni iniziali* (cioè in un intorno sufficientemente piccolo di $dash(x)$), il termine non lineare $h(delta x(t))$ sia trascurabile rispetto al termine lineare $A delta x(t)$

In tal caso, la dinamica della perturbazione è *approssimata* dal seguente sistema LTI:
$ delta dot(x) approx A delta x(t) $

dove la matrice di stato $A in RR^(n times n)$ è definita come:
$ A eq.delta evaluated((partial f(x, dash(u)))/(partial x))_(x eq dash(x)) eq mat(delim: "[", 
  (partial f_1)/(partial x_1), dots, (partial f_1)/(partial x_n);
  dots.v, dots.down, dots.v;
  (partial f_n)/(partial x_1), dots, (partial f_n)/(partial x_n);
) $

La matrice $A$ è il *Jacobiano* del campo vettoriale $f$ valutato all'equilibrio. Essa rappresenta la *migliore approssimazione lineare* del sistema nell'intorno di quel punto. Lo studio degli autovalir di questa matrice $A$ ci fornirà informazioni sulla stabilità _locale_ del sistema non lineare originale

= Criteri di Stabilità Locale per Sistemi a Tempo Continuo
== Condizione Sufficiente di Asintotica Stabilità (Teorema di Lyapunov Indiretto)
Sia $dash(x)$ uno stato di equilibrio per il sistema non lineare $dot(x) eq f(x, dash(u))$, sia $A$ la matrice Jacobiana del sistema linearizzato nell'intorno di tale equilibrio

*Enunciato*: \
Condizione (soltanto) sufficiente affinchè $dash(x)$ risulti *localmente asintoticamente stabile* è che tutti gli autovalori della matrice $A$ abbiano parte reale strettamente negativa:
$ forall i in {1, dots, n}, space.en space.en space.en Re(lambda_i (A)) lt 0 $

*Giustificazione euristica*: \
Se $Re(lambda_i (A)) lt 0$, il sistema linearizzato $delta dot(x) eq A delta x$ è asintoticamente stabile. La soluzione $delta x(t)$ tende esponenzialmente a zero per $t arrow.r infinity$. Poichè $delta x(t)$ diventa "piccola", il termine non lineare $h(delta x(t))$, che è di ordine superiore, diventa _ancora più piccolo_ e la sua influenza svanisce nel tempo. Esiste pertanto un intorno $I_dash(x)$ del punto di equilibrio all'interno del quale il sistema non lineare segue fedelmente il comportamento del sistema linearizzato, garantendo la convergenza asintotica all'equilibrio

== Condizione Sufficiente di Instabilità
*Enunciato*: \
Condizione (soltanto) sufficiente affinchè $dash(x)$ risulti *localmente instabile* è che esista almeno un autovalore della matrice $A$ con parte reale strettamente positiva:
$ exists k in {1, dots, n}, space.en space.en space.en Re(lambda_k (A)) gt 0 $

*Giustificazione euristica*: \
Se esiste un autovalore a parte reale positiva, il sistema linearizzato presenta una dinamica esponenzialmente divergente in almeno una direzione dello spazio di stato. Anche se il termine non lineare $h(delta x(t))$ iniziasse a farsi sentire quando la traiettoria si allontana dall'equilibrio, esso non può "tirare indietro" una traiettoria che ha già acquisito una componente divergente. La non linearità può al massimo far sì che la traiettoria diverga verso un altro attrattore (es. ciclo limite) o vada a saturazione, ma non può ristabilire la stabilità nell'intorno del punto di equilibrio considerato. Il punto è dunque instabile

== Il Caso Critico
*Enunciato*: \
Se la matrice $A$ del sistema linearizzato soddisfa entrambe le seguenti condizioni:
+ Nessuno autovalore ha parte reale positiva: $forall i in {1, dots, n}, Re(lambda_i (A)) lt.eq 0$

+ Esiste almeno un autovalore con parte reale esattamente nulla: $exists k, Re(lambda_k (A)) eq 0$ (ad esempio, coppie di autovalori immaginari puri o autovalori nell'origine)

Allora *il metodo di linearizzazione fallisce*. Non è possibile trarre alcuna conclusione sulla stabilità locale del sistema non lineare originario basandosi sulla sola matrice $A$

*Spiegazione fisico-matematica*: \
In questo scenario, il comportamento del sistema linearizzato è *marginalmente stabile* o *semplicemente stabile* (né divergenza esponenziale, né convergenza asintotica). In queste condizioni, il termine non lineare $h(delta x(t))$, per quanto piccolo, non è più trascurabile sul lungo periodo. Sono proprio i termini di ordine superiore a determinare se la traiettoria del sistema non lineare spirali lentamente verso l'equilibrio (stabile), vi ruoti attorno all'infinito (semplicemente stabile) o diverga lentamente (instabile)

Per risolvere i casi critici è necessario ricorrere a metodi più avanzati, quali il *Metodo Diretto di Lyapunov* (ricerca di una funzione di Lyapunov) o il *Teorema della Varietà Centrale*

== Analogia con Monotonicità di una Funzione Scalare
Per comprendere il fallimento del caso critico, si propone un'analogia.

+ *Analisi Non Lineare*: Si vuole studiare la monotonicità locale di $y eq f(x)$ in un punto

+ *Linearizzazione*: Si calcola la pendenza $rho eq f^' (x_0)$ della retta tangente

+ *Casi Risolti*:
  - Se $rho gt 0$: La funzione è localmente crescente (Analogo a $Re(lambda) lt 0$ per la stabilità)

  - Se $rho lt 0$: La funzione è localmente decrescente (Analogo a $Re(lambda) gt 0$ per instabilità)

+ *Caso Critico*:
  - Se $rho eq 0$ (Tangente orizzontale): Non si può dire nulla. La funzione potrebbe avere un massimo, un minimo o un flesso a tangente orizzontale. La risposta è celata nei termini di ordine superiore dello sviluppo di Taylor ($f^'' (x_0)$)

= Stabilità dell'Equilibrio per Sistemi a Tempo Discreto
== Formulazione Matematica del Problema (Tempo Discreto)
Si consideri ora un sistema dinamico MIMO, stazionario, a *tempo discreto*, descritto dall'equazione:
$ x(k + 1) eq f(x(k), u(k)) $

Analogamente al caso continuo, definiamo:
+ *Movimento Nominale (Equilibrio)*: Ingresso costante $dash(u)$ e stato iniziale $dash(x)$. All'equilibrio, lo stato non evolve, quindi si ha la condizione algebrica: $ dash(x) eq f(dash(x), dash(u)) $

+ *Movimento Perturbato*: Stesso ingresso $dash(u)$, stato iniziale differente $x(0) eq x_0 eq.not dash(x)$. \ L'evoluzione soddisfa: $ x(k + 1) eq f(x(k), dash(u)), space.en space.en space.en x(0) eq x_0 $

== Dinamica della Perturbazione $delta x(k)$
Definiamo il vettore perturbazione dello stato al passo k-esimo:
$ delta x(k) eq.delta x(k) - dash(x), space.en space.en space.en arrow.r.long.double space.en space.en space.en x(k) eq dash(x) + delta x(k) $

L'evoluzione della perturbazione è governata dalla seguente *equazione alle differenze*:
$ delta x(k + 1) eq x(k + 1) - dash(x) \  eq f(x(k), dash(u)) - dash(x) \ eq f(dash(x) + delta x(k), dash(u)) - dash(x) $

con condizione iniziale $delta x(0) eq x_0 - dash(x) eq delta x_0 eq.not 0$

Si osservi la sottile differenza con il caso continuo. Nel caso a tempo discreto, l'equazione alle differenze incluede il termine sottrattivo "$- dash(x)$", coerentemente con il fatto che $f(dash(x), dash(u)) eq dash(x)$ (e non zero come nel caso a tempo continuo)

== Linearizzazione nel Caso Discreto
Si procede con lo *Sviluppo in Serie di Taylor* della funzione $f(dash(x) + delta x(k), dash(u))$ attorno al punto di equilibrio $dash(x)$:
$ f(dash(x) + delta x(k), dash(u)) eq f(dash(x), dash(u)) + evaluated((partial f(x, dash(u)))/(partial x))_(x eq dash(x)) delta x(k) + h(delta x(k)) $

Ricordando che $f(dash(x), dash(u)) eq dash(x)$ per definizione di equilibrio, e sostituendo nell'equazione della perturbazione, si ottiene:
$ delta x(k + 1) eq [dash(x) + A delta x(k) + h(delta x(k))] - dash(x) eq A delta x(k) + h(delta x(k)) $

dove $A$ è ancora una volta la *Matrice Jacobiana* di $f$ rispetto allo stato $x$, valutata nel punto di equilibrio ($dash(x), dash(u)$):
$ A eq.delta evaluated((partial f(x, dash(u)))/(partial x))_(x eq dash(x)) $

È interessante notale che, nonostante la diversa natura dell'equazione di stato, la matrice $A$ del sistema linearizzato si calcola esattamente con la stessa formula del caso continuo: *Jacobiano di $f$ rispetto ad $x$, valutato nell'equilibrio*

== Il Sistema Linearizzato a Tempo Discreto
Trascurando i termini di ordine superiore $h(delta x(k))$ per piccole perturbazioni, la dinamica è approssimata dal sistema LTI a tempo discreto:
$ delta x(k + 1) approx A delta x(k) $

Lo studio della stabilità locale dell'equilibrio $dash(x)$ per il sistema non lineare a tempo discreto si riduce, ove possibile, all'analisi degli autovalori di questa matrice $A$

= Criteri di Stabilità Locale per Sistemi a Tempo Discreto
== Condizione Sufficiente di Asintotica Stabilità (Tempo Discreto)
Sia $dash(x)$ uno stato di equilibrio per il sistema non lineare a tempo discreto $x(k + 1) eq f(x(k), dash(u))$, e sia $A$ la matrice Jacobiana del sistema linearizzato

*Enunciato*: \
Condizione (soltanto) sufficente affinche $dash(x)$ risulti *localmente asintoticamente stabile* è che tutti gli autovalori della matrice $A$ abbiano *modulo strettamente minore di 1*:
$ forall i in {1, dots, n}, space.en space.en space.en abs(lambda_i (A)) lt 1 $

*Giustificazione euristica*: \
Nel dominio discreto, la condizione di stabilità asintotica per un sistema LTI è che gli autovalori giacciano *all'interno del cerchio unitario* nel piano complesso. Se tale condizione è soddisfatta, la risposta libera del sistema linearizzato $delta x(k) eq A^k delta x_0$ tende a zero per $k arrow.r infinity$. Come nel caso continuo, la convergenza a zero della perturbazione rende il termine non lineare $h(delta x(k))$ sempre più trascurabile, garantendo che il comportamento del sistema non lineare sia dominato dalla dinamica lineare stabile

== Condizione Sufficiente di Instabilità (Tempo Discreto)
*Enunciato*: \
Condizione (soltanto) sufficiente affinchè $dash(x)$ risulti *localmente instabile* è che esista almeno un autovalore della matrice $A$ con *modulo strettamente maggiore di 1*:
$ exists k in {1, dots, n}, space.en space.en space.en abs(lambda_k (A)) gt 1 $

*Giustificazione euristica*: \
Un autovalore esterno al cerchio unitario implica che il sistema linearizzato presenta una dinamica esponenzialmente divergente (almeno in una direzione). La divergenza della componente lineare non può essere compensata dai termini non lineari $h(delta x(k))$ nell'intorno dell'equilibrio. Di conseguenza, la traiettoria perturbata si allontanerà irreversibilmente da $dash(x)$, rendendo l'equilibrio instabile

== Il Caso Critico per Sistemi a Tempo Discreto
*Enunciato*: \
Se la matrice $A$ del sistema linearizzato soddisfa entrambe le seguenti condizioni:
+ Nessun autovalore ha modulo maggiore di 1: $forall i, abs(lambda_i (A)) lt.eq 1$

+ Esiste almeno un autovalore con modulo *esattamente unitario*: $exists k, abs(lambda_k (A)) eq 1$

Allora *il metodo di linearizzazione fallisce*: Non è possibile trarre alcuna conclusione sulla stabilità locale del sistema non lineare originario

*Spiegazione fisico-matematica*: \
Nel caso discreto, la frontiera del cerchio unitario ($abs(lambda) eq 1$) corrisponde all'asse immaginario ($Re(lambda) eq 0$) del caso continuo. Autovalori sul cerchio unitario (es. $lambda eq plus.minus 1$ o coppie complesse coniugate $e^(plus.minus j theta)$) produco nel sistema linearizzato modi che non convergono a zero né divergono all'infinito (modi persistenti i oscillatori). In questo condizioni marginali, i termini non lineari $h(delta x(k))$, sebbene piccoli, determinano il percorso asintotico della traiettoria. L'analisi richiede strumenti più sofisticati (Metodo Diretto di Lyapunov, Teoria delle Biforcazioni)

Si presti particolare attenzione all'autovalore $lambda eq 1$ (analogo all'autovalore nullo nel tempo continuo). e all'autovalore $lambda eq -1$ (fenomeno tipicamente discreto di oscillazione alternata). Entrambi ricadono nel caso critico e impediscono una conclusione tramite sola linearizzazione