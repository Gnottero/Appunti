#import "../../template.typ": *

#show : project.with(
  title: "Le Specifiche di Progetto",
  course: "Controlli Automatici"
)

= Le Specifiche come "Desiderata"
== Definizione del Problema del Controllo
Il problema del controllo consiste nell'imporre a un processo assegnato un funzionamento desiderato. Tale funzionamento si esprime richiedendo che l'andamento temporale della variabile controllata (l'uscita $y(t)$) coincida il più possibile con quello di un opportuno segnale di riferimento $r(t)$, che può essere variabile o costante

Nella realtà ingegneristica, l'esatta coincidenza tra uscita e riferimento non è mai ottenibile. L'uscita insegue il riferimento entro opportune *tolleranze*, tali da garantire comunque il corretto funzionamento del sistema dal punto di vista pratico

== Ruolo delle Specifiche
Le *specifiche di progetto* definiscono il _modo_ in cui l'uscita deve inseguire il riferimento. Esse traducono in requisiti quantitativi le esigenze del particolare compito che il sistema di controllo deve eseguire, tenendo conto della presenza di disturbi e di vincoli tecnologici sui componenti (attuatori, sensori)

Le principali categorie di specifiche riguardano:

- *Stabilità* del sistema controllato

- *Robustezza* della stabilità e delle prestazioni rispetto a incertezze di modello

- *Precisione* dell'inseguimento in regime permanente

- *Reiezione dei disturbi* in regime permanente

- *Comportamento in transitorio* (forma della risposta)

- *Attività sulla variabile di comando* (vincoli sull'attuazione)

- *Comportamento in frequenza* del sistema ad anello chiuso

= Specifiche di Stabilità e di Stabilità Robusta
== Stabilità Asintotica
Condizione necessaria affinchè l'uscita possa inseguire il riferimento assegnato è che il sistema controllato sia *asintoticamente stabile*. La semplice stabilità (poli sull'asse immaginario) non è sufficiente: una qualsiasi perturbazione parametrica, seppur di piccola entità, potrebbe spostare i poli nel semipiano destro e rendere il sistema instabile

Nel caso di un sistema in retroazione, la funzione di trasferimento ad anello chiuso $W_y (s)$ deve avere tutti i poli con parte reale strettamente minore di zero

== Stabilità Robusta
L'asintotica stabilità del sistema controllato deve essere mantenuta anche in presenza di perturbazioni e variazioni dei parametri rispetto al modello nominale utilizzato per il progetto del compensatore. Si parla in tal caso di *stabilità robusta*

Le cause di incertezza sono molteplici:
- *Variazioni dei parametri del processo $F(s)$*: scarsa accuratezza del modello, derive termiche, invecchiamento, tolleranze di produzione

- *Variazioni dei parametri del compensatore $C(s)$*: problemi nella realizzazione pratica (tolleranze dei componenti elettronici, errori di quantizzazione nei sistemi digitali)

Per quantificare la robustezza del controllo, si introducono opportuni *indicatori di robustezza*, quali i *margini di stabilità* (margine di fase e margine di guadagno) e le funzioni di sensitività. Questi indicatori possono essere oggetto di specifiche di progetto

= Specifiche sul Comportamento in Regime Permanente
== Precisione dell'Inseguimento a Regime
L'impostazione della stabilità asintotica garantisce il raggiungimento della condizione di regime permanente. La *precisione* con cui l'uscita insegue il riferimento in tale condizione è oggetto di specifica

Le specifiche di precisione vengono definite rispetto a famiglie di segnali canonici di riferimento di interesse pratico:
- *Segnali polinomiali*: gradino (costante), rampa (variazione lineare), parabola (variazione quadratica)

- *Segnali sinusoidali*: di ampiezza e frequenza assegnate

=== Esempi di specifiche di precisione a regime
- Richiesta di *errore di inseguimento nullo* in regime permanente a un riferimento a gradin (errore a regime nullo)

- Richiesta di *errore di inseguimento limitato* (finito) in regime permanente a un riferimento a gradino o a rampa (errore a regime contenuto entro un valore massimo accettabile)

== Reiezione dei Disturbi a Regime
Il comportamento del sistema in regime permanente può essere influenzato dalla presenza di disturbi agenti sul processo, sulla misura o sull'attuazione. Tali disturbi possono alterare le caratteristiche di precisione del sistema

Opportune specifiche possono essere definite sulla capacità del sistema in regime permanente di:
- *Reiettare completamente* gli effetti dei disturbi (errore a regime nullo indotto dal disturbo)

- *Limitare* gli effetti dei disturbi entro valori massimi accettabili

= Specifiche sulla Risposta in Transitorio
== Generalità
Le specifiche sul comportamento della risposta durante il transitorio descrivono la "forma" della risposta temporale del sistema a seguito di una variazione del riferimento o di un disturbo. Solitamente, tali specifiche sono formulate rispetto al segnale di riferimento considerato più critico: il *gradino unitario*

== Precisione durante il Transitorio
Una specifica sulla precisione durante il transitorio si traduce nella richiesta che l'errore di inseguimento non superi mai in modulo un valore prefissato, garantendo che l'uscita rimanga entro una "banda" attorno al riferimento

== Principali Specifiche sulla Risposta al Gradino
Con riferimento alla risposta temporale $y(t)$ del sistema a un gradino unitario, si definiscono i seguenti indicatori

=== Sovraelongazione Massima (o Percentuale)
Indica la presenza e l'entità di oscillazioni durante il transitorio. È definita come:
$ hat(S) eq (y_"max" - y_oo)/y_oo $

Dove $y_"max"$ è il valore massimo raggiunto dall'uscita e $y_oo$ è il valore di regime. Specifiche tipiche sono $hat(S) lt.eq 5%$ o $hat(S) lt.eq 10%$. Un valore nullo indica assenza di sovraelongazione (risposta monotona)

=== Tempo di Salita $t_r$
Misura la prontezza di risposta del sistema. Esistono due definizioni alternative:

+ $t_r eq t_(90%) - t_(10%)$: intervallo di tempo in cui l'uscita passa dal $10%$ al $90%$ del valore di regime

+ $t_s eq min{t : y(t) eq y_oo}$: istante in cui l'uscita raggiunge per la prima volta il valore di regime
 
=== Tempo di Assestamento $t_a$
È il tempo impiegato dall'uscita per raggiungere "in pratica" il regime permanente. Si definisce come l'istante a partire dal quale l'uscità rimane definitivamente entro una fascia di tolleranza $epsilon$ attorno al valore di regime (tipicamente $epsilon eq plus.minus 1%, plus.minus 2%, plus.minus 5%$):
$ abs(y(t) - y_oo) lt.eq epsilon y_oo, space.en space.en space.en forall t gt.eq t_a $

Il tempo di assestamento indica la durata del transitorio

= Altre Specifiche
== Specifiche sul Comportamento in Frequenza
Possono essere assegnate specifiche di progetto direttamente sul comportamento in frequenza del sistema controllato, rappresentato dalla risposta in frequenza ad anello chiuso $W_y (j omega)$. Il sistema controllato è visto in tal caso come un *filtro* (generalmente passabasso), di cui si vogliono assegnare le principali caratteristiche:

- *Banda passante*: intervallo di frequenze per cui $abs(W_y (j omega))$ si mantiene prossimo a 1 (buon inseguimento)

- *Picco di risonanza*: massimo valore di $abs(W_y (j omega))$, legato alla sovraelongazione della risposta al gradino

Queste specifiche consentono di garantire un buon inseguimento di segnali di riferimento sinusoidali entro una pulsazione massima e l'attenuazione di disturbi al di fuori della banda di interesse

== Vincoli sulla Variabile di Comando
Le caratteristiche tecnologiche dell'azionamento impongono vincoli e limitazioni sull'andamento della variabile di comando $u_c (t)$, che devono essere tenuti in conto nel progetto del controllore. I principali vincoli sono:
- *Valore massimo in modulo (saturazione)*: l'azionamento può generare una variabile di comando limitata superiormente e inferiormente ($abs(u_c (t)) lt.eq u_"c, max"$). Una richiesta di controllo eccessiva produce saturazione, con degrado delle prestazioni e possibile instabilità

- *Slew rate massimo*: velocità massima di variazione della variabile di comando ($(d u_c)/(d t) lt.eq S R_"max"$). L'azionamento non può variare la propria uscita più rapidamente di un certo limite

Queste azioni devono essere considerate nella fase di progetto per evitare che il controllore richieda all'azionamento prestazioni fisicamente irrealizzabili