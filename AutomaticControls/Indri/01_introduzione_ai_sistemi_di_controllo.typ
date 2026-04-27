#import "../../template.typ": *

#show : project.with(
  title: "Introduzione ai Sistemi di Controllo",
  course: "Controlli Automatici"
)

= Definizioni e Componenti Fondamentali
== Architettura e Fondamenti dei Sistemi di Controllo
Nell'ambito dell'ingegneria dell'automazione, un *sistema di controllo* è configurato come un insieme di componenti interconnessi destinati a gestire, comandare o regolare il comportamento di altri dispositivi o sistemi (denominati processi o piante). L'obiettivo primario è garantire che le variabili di uscita seguano un andamento desiderato, nonostante la presenza di disturbi esterni e le incertezze del modello

L'analisi sistematica di tali architetture richiede la scomposizione del sistema nei suoi *elementi costitutivi*, ognuno caratterizzato da specifiche funzioni di trasferimento e vincoli operativi

== Il Processo o Sistema da Controllare
Il fulcro di ogni architettura di controllo è il *sistema da controllare*, ovvero l'entità fisica di cui si desidera regolare il comportamento. Esso è caratterizzato da diverse tipologie di variabili e proprietà intrinseche:

- *Variabili di Comando ($u_c$) e Disturbi ($d$)*: rappresentano gli ingressi che sollecitano il sistema. Mentre la variabile di comando è manipolata intenzionalmente, i disturbi sono sollecitazioni non desiderate che deviano il sistema dallo stato nominale

- *Variabile di Interesse ($y_s$)*: è l'uscita soggetta a controllo, la cui evoluzione temporale deve soddisfare specifici requisiti di prestazione

- *Variabili di Stato ($x$)*: rappresentano la "memoria" interna del sistema. Sebbene fondamentali per la modellizzazione matematica, esse sono raramente tutte accessibili per la misura diretta

Sotto il profilo analitico, un sistema può essere classificato in base alla sua natura *lineare o non lineare*, alla sua evoluzione *dinamica o statica*, e alla tipologia di parametri, che possono essere *costanti o variabili* nel tempo, oltre che *concentrati o distribuiti*

== Componenti della Catena di Azionamento
Per interagire con il processo fisico, è necessaria un'interfaccia capace di trasformare i segnali informativi in potenze fisiche e viceversa

=== L'Azionamento o Attuatore
L'attuatore funge da elemento di potenza. Riceve in ingresso una *variabile di controllo ($u$)*, tipicamente un segnale a bassa energia (come una tensione elettrica), e restituisce una *variabile di comando ($u_c$)* con un contenuto energetico adeguato a modificare lo stato del processo. In molti contesti industriali, l'attuatore è considerato parte integrante del sistema fisico stesso

=== Il Trasduttore
Il trasduttore è essenziale per la chiusura dell'anello di retroazione (feedback). Esso si compone tipicamente di un *sensore* e di un *condizionatore di segnale*

- *Funzione*: converte la variabile di uscita $y_s$ in una misura $y$, solitamente un segnale elettrico facilmente manipolabile

- *Trasduttore Ideale*: in fase di sintesi del controllo, si tende a ipotizzare un trasduttore con comportamento *lineare, statico e privo di disturbi*, sebbene nella realtà si debba tenere conto del rumore di misura e delle dinamiche parassite

== Sintesi del Segnale d'Errore: Riferimento e Nodo di Confronto
Il meccanismo di controllo si basa sulla continua comparazione tra lo stato attuale e lo stato desiderato

=== Il Segnale di Riferimento ($r$)
Il riferimento rappresenta l'obiettivo del sistema. Esso può coincidere direttamente con l'*uscita desiderata* ($y_"des"$) o essere legato a essa tramite un fattore di proporzionalità ($y_"des" eq K_r r $)

- Se $r$ è costante, il problema è definito come *regolazione* (mantenimento di un set-point)

- Se $r$ è variabile nel tempo, si parla di *inseguimento* o servo-sistema

=== Il Nodo di Confronto
Il nodo di confronto è l'operatore matematico (spesso realizzato circuitalmente o via software) che genera il *segnale di errore ($e$)*

L'errore di inseguimento è definito dalla differenza algebrica: 
$ e eq y_"des" - y $

Tale segnale informa il controllore sulla discrepanza esistente tra il comportamento reale e quello prefissato, innescando l'azione correttiva

== Il Controllore e il Monitoraggio
Il controllore rappresenta l'intelligenza del sistema, o "parte nobile". Esso elabora il segnale di errore $e$ per generare il segnale di controllo $u$ secondo una legge di controllo predefinita (es. PID, controllo nello spazio degli stato, etc)

Infine, un'architettura completa include spesso un *sistema di monitoraggio*, preposto alla diagnostica, alla gestione degli allarmi e alla visualizzazione dei dati, garantendo la sicurezza operativa e la supervisione del processo su scala globale

= Esempio Applicativo: Controllo di Velocità
== Analisi del Sistema di controllo di velocità di un autoveicolo
Il controllo di velocità di un autoveicolo rappresenta un esempio classico e intuitivo per introdurre i concetti fondamentali della *teoria dei controlli automatici*. In questo scenario, l'obiettivo primario è mantenere la velocità del veicolo prossima a un valore desiderato, contrastando le variazioni ambientali e i limiti fisici del sistema

Il sistema può essere analizzato attraverso la scomposizione in blocchi funzionali, dove ogni elemento svolge un ruolo specifico nella catena di retroazione

== Componenti e Variabili del Sistema
Per modellare correttamente il sistema, è necessario identificare le variabili fisiche e i segnali che intercorrono tra i diversi sottosistemi. La struttura segue lo schema a *controreazione (feedback)* tipico dei sistemi di controllo

- *Il Sistema (Processo) $S$*: rapprsenta la dinamica fisica dell'autoveicolo, ovvero la relazione tra la forza applicata e la velocità risultante. È identificabile con la *massa dell'autoveicolo*

- *Variabile Controllata (Uscita) $y_s$*: è la grandezza fisica che si desidera monitorare e regolare, in questo caso la *velocità effettiva* del mezzo

- *Riferimento (Setpoint) $r eq.triple y_"des"$*: indica il valore di velocità desiderata (ad esempio $80 (k m)/h$)

- *Errore di Inseguimento $e$*: definito come la differenza tra il riferimento e la misura dell'uscita ($e eq y_"des" - y$). È il segnale che guida l'azione del controllore

- *Controllore $C$*: in un sistema a guida manuale, il controllore è l'*automobilista*, che elabora l'errore percepito per decidere l'azione correttiva

- *Segnale di Controllo $u$*: corrisponde alla *posizione dei pedali* (acceleratore e o freno) decisa dal controllore

- *Attuatore (Azionamento) $A$*: è il *motore* del veicolo, che trasforma il segnale di controllo (posizione pedale) in una grandezza di potenza

- *Variabile di Comando $u_c$*: la *forza (o coppia)* effettivamente sviluppata dal motore e applicata al sistema

- *Trasduttore $T$*: lo strumento di misura, ovvero il *tachimetro*, che fornisce la misura delle velocità $y$ al controllore

== Modellazione dei Disturbi
Un sistema di controllo reale deve essere in grado di rigettare i *disturbi* ($d_s$), ovvero ingressi non desiderati che alterano lo stato del sistema indipendentemente dall'azione di controllo. Nel caso dell'autoveicolo, si distinguono principalmente:

+ *Resistenza aerodinamica*: forza indotta dalla velocità dell'aria che si oppone al moto

+ *Pendenza stradale*: la componente della forza di gravità che agisce lungo l'asse del moto quandi il veicolo percorre salite o discese

== Specifiche di Prestazione
La progettazione di un sistema di controllo mira a soddisfare determinati requisiti, definiti *specifiche*, che qualificano la bontà del comportamento dinamico e statico:

#align(center)[
  #table(
    columns: (1fr, 1fr),
    align: center + horizon,
    inset: 8pt,
    
    [Specifica], [Descrizione],
    [Precisione Statistica], [Capacità di mantenere la velocità entro un margine di errore prefissato a regime],
    
    [Rigetto dei Disturbi], [Insensibilità del sistema alle variazioni di carico o pendenza, minimizzando l'impatto sulla velocità],

    [Rapidità di Risposta], [Tempo necessario affinchè il sistema raggiunga il nuovo riferimento a seguito di una variazione],

    [Smorzamento], [Modalità di raggiungimento del target, che può essere monotona o con sovraelongazione]
  )
]

= Strutture Tipo e Schemi di Principio
== Controllo in Catena Chiusa con Retroazione dallo Stato
È la struttura studiata nella prima parte del corso. Il controllore utilizza la misura (o la stima) dell'0intero vettore di stato $x$ per generare il segnale di controllo $u eq -K x + alpha r$. L'attuatore e il trasduttore sono inclusi nel blocco del sistema generalizzato $cal(S)$

== Controllo in Catena Chiusa con Osservatore
Quando lo stato non è accessibile, si impiega uno stimatore asintotico (osservatore di Luenberger $cal(O)$) per ricostruire $hat(x)$ a partire da $u$ e $y$. Il controllore utilizza la stima: $u eq -K hat(x) + alpha r $

== Controllo in Catena Aperta
Nella struttura in catena aperta, il segnale di controllo $u$ è generato dal solo riferimento, senza misura dell'uscita. Questa soluzione è più semplice ma non è in grado di compensare disturbi o incertezze sul modello del sistema. È utilizzabile solo quando il sistema è perfettamente noto e non soggetto a disturbi

== Realizzazione Analogica e Digitale
- *Realizzazione Analogica*: il controllore è un circuito elettronico (amplificatori operazionali, resistenze, condensatori) che elabora segnali continui nel tempo

- *Realizzazione Digitale*: i segnali sono campionati e quantizzati da convertitori A/D, elaborati da un algoritmo su microprocessore, e riconvertiti da convertitori D/A

= Sistemi, Modelli e Progetto del Controllo
== Classificazione dei Sistemi
Un sistema reale può essere classificato in base a diverse caratteristiche:
- *Lineare / Non Lineare*: se vale o meno il principio di sovrapposizione degli effetti

- *Dinamico / Statico*: se l'uscita dipende dai valori passati dell'ingresso (presenza di elementi di memoria) o solo dal valore attuale

- *A parametri costanti / variabili*: se i parametri fisici sono invarianti nel tempo o soggetti a derive

- *Con disturbi additivi / senza disturbi*: se sono presenti ingressi indesiderati non manipolabili

== Procedura di Progetto
Il progetto di un sistema di controllo segue un processo iterativo. I passi fondamentali sono:
+ *Modellistica*: si costruisce il *Modello Ideale* (MI) del sistema, ovvero un insieme di equazioni matematiche (differenziali, di stato) che ne descrivono la dinamica. Tipicamente si tratta di un modello non lineare ottenuto da leggi fisiche

+ *Linearizzazione*: si ricava dal modello ideale un *Modello Linearizzato* (MII) nell'intorno di un punto di lavoro di interesse. Questo modello LTI consenti di applicare gli strumenti di analisi e sintesi studiati nel corso

+ *Progetto del Controllore (PR)*: utilizzando il modello linearizzato, si progetta il controllore $C$ secondo le specifiche (assegnazione poli, risposta a regime, etc)

+ *Verifica con MII*: si simulano le prestazioni del sistema controllato sul modello linearizzato. Se le specifiche sono soddisfatte, si itera il progetto

+ *Verifica con MI*: si validano le prestazioni sul modello non lineare originale. Effetti non catturati dalla linearizzazione (saturazioni, nonlinearità residue) potrebbero degradare le prestazioni

+ *Verifica sul Sistema Reale*: si implementa il controllore sul sistema fisico (o su un suo simulatore ad alta fedeltà). Eventuali discrepanze tra modello e realtà (incertezze parametriche, dinamiche trascurate) possono richiedere uina riprogettazione (ritorno al passo 1 o 3)