#import "../../template.typ": *

#show : project.with(
  title: "Stabilità Interna di Sistemi Dinamici LTI",
  course: "Controlli Automatici"
)

= Stabilità Interna per Sistemi LTI a Tempo Continuo (TC)
== Definizione della Perturbazione di Stato
Consideriamo un sistema LTI MIMO a dimensione finita, descritto dalle equazioni di stato:
$ cases(
  dot(x) eq A x(t) + B u(t),
  y(t) eq C x(t) + D u(t)
) $

Definiamo due evoluzioni temporali distinte:
- *Movimento nominale $tilde(x)(t)$*: ottenuto applicando l'ingresso nominale $tilde(u)(t)$ a partire dallo stato iniziale nominale $tilde(x)(0)$$ dot(tilde(x)) eq A tilde(x)(t) + B tilde(u)(t), space.en tilde(x)(0) eq tilde(x)_0 $

- *Movimento perturbato $x(t)$*: ottenuto applicando lo stesso ingresso nominale $tilde(u)(t)$, ma partendo da una condizione iniziale differente $x(0) eq x_0 eq.not tilde(x)_0$

*Definizione di Perturbazione dello Stato*:
$ delta x(t) :eq x(t) - tilde(x)(t) in RR^n $

== Dinamica della Perturbazione
Calcoliamo la dinamica di $delta x(t)$:
$ delta dot(x)(t) eq dot(x)(t) - dot(tilde(x))(t) \
  eq [A x(t) + B tilde(u)(t)] - [A tilde(x)(t) + B tilde(u)(t)] \
  eq A (x(t) - tilde(x)(t)) eq A delta x(t)
$

La condizione iniziale è $delta x(0) eq x_0 - tilde(x)_0$

*Osservazione Fondamentale*:
L'equazione $delta dot(x)(t) eq A delta x(t)$ è *omogenea*. Questo implica che l'evoluzione della perturbazione *non dipende* nè dall'ingresso nominale $tilde(u)(t)$ nè dallo stato nominale $tilde(x)(t)$. Nei sistemi LTI, la stabilità è una proprietà intrinseca del sistema (della matrice A), non del particolare movimento

La soluzione della perturbazione è data dall'esponenziale di matrice:
$ delta x(t) eq e^(A t) delta x(0), space.en forall t gt.eq 0 $

== Analisi Tramite Modi Propri
Dall'analisi modale, sappiamo che $delta x(t)$ è combinazione lineare dei modi propri del sistema. I modi sono associati agli autovalori $lambda_i$ della matrice $A$ (con molteplicità algebrica $mu_i$)

Il comportamento di un modo proprio è determinato dalla parte reale di $lambda_i$:
- $Re(lambda_i) lt 0$: Il modo è *esponenzialmente convergente* (tende a zero)

- $Re(lambda_i) eq 0$ *con molteplicità* $mu^'_i eq 1$ (blocco di Jordan di dimensione 1): Il modo è *limitato* (persiste nel tempo, es. sinusoide pura o costante)

- $Re(lambda_i) eq 0$ *con molteplicità* $mu^'_i gt 1$ (blocco di Jordan di dimensione $gt 1$): Il modo è *polinomialmente divergente* (cresce come $t^k$)

- $Re(lambda_i) gt 0$: Il modo è *esponenzialmente divergente*

== Criteri di Stabilità per Sistemi LTI TC
Basandosi sul comportamento dei modi, definiamo tre tipologie di stabilità

=== Asintotica Stabilità (Globalmente)
- *Definizione*: Un sistema LTI TC è asintoticamente stabile se la perturbazione dello stato $delta x(t)$ tende a zero per $t arrow.r infinity$, per qualsiasi condizione iniziale $delta x(0)$
- *Criterio (necessario e sufficiente)*:
$ forall i : Re(lambda_i (A)) lt 0 $

Tutti gli autovalori della matrice $A$ hanno parte reale *strettamente negativa*

- *Conseguenza*: Il sistema è globalmente asintoticamente stabile

- *Proprietà*: se l'ingresso nominale è costante e pari ad $dash(u)$, esiste un unico stato di equilibrio pari a $dash(x) eq -A^(-1) B dash(u)$ (infatti la matrice $A$ è invertibile, poichè $det (A) eq product_(i eq 1)^n lambda_i eq.not 0$) ed è globalmente asintoticamente stabile 

=== Instabilità
- *Definizione*: Un sistema LTI TC è instabile se esiste almeno una condizione iniziale $delta x(0)$ tale che la perturbazione dello stato $delta x(t)$ *non è limitata* nel tempo (diverge)

Il criterio si articola in *due casi distinti*:

*Caso A: Autovalore con part reale positiva* \
Se esiste almeno un autovalore con parte reale *strettamente positiva*, la perturbazione diverge *esponenzialmente*
$ exists i : Re(lambda_i (A)) gt 0 space.en arrow.r.double space.en "Instabilità" $

*Caso B: Autovalori sull'asse immaginario con molteplicità (nel polinomio minimo) maggiore di 1* \
Se *tutti* gli autovalori hanno parte reale $lt.eq 0$, ma esiste almeno un autovalore con parte reale uguale a zero che *non è radice semplice del polinomio minimo* (cioè è associato a un blocco di Jordan di dimensione $gt.eq 2$), allora la perturbazione può divergere *polinomialmente*
$ forall i : Re(lambda_i (A)) lt.eq 0 \
  exists k : Re(lambda_k (A)) eq 0 space.en e space.en nu_k gt.eq 2
$

Dove $nu_k$ è la dimensione del più grande blocco di Jordan associato a $lambda_k$ (molteplicità nel polinomio minimo)

=== Semplice Stabilità (o Stabilità al Limite)
- *Definizione*: Un sistema LTI TC è semplicemente stabile se la perturbazione dello stato $delta x(t)$ rimane *limitata* per qualsiasi condizione iniziale $delta x(0)$, ma *non tende necessariamente a zero*

- *Criterio (necessario e sufficiente)*:
$ forall i : Re(lambda_i (A)) lt.eq 0 \
  forall k : Re(lambda_k (A)) eq 0 arrow.r.double nu_k eq 1
$ 
Dove $nu_k eq 1$ significa che tutti gli autovalori sull'asse immaginario sono *radici semplici del polinomio minimo*, cioè sono associati esclusivamente a blocchi di Jordan $1 times 1$

= Stabilità Interna per Sistemi LTI a Tempo Discreto (TD)
== Dinamica della Perturbazione nel Dominio Discreto
Consideriamo un sistema LTI a tempo discreto:
$ cases(
  x(k + 1) eq A x(k) + B u(k),
  y(k) eq C x(k) + D u(k)
) $

Seguendo lo stesso approccio del caso continuo, definiamo:
- *Movimento nominale*: 
$ tilde(x)(k + 1) eq A tilde(x)(k) + B tilde(u)(k), space.en tilde(x)(0) eq tilde(x)_0 $

- *Movimento perturbato*: 
$ x(k + 1) eq A x(k) + B tilde(u)(k), space.en x(0) eq x_0 eq.not tilde(x)_0 $

*Perturbazione dello stato*:
$ delta x(k) :eq x(k) - tilde(x)(k) in RR^n $

Calcoliamo l'evoluzione:
$ delta x(k + 1) eq x(k + 1) - tilde(x)(k + 1) \
  eq [A x(k) + B tilde(u)(k)] - [A tilde(x)(k) + B tilde(u)(k)] \
  eq A(x(k) - tilde(x)(k)) eq A delta x(k)
$

Con condizione iniziale $delta x(0) eq x_0 - tilde(x)_0$

Anche nel caso discreto, l'equazione alle differenze $delta x(k + 1) eq A delta x(k)$ è *omogenea*. Pertanto, la stabilità è una proprietà esclusiva della matrice $A$, indipendente dall'ingresso

La soluzione è:
$ delta x(k) eq A^k delta x(0), space.en forall k gt.eq 0 $

== Analisi Tramite Modi Propri nel Discreto
I modi propri per un sistema LTI TD sono associati agli autovalori $lambda_i$ della matrice $A$. Il comportamento è determinato dal *modulo* di $lambda_i$:
- $abs(lambda_i) lt 1$: Il modo è *geometricamente convergente* (tende a zero)

- $abs(lambda_i) eq 1$ *con molteplicità* $mu_i^' eq 1$ (blocco di Jordan di dimensione 1): IL modo è *limitato* (persiste nel tempo, es. sequenza costante o sinusoidale a modulo unitario)

- $abs(lambda_i) eq 1$ *con molteplicità* $mu_i^' gt 1$ (blocco di Jordan di dimensione $gt 1$): Il modo è *polinomialmente divergente* (cresce come $k^(mu_i^' - 1)$)

- $abs(lambda_i) gt 1$: Il modo è *geometricamente divergente*

== Criteri di Stabilità per Sistemi LTI TD
La traduzione dei criteri dal piano complesso continuo (semipiano sinistro) al discreto (cerchio unitario) è diretta:

=== Asintotica Stabilità (Globalmente)
- *Definizione*: Un sistema LTI TD è asintoticamente stabile se la perturbazione dello stato $delta x(k)$ tende a zero per $k arrow.r infinity$, per qualsiasi condizione iniziale $delta x(0)$

- *Criterio (necessario e sufficiente)*:
$ forall i : abs(lambda_i (A)) lt 1 $

Tutti gli autovalori della matrice $A$ hanno modulo *strettamente minore di 1* (sono all'interno del cerchio unitario)

- *Conseguenza*: Il sistema è globalmente asintoticamente stabile

- *Proprietà*: Se l'ingresso nominale è costante e pari a $dash(u)$, esiste un unico stato di equilibrio $dash(x) eq (I - A)^(-1) B dash(u)$ (infatti la matrice $I - A$ è invertibile: $det (I - A) eq product_(i eq 1)^n (1 - lambda_i) eq.not 0$) ed è globalmente asintoticamente stabile

== Instabilità
- *Definizione*: Un sistema LTI TD è instabile se esiste almeno una condizione iniziale $delta x(0)$ tale che la perturbazione dello stato $delta x(k)$ *non è limitata* nel tempo (diverge)

Il criterio si articola in *due casi distinti*:

*Caso A: Autovalore con modulo maggiore di 1* \
Se esiste almeno un autovalore con modulo *strettamente maggiore di 1*, la perturbazione diverge *geometricamente*
$ exists i : abs(lambda_i (A)) gt 1 space.en arrow.r.double space.en "Instabilità" $

*Caso B: Autovalori sul cerchio unitario con molteplicità (nel polinomio minimo) maggiore di 1* \
Se *tutti* gli autovalori hanno modulo $lt.eq 1$, ma esiste almeno un autovalore con modulo uguale a 1 che *non è radice semplice del polinomio minimo* (cioè è associato a un blocco di Jordan di dimensione $gt.eq 2$), allora la perturbazione può divergere *polinomialmente*
$ forall i : abs(lambda_i (A)) lt.eq 1 \
  exists k : abs(lambda_k (A)) eq 1 arrow.r.double nu_k gt.eq 2
$

Dove $nu_k$ è la dimensione del più grande blocco di Jordan associata a $lambda_k$ (molteplicità del polinomio minimo)

=== Semplice Stabilità (o Stabilità al Limite)
- *Definizione*: Un sistema LTI TD è semplicemente stabile se la perturbazione dello stato $delta x(k)$ rimane *limitata* per qualsiasi condizione iniziale $delta x(0)$, ma *non tende necessariamente a zero*

- *Criterio (necessario e sufficiente)*
$ forall i : abs(lambda_i (A)) lt.eq 1 \
  forall k : abs(lambda_k (A)) eq 1 arrow.r.double nu_k eq 1
$

Dove $nu_k eq 1$ significa che tutti gli autovalori sul cerchio unitario sono *radici semplici del polinomio minimo*, cioè sono associati esclusivamente a blocchi di Jordan $1 times 1$