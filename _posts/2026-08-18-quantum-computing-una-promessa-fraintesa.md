---
layout: post
date: 2026-08-18
title: "Quantum computing: una promessa fraintesa?"
subtitle: Cosa sappiamo (e sappiamo spiegare) davvero di questa tecnologia
description: Capire cosa può fare davvero un computer quantistico, dove finisce la promessa e inizia il mito.
category: theory
---

I computer quantistici sono tra le tecnologie più discusse del nostro tempo. Vengono spesso raccontati come sistemi capaci di superare i limiti fisici e tecnologici dei calcolatori classici, risolvendo problemi di frontiera in qualunque ambito scientifico o industriale. Questa narrazione iperbolica non nasce solo da sensazionalismo giornalistico o dalle (comprensibili?) dinamiche di attrazione dei fondi di ricerca. C'è un problema metodologico più profondo: "*il calcolo quantistico è intrinsecamente difficile da spiegare in modo semplice ed onesto senza ricorrere alla matematica*", come osservato da Scott Aaronson [^1], uno dei principali esperti teorici di quantum computing.


La distanza tra ciò che la scienza sa e ciò che la divulgazione riesce a comunicare è guidata da due ragioni fondamentali:

1. **la meccanica quantistica è aliena all'esperienza quotidiana.** I suoi fenomeni primari sono profondamente controintuitivi. Anche i fisici si lasciano guidare dal formalismo matematico delle equazioni anziché dall'intuizione per capirne il comportamento, come evidenziato dalla celebre frase di Richard Feynman: "*Penso di poter dire in tutta sicurezza che nessuno capisce la meccanica quantistica.*";
2. **la teoria quantistica non è un singolo *algoritmo*, ma, per l'appunto, una *cornice teorica***, un intero paradigma di calcolo basato su leggi fisiche differenti da quelle classiche. Metaforicamente, **il calcolo quantistico non mette a disposizione una singola nuova procedura sperimentale, ma un intero laboratorio** all'interno del quale formulare un problema e trovarne soluzioni.

Il risultato di questo divario è che le spiegazioni divulgative rimangono spesso incomplete, lasciando all'oscuro il legame tra il principio fisico e l'applicazione concreta. Una delle più popolari afferma che "il computer quantistico esplora contemporaneamente tutte le possibili soluzioni", rendendo triviali problemi che richiederebbero millenni di calcolo. Questo approccio, però, non descrive tanto la meccanica quantistica, quanto banalmente un massiccio parallelismo. Ciò che rende davvero unico il calcolo quantistico è la combinazione di due ingredienti fondamentali: **la probabilità** e **il comportamento ondulatorio**, che descriviamo brevemente di seguito.

**La probabilità:** Lo stato di un sistema quantistico (cioè, la descrizione di come è fatto in un dato istante) può contenere più configurazioni del sistema allo stesso tempo; in un certo senso, più scenari potenzialmente realizzabili. Tuttavia, l'accesso a questo stato è vincolato da un'**interpretazione probabilistica**: ognuna delle configurazioni è possibile con una data probabilità, ma, misurando lo stato del sistema, solo una di queste verrà osservata.

**Il comportamento ondulatorio:** A ciascuna di queste configurazioni possiamo associare una grandezza, detta **ampiezza**, che oscilla nel tempo, proprio come un'onda sonora. La probabilità che una configurazione venga osservata è l'**intensità** di quest'onda.

Utilizzando la descrizione ondulatoria e probabilistica della meccanica quantistica possiamo ingegnerizzare algoritmi alternativi a quelli classici e potenzialmente più efficaci. Sebbene la struttura di questi algoritmi possa variare, i principi generali rimangono gli stessi. Innanzitutto, si prepara uno stato quantistico in cui le configurazioni che lo compongono rappresentano delle possibili soluzioni al problema. Successivamente, l'algoritmo agisce su questo stato per selezionare quelle corrette. Uno degli approcci quantistici più popolari è quello che sfrutta **l'interferenza distruttiva** tra onde per selezionare risposte corrette a un problema. Lo spieghiamo di seguito.

## Un esempio di algoritmo quantistico
Il principio di funzionamento di questo algoritmo è analogo a quello di un oggetto quotidiano: le cuffie con cancellazione attiva del rumore. Basta indossarle e i rumori di fondo spariscono. Per quanto possa sembrare poco intuitivo, la tecnologia sottostante non *assorbe* il suono per eliminare il rumore, ma ne *produce* uno opposto: il dispositivo registra l'onda sonora indesiderata e ne genera un'identica ma capovolta. Quando le due onde si sovrappongono, si verifica il fenomeno dell'**interferenza distruttiva**: nei punti in cui l'onda originale sale, quella prodotta scende, riducendo l'ampiezza risultante (e quindi l'intensità del rumore) idealmente a zero.

![Interferenza Costruttiva e Distruttiva]({{ "/assets/images/interferenza_costruttiva_distruttiva.svg" | relative_url }})
{: .centered-image}

L'algoritmo funziona secondo lo stesso principio logico: agendo sul sistema, questo coreografa un fenomeno di interferenza in cui le ampiezze di probabilità associate alle varie soluzioni interagiscono tra loro:

* le **soluzioni errate** vengono fatte interferire in modo **distruttivo**, annullandone la probabilità di essere misurate;
* le **soluzioni corrette** vengono fatte interferire in modo **costruttivo**, amplificandone la probabilità.

Poiché la risposta non è nota a priori (altrimenti non ci sarebbe alcun problema da risolvere), l'algoritmo non può indirizzare l'interferenza conoscendo la soluzione specifica, ma deve farlo sfruttando le **proprietà strutturali** che la soluzione deve soddisfare.

Per capire meglio questo passaggio, pensiamo al problema che risolve quotidianamente un servizio come Google Maps: determinare il percorso ottimale tra due punti. L'itinerario finale è sconosciuto all'inizio, ma è nota una sua proprietà fondamentale: questo percorso deve minimizzare il tempo di percorrenza sotto determinati vincoli (ad es. l'assenza di pedaggi).

Analogamente, possiamo guidare il sistema quantistico verso la soluzione quando le sue proprietà sono ben definite e strutturate. Tornando all'analogia delle cuffie: è facile cancellare un rumore di fondo regolare e prevedibile, mentre è estremamente difficile farlo quando il rumore non possiede alcuna differenza sistematica rispetto al segnale che si desidera isolare. Nel linguaggio della meccanica quantistica, sono necessarie **simmetrie e strutture algebriche** che permettano all'algoritmo di identificare le componenti di onda su cui applicare l'interferenza.


## Oltre il mito della "bacchetta magica"

Da questa complessità emerge con chiarezza che il computer quantistico non è affatto una bacchetta magica universale. Al pari di qualunque altro avanzamento tecnologico, il suo impatto va valutato delimitando la specifica classe di problemi in cui sussiste un reale margine di superiorità rispetto alla simulazione classica, e formalizzando la misura di tale vantaggio.

Tipicamente, nei calcoli di complessità computazionale questo non è descritto da un fattore fisso di accelerazione (ad es. "100 volte più veloce"), ma dalla **scalabilità** dell'algoritmo al crescere della dimensione del problema. Poiché la gestione dell'hardware quantistico è molto complessa, ci si aspetta che, se un vantaggio è presente, questo emerga nettamente solo per problemi di dimensioni medio-grandi.

Dato che il confronto non avviene tra due singoli programmi, ma tra due diverse cornici teoriche e materiali ("due laboratori", quello classico e quello quantistico), per affermare con certezza che un problema dimostri la cosiddetta **supremazia quantistica** (termine coniato da John Preskill [^2]) occorre soddisfare rigorosamente due condizioni:

1. trovare un algoritmo quantistico in grado di risolvere il problema velocemente (es. in tempo polinomiale rispetto alle dimensioni del sistema);
2. **dimostrare che nessun algoritmo classico potrà mai fare altrettanto** con la medesima efficienza.

Verificare la seconda condizione è particolarmente ostico: così come accade per il famoso problema [**P contro NP**](https://it.wikipedia.org/wiki/Classi_di_complessit%C3%A0_P_e_NP), che affronteremo in dettaglio in un post separato, la teoria attuale non possiede ancora gli strumenti matematici per escludere in modo definitivo l'esistenza di un algoritmo classico efficiente. Storicamente, infatti, diversi presunti "vantaggi quantistici" sono crollati perché si è scoperto che le assunzioni utilizzate nell'algoritmo quantistico potevano essere sfruttate anche da un algoritmo classico, in un processo noto come *dequantizzazione*: l'esempio più celebre è l'algoritmo di Ewin Tang [^3] che, nel 2018, dimostrò come un sistema di raccomandazione ritenuto un caso solido di vantaggio quantistico esponenziale potesse in realtà essere replicato da un algoritmo classico con un rallentamento solo polinomiale.

La storia recente delle rivendicazioni di *supremazia quantistica* illustra bene questa tensione:

* **Google vs. IBM (2019):** Google annunciò la supremazia quantistica con il processore *Sycamore*, affermando che il campionamento di un circuito casuale, completato in circa 200 secondi sul chip quantistico, avrebbe richiesto 10.000 anni al più potente supercomputer classico [^4]. Pochi giorni dopo, [IBM smentì la stima](https://www.ibm.com/quantum/blog/on-quantum-supremacy) dimostrando che, ottimizzando l'architettura di memoria e l'algoritmo classico sul supercomputer *Summit*, lo stesso calcolo era eseguibile in soli 2,5 giorni.
* **D-Wave vs. Flatiron Institute: (2025)** D-Wave ha pubblicato su *Science* una dimostrazione di vantaggio quantistico su un problema di fisica dei materiali, dichiarato troppo complesso per qualsiasi computer classico. Nel maggio 2026, i ricercatori del Flatiron Institute hanno pubblicato un algoritmo classico in grado di riprodurre gli stessi risultati; [D-Wave ha risposto](https://quantumcomputingreport.com/d-wave-systematically-rebuts-flatiron-claims-reaffirming-beyond-classical-simulation-milestones/) sostenendo che la simulazione classica funzioni solo sui casi più semplici, e non su quelli.

## Conclusioni

Il computer quantistico rappresenta una delle frontiere più affascinanti della scienza moderna, che riesce a sintetizzare rigore teorico, successo sperimentale e ampie potenzialità applicative. Riconoscere i confini di questa tecnologia e saperli comunicare con trasparenza è fondamentale per evitare aspettative irrealistiche, le cui distorsioni rischiano di condizionare negativamente le scelte in ambito economico, industriale e culturale. Partendo da una chiara comprensione di questi limiti è possibile superare le scorciatoie retoriche e trasformare quella che oggi è spesso una promessa fraintesa in solida conoscenza.

## Fonti

[^1]: Scott Aaronson — ["Why Is Quantum Computing So Hard to Explain?"](https://www.quantamagazine.org/why-is-quantum-computing-so-hard-to-explain-20210608/) (Quanta)
[^2]: John Preskill — ["John Preskill explains quantum supremacy"](https://www.quantamagazine.org/john-preskill-explains-quantum-supremacy-20191002/) (Quanta)
[^3]: Kevin Hartnett — ["Teenager finds classical alternative to quantum recommendation algorithm"](https://www.quantamagazine.org/teenager-finds-classical-alternative-to-quantum-recommendation-algorithm-20180731/) (Quanta)
[^4]: [Google result on quantum supremacy](https://research.google/blog/quantum-supremacy-using-a-programmable-superconducting-processor/)