#import "../template.typ": *

#show : project.with(
  title: "Modellistica dei Sistemi Dinamici Termici",
  course: "Controlli Automatici"
)

= Gli Elementi Fondamentali della Termica
Anche in termodinamica abbiamo elementi in grado di _immagazzinare_ energia ed elementi che permettono di _trasmetterla_. Nel nostro approccio a parametri concentrati, utilizziamo due astrazioni ideali:

== Il Corpo Omogeneo Ideale (Capacità Termica $C$)
Questo p l'elemento "con memoria" del sistema termico, l'esatto equivalente del condensatore elettrico o della massa meccanica. Rappresenta un corpo la cui temperatura è uniforme in ogni suo punto.

L'equazione differenziale che ne governa il comportamento è:
$ p(t) eq C (d theta(t))/(d t) $

Dove:
- $C$: Capacità termica del corpo (espressa in $J/K$), che è proporzionale al calore specifico del materiale

- $theta (t)$: Temperatura assoluta del corpo (in Kelvin $K$)

- $p(t)$: Portata di calore, ovvero la potenza termica applicata (in Watt $W$)

== Il Conduttore Termico Ideale (Conduttanza Termica $K_(i j)$)
Questo elemento modella lo scambio di calore tra due corpi (ad esempio un muro che separa due stanze). È un elemento puramente statico (dissipativo), analogo al resistore elettrico o allo smorzatore meccanico. La portata di calore che fluisce attraverso di esso è proporzionale alla differenza di temperatura tra i due corpi $i$ e $j$:
$ p_(i j)(t) eq K_(i j) [theta_i (t) - theta_j (t)] $
- $K_(i j)$: Conduttanza termica (espressa in $W/K$). Se scambiassimo i pedici guardando dal corpo $j$, scriveremo $K_(j i) [theta_j (t) - theta_i (t)]$

= L'Equazione Dinamica di Equilibrio Termico
Una volta definiti gli elementi, dobbiamo connetterli. Il principio fisico che applichiamo è la conservazione dell'energia, che noi traduciamo nell'*Equilibrio delle portate di calore*

Per _ogni_ corpo omogeneo isolata (non termostatato) aventa capacità termica $C_i$, dobbiamo scrivere un bilancio energetico:
$ C_i dot(theta)_i (t) eq sum_k p^("est")_k (t) - sum_(j eq.not i) p^("int")_(i j) (t) $

Analizziamo i termini a destra dell'uguale:

- *Portate Esterne ($p^("est")_k$)*: È il calore fornito o sottratto direttamente dal mondo esterno. Hanno *segno positivo* se scaldano il corpo (es. una resistenza elettrica per effetto Joule, una caldaia) e *segno negativo* se lo raffreddano (es. un condizionatore, una pompa di calore). Le portate esterne ($p^("est")_k$) forniscono o prelevano calore direttamente dal corpo $C_i$, ovvero incrementano o riducono il termine $C_i dot(theta)_i$, che è interpretabile come una portata termica di inerzia 

- *Portate Interne ($p^("int")_(i j)$)*: Rappresentano il calore scambiato con gli altri corpi del sistema attraverso i conduttori termici $K_(i j)$. Come in meccanica, hanno il segno meno davanti alla sommatoria perchè, dal punto di vista del corpo $C_i$, cedere calore a un corpo adiacente riduce la porpria energia interna (la propria "portata di inerzia"). Sostituendo la legge del conduttore, il termine diventa $- K_(i j) [theta_i (t) - theta_j (t)]$. Le portate interne ($p^("int")_(i j)$) trasmettono invece il calore agli altri corpi $C_j$ tramite conduttori termici, ovvero riducono la portata termica di inerzia di $C_i$

= La Scelta per lo Spazio di Stato
Come traduciamo queste equazioni nella forma matriciale in Variabili di Stato? C'è una particolarità a cui è necessario prestare attenzione

- *Le Variabili di Stato ($x$)*: Per ogni corpo omogeneo _non termostatato_, introduciamo *una* variabile di stato scegliendo la sua temperatura assoluta $theta_i (t)$. (Se abbiamo 3 stanze la cui temperatura può variare liberamente, $n eq 3$)

- *Le Variabili di Ingresso ($u$)*: Sicuramente associamo un ingresso $u$ ad ogni portata di calore generata da una fonte esterna ($p^("est")_k$). Tuttavia, *dobbiamo considerare come ingressi anche le temperature dei corpi termostatati* (come, ad esempio, l'ambiente esterno o un enorme serbatoio termico). Questo perchè la loro temperatura è imposta e mantenuta costante (o variabile secondo una legge nota) dal mondo esterno e non dipende in alcun modo dalle dinamiche interne del nostro sistema

- Si ricavano le *Equazioni di Stato* del tipo: $ dot(x)_i (t) eq (d x_i (t))/(d t) eq f_i (t, x(t), u(t)) $ A partire dalle precedenti equazioni dinamiche di equilibrio termico, esprimendo $dot(x)_i$ solo in funzione di variabili di stato e di ingresso

- Si ricavano le *Equazioni di Uscita* del tipo: $ y_k (t) eq g_k (t, x(t), u(t)) $ Esprimendo ogni variabile di interesse $y_k$ soltanto in funzione di variabili di stato e di ingresso

*Osservazione sulla Matrice A*: i termini della diagonale principale della matrice $A$ sono rigorosamente negativi. Questo indica che i sistemi termici sono intrinsecamente "dissipativi": se si spengono i termosifoni e azzerano le temperature esterne, le stanze tenderanno inesorabilmente a raffreddarsi fino a zero (asintotica stabilità), non esploderanno mai