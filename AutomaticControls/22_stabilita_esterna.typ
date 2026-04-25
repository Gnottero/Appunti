#import "../template.typ": *

#show : project.with(
  title: "Stabilità Esterna e Analisi della Risposta",
  course: "Controlli Automatici"
)

= Relazioni fra Rappresentazioni e Forma Minima
== Rappresentazione Interna vs Rappresentazione Esterna
Un sistema dinamico LTI può essere descritto in due modi distinti, con diverso contenuto informativo

La *rappresentazione interna* (o in variabili di stato) è costituita dalle equazioni ingresso-stato-uscita: essa consente di analizzare la stabilità interna (autovalori di $A$) e le proprietà strutturali di raggiungibilità e osservabilità. Descrive completamente il sistema, incluse le dinamiche interne che possono non manifestarsi sull'uscita

La *rappresentazione esterna* (o funzione di trasferimento $H(s)$ o $H(z)$) descrive esclusivamente la relazione ingresso-uscita del sistema a partire da condizioni iniziali nulle. Essa dipende soltanto dall *parte raggiungibile e osservabile* del sistema. Dinamiche non raggiungibili o non osservabili non compaiono in $H(s)$

== Sistema in Forma Minima
Un sistema dinamico LTI si dice *in forma minima* se e soltanto se è *completamente raggiungibile e completamente osservabile*. Le proprietà fondamentali di un sistema in forma minima sono:

- Contiene il *numero minimo* di variabili di stato necessarie a descrivere il comportamento ingresso-uscita

- La funzione di trasferimento *non presenta cancellazioni zero-polo*: tutti gli autovalori della matrice di stato $A$ compaiono come poli di $H(s)$

- In un sistema *non* in forma minima, almeno una dinamica interna è non raggiungibile o osservabile: la funzione di trasferimento presenta, quindi, almeno una cancellazione zero-polo

*Esempio di sistema in forma minima*:
$ dot(x)(t) eq mat(delim: "[", 1, 1; 0, -1) x(t) + mat(delim: "[", 2; 3) u(t) space.en space.en space.en y(t) eq mat(delim: "[", 2, -1) x(t) $

Si verifica che $rho(M_R) eq rho(M_O) eq 2 eq n$. La funzione di trasferimento è:
$ H(s) eq (s + 13)/((s + 1)(s - 1)) $ 
I poli $+1, -1$ coincidono con gli autovalori di $A$. Non ci sono cancellazioni

= Stabilità Esterna (BIBO)
== Definizione di Stabilità BIBO
Un sistema dinamico LTI, a dimensione finita, inizialmente a riposo, si dice *BIBO stabile* (Bounded Input - Bounded Output) se la sua risposta forzata $y_f (t)$ a un qualsiasi ingresso limitato si mantiene sempre limitata nel tempo:
$ norm(u(t)) lt.eq dash(u) lt oo, forall t gt.eq 0 arrow.r.double.long norm(y(t)) lt.eq dash(y) lt oo, forall t gt.eq 0 $

L'ipotesi di sistema inizialmente a riposo implica che si considera la sola risposta forzata, escludendo il contributo della risposta libera

== Condizione per La Stabilità BIBO
La stabilità BIBO è legata alla posizione dei *poli della funzione di trasferimento* dopo aver eseguito tutte le cancellazioni zero-polo

- *Tempo Continuo*: Il sistema è BIBO stabile se e solo se *tutti i poli* di $H(s)$ hanno *parte reale strettamente negativa*

- *Tempo Discreto*: Il sistema è BIBO stabile se e solo se *tutti i poli* di $H(z)$ hanno *modulo strettamente minore di 1*

== Relazione tra Stabilità Interna e Stabilità Esterna
- *Stabilità asintotica* $arrow.r.double.long$ *Stabilità BIBO*. Se la matrice $A$ ha tutti autovalori asintoticamente stabili, i poli di $H(s)$ sono un sottoinsieme di essi e dunque sono anch'essi stabili

- *Stabilità BIBO + Forma minima* $arrow.r.double.long$ *Stabilità asintotica*. Se il sitema è in forma minima, non ci sono cancellazioni: gli autovalori di $A$ coincidono con i poli di $H(s)$. Se questo sono tutti stabili, anche il sistema internamento lo è

- *Sistema non in forma minima*: Le due stabilità possono divergere. È possibile avere un sistema BIBO stabile ma internamente instabile, come illustrato nell'esempio di sistema non in forma minima: il polo $+1$ è cancellato e non compare in $H(s)$, ma la dinamica interna ad esso associate diverge nel tempo

= Risposta in Regime Permanente
== Scomposizione della Risposta
Consideriamo un sistema LTI a tempo continuo descritto da 
$ dot(x)(t) eq A x(t) + B u(t) $ 
$ y(t) eq C x(t) $
La risposta $y(t)$ può essere scomposta in due contributi
$ y(t) eq y_"omog" (t) + y_"part" (t) $

- $y_"omog" (t)$ è la *risposta libera* (soluzione dell'omogenea associata, con $u(t) eq 0$). Dipende dalle condizioni iniziali ed è combinazione lineare dei modi propri del sistema, governati dagli autovalori di $A$

- $y_"part" (t)$ è la *risposta forzata* (soluzione particolare). Dipende dall'ingresso $u(t)$ applicato

Se il sistema è *asintoticamente stabile* ($Re(lambda_i (A)) lt 0, forall i$), tuti i modi propri sono convergenti a zero e si ha:z
$ lim_(t arrow.r oo) y_"omog" (t) eq 0 $
Pertanto, per tempi sufficientemente grandi, la risposta totale tende alla sola risposta forzata, che costituisce la *risposta in regime permanente*
$ y(t) tilde.equiv y_"part" (t) $

== Risposta a Regime per Ingressi Notevoli
=== Ingresso costante: $u(t) eq dash(u) dot epsilon(t)$
Se il sistema è asintoticamente stabile, l'uscita tende a un valore costante:
$ y_"part" (t) eq dash(y) dot epsilon(t) eq H(0)dash(u) dot epsilon(t) $
Dove $H(0)$ è il *guadagno statico* del sistema. Equivalentemente, usando la rappresentazione intera: 
$ dash(y) eq -C A^(-1)B dash(u) $

=== Ingresso sinusoidale: $u(t) eq dash(u) sin(omega_0 t + theta_0)epsilon(t)$
Se il sistema è asintoticamente stabile, l'uscita tende a una sinusoide di pari frequenza ma diversa ampiezza e fase (regime sinusoidale):
$ y_"part" (t) eq dash(y) sin(omega_0 t + phi) epsilon(t) $
Dove:
$ dash(y) eq abs(H(j omega_0)) dot dash(u), space.en space.en space.en phi eq arg H(j omega_0) + theta_0 $
Questo risultato è il fondamento della *risposta in frequenza* e dei diagrammi di Bode

== Transitorio e Regime
La risposta complessiva di un sistema asintoticamente stabile si compone, quindi, di un *transitorio iniziale* (in cui $y_"omog" (t)$ non è ancora trascurabile) e di una *risposta a regime* (coincidente con $y_"part" (t)$). La durata del transitorio dipende dalla costante di tempo dei modi propri: più gli autovalori sono lontani dall'asse immaginario (più negativi), più il transitorio si estingue rapidamente