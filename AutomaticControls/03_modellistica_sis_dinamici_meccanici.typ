#import "../template.typ": *

#show : project.with(
  title: "Modellistica dei Sistemi Dinamici Meccanici",
  course: "Controlli Automatici"
)

= Introduzione
La trattazione dei sistemi meccanici si divide tipicamente in due grandi famiglie:

+ *Sistemi in traslazione* (movimento lungo una traiettoria lineare)

+ *Sistemi in rotazione* (movimento angolare attorno a un asse)

= I Componenti Fondamentali dei Sistemi in Traslazione
Proprio come nei circuiti avevamo resistori, condensatori e induttori, nella meccanica traslazionale abbiamo tre elementi base. Ognuno di essi reagisce in modo diverso alle forze applicate

== Il Corpo Puntiforme (Massa $M$)
Rappresenta l'elemento inerziale del sistema, colui che si oppone alle variazioni di velocità. La sua dinamica è governata direttamente dalla *Seconda Legge di Newton*: 
$ M dot.double(p) (t) eq M (d^2 p(t))/(d t^2) eq sum_i F_i(t) $
Dove:

- $p(t)$ è la posizione del corpo

- $dot.double(p) (t)$ (derivata seconda della posizione) è l'accelerazione

- $F_i (t)$ sono le forze esterne applicate. Ricorda la convenzione dei segni: positive se concordi con il verso scelta per l'asse di riferimento, negative altrimenti

== La Molla Ideale (Costante Elastica $K$)
La molla è l'elemento in grado di immagazzinare energia potenziale elastica. La forza che essa genera (o subisce) non dipende dalla velocità, ma esclusivamente dallo *spostamento relativo* dei suoi due estremi:
$ F(t) eq K [p_+ (t) - p_- (t)] $
Dove:

- $K$ è la rigidezza della molla (espressa in $N/m$)

- $p_+$ e $p_-$ sono le posizioni delle due estremità rispetto alla loro posizione di riposo

== Lo Smorzatore Ideale (Coefficiente di Smorzamento viscoso $beta$)
Lo smorzatore (pensa all'ammortizzatore di un'auto o a un pistone in un fluido viscoso) è l'elemento dissipativo per eccellenza. A differenza della molla, la forza d'attrito che genera si oppone al moto ed è proporzionale alla *velocità relativa* dei suoi due estremi

$ F(t) eq beta [v_+ (t) - v_- (t)] eq beta[dot(p)_+(t) - dot(p)_-(t)] $
Dove:

- $beta$ è il coefficiente di smorzamento (espresso in $N s/m$)

- $dot(p)_+$ e $dot(p)_- $ sono le velocità delle due estremità

\
\
\

= Equazioni del Moto per Sistemi in Traslazione
Descriviamo ora le *Equazioni del Moto* per i sistemi in traslazione. Questa è un procedura che ci permette di tradurre un disegno meccanico in un modello matematico

La regola fondamentale, prima di scrivere qualsiasi formula, è introdurre sempre degli assi di riferimento concordi per indicare le posizioni $p_i$ e le velocità $v_i eq dot(p_i)$ di ogni corpo in traslazione

Una volta fissato il riferimento, per ogni massa $M_i$ (o nodo di interconnessione se la massa è nulla) dobbiamo scrivere l'equazione di bilancio derivata dalla *Seconda Legge di Newton*:
$ M_i dot.double(p_i) (t) eq sum_k F^"est"_k (t) - sum_(j eq.not i) F^"int"_"ij" (t) $

Analizziamo i due termini a secondo membro, perchè è qui che si nasconde il significato fisico

== Le Forze Esterne ($F^"est"$)
Le forze esterne rappresentano l'azione del mondo esterno direttamente sulla massa $M_i$ che stiamo analizzando

- Compaiono nell'equazione con *segno positivo* se il loro verso concorda con l'asse di riferimento che abbiamo scelto, e con *segno negativo* in caso contrario

- *Significato fisico*: Queste forze trasmettono direttamente il moto alla massa, incrementandone o riducendone la forza d'inerzia. Sono i "motori" o i "disturbi" del nostro sistema

== Le Forze Interne ($F^"int"$)
Le forze interne descrivono invece, l'interazione tra l'elemento $M_i$ che stiamo studiando in quel momento e tutti gli altri corpi $M_j$ ad esso collegati. Questo collegamento avviene fisicamente tramite i componenti che abbiamo definito prima:

- *Tramite molle ideali ($K_"ij"$)*: La forza elastica interna si oppone allo spostamento relativo ed è pari a
$ F^"int"_"ij" (t) eq K_"ij" [p_i (t) - p_j (t)] $

- *Tramite smorzatori ideali ($beta_"ij"$)*: La forza di attrito viscoso si oppone alla velocità relativa ed è pari a
$ F^"int"_"ij" (t) eq beta_"ij" [dot(p)_i (t) - dot(p)_j (t)] $

- *Significato fisico*: Le forze interne trasmettono il moto agli altri corpi del sistema (fungendo da "ponte") e compaiono con il segno meno davanti alla sommatoria perchè riducono la forza d'inerzia netta che agisce sulla massa $M_i$

#obs(" ", [
  Applicando la Seconda Legge di Newton otteniamo per ogni massa un'equazione differenziale del *secondo ordine* (poichè c'è l'accelerazione $dot.double(p)_i$ che è la derivata seconda della posizione). Tuttavia, come abbiamo visto nella teoria generale, per costruire il nostro modello nello *Spazio di Stato* abbiamo rigorosamente bisogni di equazioni differenziali del *primo ordine* (cioè solo $dot(x)$)
])

\
= Rappresentazione in Variabili di Stato
Per porre rimedio a questo problema, si utilizza un trucco analitico molto elegante: "sdoppiare la variabile". Vediamo, quindi, la procedura canonica per analizzare questa tipologia di sistemi:

== La Scelta delle Variabili di Stato (Lo Sdoppiamento)
Per ogni corpo puntiforme di massa $M_i$ (anche se idealmente nulla) che si muove in traslazione, non introduciamo una sola variabile di stato, bensì *due*:

+ La *posizione* del corpo: $p_i (t)$

+ La *velocità* del corpo: $dot(p)_i (t)$

Questa scelta ci permette di trasformare una singola equazione del moto (del secondo ordine) in una coppia di equazioni differenziali del primo ordine. Se abbiamo un sistema con due masse, ad esempio, avremo quindi 4 variabili di stato

== La Scelta degli Ingressi
Si associa una variabile di ingresso $u(t)$ a *ogni forza esterna* applciata al nostro sistema meccanico. Ad esempio, se applichiamo una forza trainante $F(t)$, essa diventerà il nostro $u_1 (t)$

== La Scrittura delle Equazioni di Stato
A questo punto, ricaviamo le equazioni nella forma canonica $dot(x) (t) eq f_i (t, x(t), u(t))$. Grazie allo "sdoppiamento" fatto al primo passo, la struttura delle equazioni sarà sempre di questo tipo:

- *Prima equazione (Cinematica)*: La derivata della posizione è, per definizione, la velocità. Quindi se $x_q eq p_i$ e $x_2 eq dot(p)_i$, la prima equazione sarà semplicemente e banalmente: 
$ dot(x)_1 (t) eq x_2 (t) $

- *Seconda equazione (Dinamica)*: La derivata della velocità è l'accelerazione ($dot(x)_2 eq dot.double(p)_i$). Qui entra in gioco Newton. Riscriviamo l'equazione del moto isolando l'accelerazione a primo membro: $ dot(x)_2 (t) eq 1/M_i [ sum F^"est" - sum F^"int" ] $ E infine si sostituiscono tutte le posizioni, le velocità e le forze esterne con le rispettive variabili $x$ e $u$

== Le Equazioni di Uscita
Come sempre, definiamo l'equazione di uscita $y_k (t) eq g_k (t, x(t), u(t))$. Se il problema ci chiede di monitorare la posizione della massa 1, scriveremo semplicemente $y (t) eq x_1 (t)$

= I Componenti Fondamentali dei Sistemi in Rotazione
Nel mondo traslazionale avevamo massa, molla e smorzatore. Qui troviamo i loro esatti "gemelli" rotazionali, ma invece di lavorare con forze e spostamenti lineari, lavoreremo con *coppie (momenti torcenti)*, indicate con $T$, e *spostamenti angolari*, indicati con $theta$

== Corpo in Rotazione (Inerzia $J$)
È l'equivalente della massa $M$. Rappresenta la tendenza di un corpo a opporsi alle variazioni della sua velocità angolare $omega$ (o $dot(theta)$)

L'equazione che ne governa la dinamica è l'equivalente rotazionale della Seconda Legge di Newton:
$ J  dot.double(theta) (t) eq J (d^2 theta (t))/(d t^2) eq sum_i T_i (t) $

Dove:
- $J$: Momento d'inerzia (in $"kg" dot m^2$)

- $theta (t)$: Posizione angolare (in radianti)

- $T_i (t)$: Coppie esterne applicate (positive se concordi con il sistema di riferimento, negative altrimenti)

== Molla Ideale Torsionale (Costante Elastica $K$)
Immagina un albero flessibile o una molla a spirale. Questa molla immagazzina energia potenziale quando viene "torcibile". La coppia elastica generata si oppone alla *rotazione relativa* dei suoi due estremi:
$ T (t) eq K [theta_+ (t) - theta_- (t)] $

Dove:
- $K$: Coefficiente di elasticità torsionale (in $N m/"rad"$)

- $theta_+$ e $theta_-$: Posizioni angolari delle due estremità

== Smorzatore Ideale Torsionale (Smorzamento $beta$)
È l'elemento che dissipa energia (attrito viscoso nei cuscinetti, ad esempio). La coppia resistente è proporzionale alla *velocità angolare relativa* dei due estremi:
$ T (t) eq beta [omega_+ (t) - omega_- (t)] eq beta [dot(theta)_+ (t) - dot(theta)_- (t)] $

Dove:
- $beta$: Coefficiente di smorzamento (in $N m/"rad"$)

= Equazioni del Moto per Sistemi in Rotazione
La procedura per scrivere le equazioni è identica a quella vista per la traslazione, basta sostituire le variabili lineare con quelle angolari

Prima di tutto, si fissa un *verso di rotazione positivo* comune per tutti i corpi del sistema (es. antiorario)

Sucessivamente, per ogni inerzia $J_i$ presente, si scrive il bilancio delle coppie:
$ J_i dot.double(theta)_i (t) eq sum_k T^("est")_k (t) - sum_(l eq.not i) T^("int")_(i l) (t) $

Esattamente come prima, distinguiamo:
- *Coppie esterne ($T^("est")$)*: Motori o carichi esterni. hanno segno positivo se spingono nel verso scelto come riferimento, negativo altrimenti

- *Coppie esterne ($T^("int")$)*: Generate dalle molle torsionali e dagli smorzatori che collegano l'interzia $J_i$ agli altri corpi $J_l$. Hanno segno meno davanti alla sommatoria perchè, dal punto di vista dell'inerzia $J_i$, queste coppie frenano o si oppongono al suo moto

In definitiva, nell'equazione del moto dell'elemento $J_i$:
- Le *coppie esterne $T^("est")_k$* trasmettono direttamente il moto a $J_i$, quindi ne incrementano o riducono la coppia di inerzia, a seconda del loro senso di rotazione

- Le *coppie interne $T^("int")_(i l)$* trasmettono invece il moto agli altri corpi $J_l$ tramite molle o smorzatori, quindi riducono la coppia di inerzia di $J_i$

= Rappresentazione in Variabili di Stato
Per passare delle equazioni di Newton (del secondo ordine) alla rappresentazione di stato (del primo ordine), applichiamo lo stesso "sdoppiamento" visto per i sistemi traslazionali
Per ogni elemento in rotazione dotato di inerzia $J_i$ (anche se idealmente nulla), dobbiamo definire *due* variabili di stato:

+ *La posizione angolare* $theta_i (t)$
+ *La velocità angolare* $dot(theta)_i (t)$ (ovvero $omega_i$)

Inoltre, ogni coppia esterna applicata diventerà un ingresso $u(t)$ del nostro sistema

Si ricavano, quindi, le *equazioni di stato* del tipo:
$ dot(x)_i (t) eq (d x_i (t))/(d t) eq f_i (t, x(t), u(t)) $

A partire dalle precedenti equazioni del moto, esprimendo $x_i$ soltanto in funzione di variabili di stato e di ingresso, se necessario esplicitando il legame di derivazione temporale fra variabili di stato

Si ricavano, inoltre, le *equazioni di uscita* del tipo:
$ y_k (t) eq g_k (t, x(t), u(t)) $

Esprimendo ogni variabile di interesse $y_k$ soltanto in funzione di variabili di stato e di ingresso