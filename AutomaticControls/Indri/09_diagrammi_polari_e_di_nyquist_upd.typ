#import "../../template.typ": *

#show : project.with(
  title: "Diagrammi polari, di Nyquist e di Nichols",
  course: "Controlli Automatici"
)

= Diagramma Polare - Definizione e Costruzione
Il *diagramma polare* è una rappresentazione grafica della *risposta in frequenza* di una funzione di trasferimento $G(s)$, valutata sull'asse immaginario:
$ G(j omega), space.en space.en omega in [0,+oo) $
Ogni valore di $omega$ corrisponde a un punto nel piano complesso, espresso in forma polare:
$ G(j omega) eq M(omega) dot e^(j phi(omega)) $
dove:
- $M(omega) eq abs(G(j omega))$ è il *modulo* (guadagno)

- $phi(omega) eq arg G(j omega)$ è la *fase*

Nel diagramma polare, si traccia il *luogo geometrico* dei punti $G(j omega)$ al variare di $omega$ da $0$ a $oo$. L'asse reale rappresenta la parte reale di $G(j omega)$, l'asse immaginario la parte immaginaria

A differenza dei diagrammi di Bode, il diagramma polare combina modulo e fase in un'unica curva nel piano complesso. Ciò è utile per analisi qualitative e per il criterio di Nyquist

= Comportamento Asintotico
== Comportamento per $omega arrow.r 0^+$ (Bassa Frequenza)
Nel caso in cui non ci fossero poli nell'origine ($i eq 0$):
$ lim_(omega arrow.r 0^+) G(j omega) approx K space.en "(costante reale)" $
Il diagramma parte sull'*asse reale*, in $K gt 0$ se il guadagno statico è positivo

Se ci fossero in invece $i gt.eq 1$ poli nell'origine (tipo $i$):
$ G(j omega) approx K/(j omega)^i eq K/omega^i e^(-j i pi/2) $
Il modulo tende a $+oo$, e la fase tende a $-i dot 90 degree$. Ne segue che il diagramma *parte dall'infinito* con direzione determinata da questa fase

Inoltre, se la funzione ha termini aggiuntivi (zeri o poli non nell'origine), il segno delle parti reale e immaginaria approssimate per $omega arrow.r 0^+$ determina il quadrante effettivo di partenza

Per sistemi con poli/zeri nell'origine, si ha una forma del tipo:
$ G_a(j omega)|_(omega arrow.r 0^+) eq Re(omega)|_(omega arrow.r 0^+) + j Im(omega)|_(omega arrow.r 0^+) tilde.equiv K_Re/omega^n + j K_Im/omega^m $
Con $n gt.eq 0, m gt 0$ oppure $n gt 0, m gt.eq 0$ 

Si ottiene, quindi, che il percorso iniziale può tendere a una retta o una parabola. Ad esempio:
- $n eq 0, m gt 0 arrow.r$ Asintoto $eq$ retta verticale $Re eq K_Re$

- $n gt 0, m eq 0 arrow.r$ Asintoto $eq$ retta orizzontale $Im eq K_Im$

- $n eq 4, m eq 2 arrow.r$ Asintoto $eq$ parabola $Re eq K_Re/K^2_Im Im^2$

- Forma generale dell'asintoto: $Re eq H Im^(n/m)$ o $Im eq dash(H) Re^(n/m)$

== Comportamento per $omega arrow.r +oo$ (Alta Frequenza)
- *Sistema strettamente proprio* (grado denominatore $gt$ grado numeratore): $G(j omega) arrow.r 0$. La curva *termina nell'origine* con fase: $ phi(oo) eq -90 degree dot (n_p - m_p + n_n - m_n) $ Dove $n_p, n_n eq$ numero di poli con parte reale $gt 0$ e $lt.eq 0$, e analogamente per gli zeri $m_p, m_n$

- *Sistema non strettamente proprio (grado numeratore $eq$ grado denominatore)*: $G(j omega) arrow.r H in RR$. La curva termina in un *punto finito sull'asse reale diverso dall'origine*, con arrivo perpendicolare all'asse

= Tracciamento Qualitativo
Per disegnare il diagramma polare *senza calcoli puntuali*, si usa l'informazione dai *diagrammi di Bode*:
+ *Partenza $(omega arrow.r 0^+)$*:
  - Identifica il tipo del sistema (numero di poli in zero)
  - Determina fase iniziale e quadrante
  - Se necessario, stima l'asintoto inziale

+ *Arrivo $(omega arrow.r +oo)$*:
  - Verifica se il sistema è strettamente proprio
  - Calcola la fase finale tramite conteggio poli/zeri

+ *Andamento intermedio*:
  - Usa l'anamento del modulo e della fase nei Bode per capire se la curva "gira" in senso orario/antiorario, se attraversa assi, etc

= Diagramma di Nyquist
Per costruire il diagramma di Nyquist:
+ *Traccia il diagramma polare* per $omega in [0^+, oo)$

+ *Aggiungi la sua simmetrica rispetto all'asse reale* per $omega in (-oo, 0^-]$, perchè: $ G(-j omega) eq dash(G(j omega)) space.en "(complesso coniugato)" $ Ovvero la parte per $omega lt 0$ è il "ribaltamento" speculare

+ *Chiudi il percorso all'infinito*:
  - Poichè ci sono *2 poli nell'origine*, quando $s$ percorre una piccola semicirconferenza attorno a $s eq 0$ nel piano $s$, $G(s)$ percorre *2 semicirconferenze di raggio infinito in senso orario* nel piano complesso
  - Questo collega il punto finale della curva per $omega arrow.r 0^-$ con quello per $omega arrow.r 0^+$, chiudendo il diagramma

Il risultato è una *curva chiusa*, che parte da $omega eq -oo$, arriva da destra in alto (simmetrica dell'arrivo da sotto), giro attorno all'origine, va all'infinito nel III quadrante, torna dall'infinito nel II quadrante (per via delle semicirconferenze), e chiude il ciclo

== Nota per Matlab
MATLAB con `nyquist(G)` non disegna automaticamente le semicirconferenze all’infinito. Bisogna aggiungerle manualmente o interpretarle concettualmente