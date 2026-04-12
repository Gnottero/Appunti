#import "../template.typ": *

#show : project.with(
  course: "Controlli Automatici",
  title: "Calcolo del Movimento dei Sistemi Dinamici LTI a Tempo Continuo"
)

= Introduzione
Fino a questo momento abbiamo imparato a _costruire_ il modello matematico di un sistema, arrivando alle equazioni matriciali:

$ dot(x) (t) eq A x(t) + B u(t) "(Equazione di stato)" $
$ y(t) eq C x(t) + D u(t) "(Equazione di uscita)" $

Ora il nostro obiettivo cambia: vogliamo *risolvere* queste equazioni. Vogliamo cioè calcolare come evolvono nel tempo lo stato $x(t)$ (il "movimento dello stato") e l'uscita y(t) (il "movimento dell'uscita" o risposta) partendo da una condizione iniziale nota $x(0_-)$ e applicando un certo ingresso $u(t)$

Per fare questo, abbiamo a disposizione due strade fondamentali:

+ La via diretta del *dominio del tempo* (Formula di Lagrange)

+ La via algebrica nel *dominio della frequenza "s"* (Trasformata di Laplace)

= La Soluzione nel Dominio del Tempo (Formula di Lagrange)
Se restiamo nel dominio del tempo, la matematica ci offre una soluzione chiusa ed esatta per le nostre equazioni differenziali, nota come *Formula di Lagrange*

L'espressione per lo stato $x(t)$ è la seguente:
$ x(t) eq e^(A t) x(0_-) + integral_0^t e^(A (t - tau)) B u(tau) d tau $

Questa formula è concettualmente meravigliosa perchè ci mostra che l'evoluzione del sistema è la somma di due contributi distinti:

- *Movimento Libero $x_l (t)$*: Il termine $e^(A t) x(0_-)$, che dipende _esclusivamente_ dallo stato iniziale $x(0_-)$. Rappresenta come il sistema evolve "lasciato a se stesso", senza forzanti esterne

- *Movimento forzato $x_f (t)$*: Il termine integrale $integral_0^t e^(A (t - tau)) B u(tau) d tau$, che dipende _esclusivamente_ dall'ingresso applicato $u(t)$

Sostituendo $x(t)$ nell'equazione di uscita, otteniamo una scomposizione analoga per la risposta del sistema:
$ y(t) eq C e^(A t) x(0_-) + C integral_0^t e^(A (t - tau)) B u(tau) d tau + D u(t) eq y_l (t) + y_f (t) $

Anche qui abbiamo una *risposta libera* $y_l (t)$ e una *risposta forzata* $y_f (t)$

== Il problema pratico
Calcolare quell'integrale (che è un prodotto di convoluzione) e calcolare l'esponenziale di una matrice ($e^(A t)$) nel dominio del tempo è un'operazione complessa. Per semplificare enormemente i calcoli conviene passare al dominio di Laplace

\
\
\

= La Soluzione nel Dominio della Frequenza "s" (Laplace)
La Trasformata di Laplace è un'operatore matematico che ci permette di trasformare equazioni differenziali in banali equazioni algebriche. La proprietà fondamentale che sfruttiamo è quella della derivazione: la derivata nel tempo $dot(x)(t)$ diventa una semplice moltiplicazione per la variabile complessa "s", ovvero:
$ s X(s) - x(0_-) $

Applicando Laplace alle nostre equazioni di partenza, otteniamo un sistema algebrico:

$ s X(s) - x(0_-) eq A X(s) + B U(s) $
$ Y (s) eq C X(s) + D U(s) $

Con dei semplici passaggi algebrici (raccogliendo $X(s)$ a fattor comune), possiamo isolare lo stato:
$ X(s) eq (s I - A)^(-1) x(0_-) + (s I - A)^(-1) B U (s) $

In questo modo ritroviamo l'esatta separazione tra *movimento libero* (il primo termine , dipendente da $x(0_-)$) e *movimento forzato* (il secondo termine, dipendente da $U(s)$)

Se sostituiamo $X(s)$ nell'equazione di uscita, otteniamo:
$ Y(s) eq C (s I - A)^(-1) x(0_-) + [(s I - A)^(-1) B + D] U (s) $

Anche in questo caso, la risposta totale è divisa in *risposta libera* (dipende dalle condizioni iniziali) e *risposta forzata* (dipende dall'ingresso)


= La Matrice Risolvente $Phi(s)$
La matrice $(s I - A)^(-1)$ vinsi chiama *Matrice Risolvente* dello stato e possiamo indicarla con $Phi(s)$:
$ Phi(s) eq (s I - A)^(-1) $

Ricordando la formula di Lagrange nel dominio del tempo, il primo termine era $e^(A t) x(0_-)$. Questo ci porta a una conclusione importante: *l'antitrasformata di Laplace della Matrice Risolvente è esattamente la Matrice di Transizione dello Stato*:
$ cal(L)^(-1) {(s I - A)^(-1)} eq e^(A t) $

= Come si calcola in pratica $(s I - A)^(-1)$?
Fino a qui abbiamo trattato il tutto in termini teorici. Per poter calcolare materialmente questa inversa, dobbiamo ricorrere alla regola di Cramer per l'inversione delle matrici:
$ (s I - A)^(-1) eq ("Adj"(s I - A))/("det"(s I - A)) $

Analizziamo i due pezzi di questa frazione:

+ $"Adj"(s I - A)$: È la matrice _Aggiunta_ (o dei cofattori trasposta). Sarà una matrice contenente dei polinomi in $s$

+ $"det"(s I - A)$: È il determinante della matrice $(s I - A)$. Essendo il determinante di una matrice $n times n$, il risultato non è una matrice, ma un *singolom polinomio di grando $n$ nella variabile $s$*

Questo significa che ogni singolo elemento della matrice $(s I - A)^(-1)$ sarà una funzione razionale fratta, avente al numeratore un polinomio (derivante dalla matrice aggiunta) e al *denominatore sempre lo stesso identico polinomio*, ovvero $"det"(s I - A)$

= Il Polinomio Caratteristico e gli Autovalori
Soffermiamoci su questo denominatore comune :$"det"(s I - A)$. Esso prende il nome di *Polinomio Caratteristico* del sistema.

Quando antitrasformiamo una funzione razione (ad esempio con il metodo dei fratti semplici), le radici del denominatore determinano la forma della risposta nel tempo. Se poniamo il polinomio caratteristico uguale a zero, stiamo risolvendo l'*equazione caratteristica*:
$ "det"(s I - A) eq 0 $

Le soluzioni $s_1, s_2, dots, s_n$ di questa equazione sono chiamate *Poli* del sistema, ma in algebra lineare prendono il nome di *Autovalori della Matrice A*

Questi autovalori (che possono essere reali o complessi coniugati), decidono il temperamento del sistema. Se antitrasformiamo, questi autovalori diventano gli esponenti degli esponenziali nel dominio del tempo ($e^(s_1 t), e^(s_2 t)$, etc)

I "modi" del sistema (ovvero se oscillerà, se esploderà verso l'infinito, o se decadrà "dolcemente" a zero) dipendono _esclusivamente_ da queste radici


= La Matrice di Trasferimento
Concentriamoci sull'ultimo termine della formula precedente, quella della risposta forzata. Il blocco matematico che moltiplica l'ingresso $U(s)$ è di importanza capitale e viene chiamato *Matrice di Trasferimento $H(s)$*
$ H(s) eq C(s I - A)^(-1) B + D $

Questa matrice rappresenta il legame tra l'ingresso e l'uscita, nel dominio della trasformata di Laplace

Per un sistema a $p$ ingressi e $q$ uscite la matrice di trasferimento è costituita da una matrice a $q$ righe e $p$ colonne di funzioni razionali della variabile $s$

= La Funzione di Trasferimento
Se il sistema è monovariabile (SISO, 1 ingresso e 1 uscita), questa matrice diventa uno scalare e prende il nome di *Funzione di Trasferimento (fdt)*

Essa rappresenta il legame diretto tra l'ingresso e l'uscita nel dominio di Laplace, assumendo che lo stato iniziale sia nullo $(x(0_-) eq 0)$

La fdt si presenta sempre come un rapporto di polinomi nella variabile "s":
$ H(s) eq (N_H (s))/(D_H (s)) $

Due definizioni da tenere bene a mente:

- Le radici del numeratore $N_H (s)$ si chiamano *Zeri* del sistema

- Le radici del denominatore $D_H (s)$ si chiamano *Poli* del sistema. I poli sono essenziali per determinare la stabilità del sistema

= La Forma "Zeri e Poli"
Il Teorema Fondamentale dell'Algebra ci insegna che un polinomio può essere scomposto nel prodotto delle sue radici. Se applichiamo questo principio sia al numeratore (grado $m$) che al denominatore (grado $n$) della nostra fdt, otteniamo la *Forza "Zeri e Poli"*:
$ H(s) = K_infinity ((s - z_1)(s - z_2)dots(s - z_m))/((s - p_1)(s - p_2)dots(s - p_n)) $

Dove possiamo notare:

- *Gli Zeri ($z_1, z_2, dots, z_m$)*: Sono le radici del numeratore. Se la variabile complessa $s$ assume uno di questi valori, l'uscita del sistema si annulla

- *I Poli ($p_1, p_2, dots, p_n$)*: Sono le radici del denominatore. I poli sono gli autovalori del sistema e sono i "registi" della dinamica: decidono se il sistema oscilla, diverge o si stabilizza

- *Il Guadagno Infinito ($K_infinity$)*: È un moltiplicatore costante che scala l'intera funzione. Matematicamente, si calcola come:
$ lim_(s arrow.r infinity) s^(n - m) H(s) $

#note([
    Esiste anche un'altra forma fattorizzata fondamentale, chiamata *Forma di Bode* (o in costanti di tempo)
])

= La Rappresentazione delle Singolarità Complesse
Le radici (poli o zeri) possono essere numeri reali, oppure numeri complessi. Poichè i coefficienti dei nostri polinomi fisici sono sempre reali, *le radici complessi si presentano sempre in coppie coniugate*

Un polinomio di secondo grado con radici complesse coniugate si scrive in forma cartesiana come:
$ p(s) eq (s - sigma_0 - j omega_0)(s - sigma_0 + j omega_0) eq s^2 + a_1 s + a_0 $
Dove $sigma_0$ è la parte reale e $omega_0$ la parte immaginaria

Tuttavia, la forma cartesiana è utilizzata meno frequentemente, in quanto $sigma_0$ e $omega_0$ non ci danno un'intuizione fisica immediata

Preferiamo descrivere queste radici usando *due parametri fisici fondamentali*, che descrivono il vettore nel piano complesso (modulo e angolo):

+ *Pulsazione Naturale ($omega_n$)*: Rappresenta la distanza dall'origine del piano complesso alla radice. Si calcola come: $ omega_n eq sqrt(sigma_0^2 + omega_0^2) $ Fisicamente, è la frequenza a cui il sistema oscillerebbe se non ci fossero attriti

+ *Smorzamento ($zeta$)*: È legato all'angolo $theta$ del vettore. È definito come: $ zeta eq - (sigma_0)/(sqrt(sigma_0^2 + omega_0^2)) $ Misura quanta energia il sistema dissipa: regola quanto "sopravvivono" le oscillazioni nel tempo. Affinchè la coppia sia effettivamente formata da numeri complessi coniugati, lo smorzamento deve rispettare la condizione: $ abs(zeta) lt 1 "   e   " omega_n gt 0 $

Usando questi due nuovi parametri (invece di $sigma_0$ e $omega_0$), la relazione diventa
$ sigma_0 eq - zeta omega_n $
$ omega_0 eq omega_n sqrt(1 - zeta^2) $
Il nostro trinomio di secondo grado assume una forma del tipo:
$ s^2 + 2 zeta omega_n s + omega_n^2 $

= La Forma Fattorizzata Completa
Ora possiamo scrivere la Funzione di Trasferimento "definitiva", che unisce le radici reali (scritte come binomi di primo grado) e le coppie di radici complesse coniugate (scritte come trinomi di secondo grado parametrizzati con $zeta$ e $omega_n$)
$ H(s) eq K_infinity (product_(j eq 1)^m_r (s - z_j) product_(j eq 1)^m_c (s^2 + zeta_(z, i)omega_(n z, i)s + omega_(n z, i)^2))/(product_(i eq 1)^n_r (s - p_i) product_(i eq 1)^m_c (s^2 + zeta_(p, i)omega_(n p, i)s + omega_(n p, i)^2)) $

Per fare un check dimensionale:

- Il numero di zeri reali ($m_r$) più il doppio delle coppie di zeri complessi ($2 dot m_c$) deve dare il numero totale di zeri $m$: $m_r + 2 m_c eq m$

- Lo stesso vale per i poli: il numero di poli reali ($n_r$) più il doppio delle coppie complesse ($2 dot n_c$) deve dare il grado del denominatore $n$: $n_r + 2 n_c eq n$

In questa forma, vediamo più facilmente alcune informazioni. Un polo reale $(s - p_i)$ genererà un decadimento esponenziale nel tempo. Un trinomio $(s^2 + 2 zeta_p omega_(n p)s + omega_(n p)^2)$ genererà un'oscillazione smorzata

