- # Indice
- ((6387a01d-728a-43d3-a37e-a6a3c9363b8b))
- ((63879d9f-ea94-4e39-a35d-0c682e4446df))
	- ((63879bef-a5ac-455a-b698-d472b3b4d0ca))
	- ((63879c12-c982-4b61-bb69-6dfa24c11950))
	- ((63879f63-436c-4ea6-8de1-b06aeb7aee3d))
	- ((6387a12a-bf33-4228-a657-f74bc1595117))
- ((63879f6c-52eb-4d9f-8282-77bfe7f7d53a))
- # Rischi
  id:: 6387a01d-728a-43d3-a37e-a6a3c9363b8b
	- ![Screenshot_3.png](../assets/Screenshot_3_1669832748126_0.png){:height 285, :width 476}
	- #+BEGIN_QUOTE
	  Cosa può andare storto?
	  Con quale probabilità?
	  Quanto rischioso?
	  #+END_QUOTE
	- #+BEGIN_QUOTE
	  Risk management is concerned with identifying risks and
	  drawing up plans to minimise their effect on a project.
	  “A risk is a possible future negative event that may
	  affect the success of an effort” [VV8.3]
	  - Project risks affect schedule or resources;
	  - Product risks affect the quality or performance of the software
	  being developed;
	  - Business risks affect the organisation developing or procuring the
	  #+END_QUOTE
	- #+BEGIN_QUOTE
	  1. Risk identification
	  - Identify project, product and business risks;
	  2. Risk analysis
	  - Assess the likelihood and consequences of these risks;
	  - Called “Risk Exposure” in VV
	  3. Risk planning
	  - Draw up plans to avoid or minimise the effects of the risk;
	  - From VV:
	  - risk avoidance, transfer, acceptance
	  - Like in deadlock handling
	  4. Risk monitoring
	  - Monitor the risks throughout the project;
	  #+END_QUOTE
- # Requisiti
  id:: 63879d9f-ea94-4e39-a35d-0c682e4446df
	- #+BEGIN_QUOTE
	  **Cos'è un requisito?**
	  - Dichiarazione astratta di alto livello di un servizio o di un vincolo del sistema
	  - Specifiche matematiche funzionali dettagliate.
	  - Definisce i confini del sistema
	  #+END_QUOTE
	- #+BEGIN_QUOTE
	  I requisiti devono essere completi e coerenti.
	  
	  **Completi**
	  Devono includere le descrizioni di tutte le facility richieste.
	  
	  **Coerenti**
	  Non ci devono essere conflitti o contraddizioni nelle descrizioni delle facility del sistema.
	  #+END_QUOTE
	- ![Screenshot_6.png](../assets/Screenshot_6_1669835894157_0.png){:height 282, :width 502}
		- ***Requirements Elicitation***
		  id:: 63879bef-a5ac-455a-b698-d472b3b4d0ca
			- #+BEGIN_QUOTE
			  Coinvolge il personale tecnico che lavora con i clienti per conoscere il dominio applicativo, i servizi che il sistema deve fornire e i vincoli operativi del sistema.
			  #+END_QUOTE
		- ***Requirements discovery***
		  id:: 63879c12-c982-4b61-bb69-6dfa24c11950
			- #+BEGIN_QUOTE
			  **Tecniche per scoprire i requisiti**
			  Colmare il divario tra utente finale e sviluppatore:
			  - Questionari e interviste: Porre all'utente finale un elenco di domande preselezionate.
			  - Etnografia: Osservare gli utenti finali nel loro ambiente operativo
			  - Storie e scenari dell'utente: Descrivono l'uso del sistema come una serie di interazioni tra un utente finale concreto e il sistema.
			  - Casi d'uso: Astrazioni che descrivono una classe di scenari.
			  #+END_QUOTE
		- ***Prioritizzazione***
		  id:: 63879f63-436c-4ea6-8de1-b06aeb7aee3d
			- #+BEGIN_QUOTE
			  **Alta priorità**
			  - Affrontato in fase di analisi, progettazione e implementazione
			  - Deve essere dimostrata la presenza di una caratteristica ad alta priorità.
			  
			  **Priorità media**
			  - Affrontato durante l'analisi e la progettazione
			  - Di solito viene dimostrato nella seconda iterazione.
			  
			  **Priorità bassa**
			  - Affrontato solo in fase di analisi
			  - Illustra come il sistema verrà utilizzato in futuro con una tecnologia non ancora disponibile.
			  #+END_QUOTE
-
	- ## Requisiti non funzionali
	  id:: 6387a12a-bf33-4228-a657-f74bc1595117
		- #+BEGIN_QUOTE
		  - Vincoli sui servizi o sulle funzioni offerte dal sistema, come ad es. vincoli temporali, vincoli sul processo di sviluppo, standard, ecc.
		  - Spesso si applicano al sistema nel suo complesso piuttosto che a singole caratteristiche o servizi
		  #+END_QUOTE
		- ![Screenshot_2.png](../assets/Screenshot_2_1669832516000_0.png){:height 321, :width 456} 
		  ![Screenshot_4.png](../assets/Screenshot_4_1669833163216_0.png){:height 311, :width 456}
	- #+BEGIN_QUOTE
	  Possono avere relazioni dirette o indirette tra loro.
	  Un singolo requisito non funzionale, come ad esempio un requisito di sicurezza, può avere un impatto su una serie di requisiti funzionali correlati
	  #+END_QUOTE
	- ### Quality Requirements
		- **Usability**
			- #+BEGIN_QUOTE
			  La facilità con cui gli attori possono utilizzare un sistema per
			  svolgere una funzione
			  - L'usabilità è uno dei termini più frequentemente utilizzati in modo improprio
			  - Deve essere misurabile, altrimenti si tratta di marketing
			  Esempio: Specificazione del numero di passaggi per effettuare un acquisto via internet con un browser web
			  #+END_QUOTE
	- ### Dependability & Security Requirements
		- ![Screenshot_5.png](../assets/Screenshot_5_1669833525125_0.png){:height 291, :width 548}
		- #+BEGIN_QUOTE
		  L'affidabilità riflette il grado di fiducia dell'utente nel sistema che il sistema funzionerà come gli utenti si aspettano e che non si che non si "guasterà" durante il normale utilizzo.
		  #+END_QUOTE
			- **Reliability**
				- #+BEGIN_QUOTE
				  The probability of failure-free system operation over a
				  specified time in a given environment for a given purpose
				  → Reliability is concerned with conformance to a given specification
				  and delivery of service
				  #+END_QUOTE
			- **Availability**
				- #+BEGIN_QUOTE
				  → The probability that a system, at a point in time, will be
				  operational and able to deliver the requested services
				  → Both can be expressed in % (e.g., 99% of availability or reliability)
				  #+END_QUOTE
				- #+BEGIN_QUOTE
				  Mean time Between Failure (MTBF)
				  Mean time to Failure (MTTF)
				  Mean time to Repair (MTTR)
				  Availability = MTBF/(MTBF+MTTR)
				  #+END_QUOTE
			- **Safety**
				- #+BEGIN_QUOTE
				  Safety is a property of a system that reflects the system’s
				  ability to operate, normally or abnormally, without
				  danger of causing human injury or death and without
				  damage to the system’s environment
				  It is increasingly important to consider software safety as
				  more and more devices incorporate softwarebased
				  control systems
				  Safety requirements are exclusive requirements i.e. they
				  exclude undesirable situations rather than specify
				  required system services
				  #+END_QUOTE
				- #+BEGIN_QUOTE
				  Safety and reliability are related but distinct
				  → In general, reliability and availability are necessary but
				  not sufficient conditions for system safety
				  Reliability is concerned with conformance to a given
				  specification and delivery of service
				  Safety is concerned with ensuring system cannot
				  cause damage irrespective of whether
				  or not it conforms to its specification
				  #+END_QUOTE
			- **Security**
				- #+BEGIN_QUOTE
				  The security of a system is a system property
				  that reflects the system’s ability to protect
				  itself from accidental or deliberate
				  external attack
				  #+END_QUOTE
				- #+BEGIN_QUOTE
				  Security is an essential pre-requisite for availability,
				  reliability and safety
				  If a system is a networked system and is insecure then
				  statements about its reliability and its safety are unreliable
				  These statements depend on the executing system and the
				  developed system being the same. However, intrusion can
				  change the executing system and/or its data
				  Therefore, the reliability and safety assurance is no longer
				  valid
				  #+END_QUOTE
		- #+BEGIN_QUOTE
		  Altre proprietà di Dependability
		  **Riparabilità**
		  - Riflette la misura con cui il sistema può essere riparato in caso di guasto.
		  **Manutenibilità**
		  - Riflette la misura con cui il sistema può essere adattato a nuovi requisiti.
		  **Sopravvivenza**
		  - Riflette la misura con cui il sistema è in grado di fornire servizi anche sotto attacco ostile
		  **Tolleranza ai guasti**
		  - Riflette la misura con cui i guasti possono essere evitati e tollerati.
		  #+END_QUOTE
		- #+BEGIN_QUOTE
		  Alti livelli di affidabilità possono essere raggiunti solo a scapito delle prestazioni del sistema.
		  Il software affidabile include codice aggiuntivo, spesso ridondante, per eseguire il necessario controllo degli stati eccezionali del sistema e per recupero dai guasti del sistema
		  
		  I costi della Dependability tendono ad aumentare esponenzialmente con l'aumentare dei livelli di affidabilità richiesti
		  #+END_QUOTE
- # Scenari d'uso
  id:: 63879f6c-52eb-4d9f-8282-77bfe7f7d53a
	- #+BEGIN_QUOTE
	  Gli scenari devono includere
	  - Descrizione della situazione di partenza;
	  - Descrizione del normale flusso di eventi;
	  - Descrizione di ciò che può andare storto;
	  - Informazioni su altre attività concomitanti;
	  - Una descrizione dello stato al termine dello scenario.
	  #+END_QUOTE
	- #+BEGIN_QUOTE
	  Descrivete ciascuno di questi casi d'uso in modo più dettagliato
	  - Attori partecipanti
	  - Descrivere la condizione di ingresso
	  - Descrivere il flusso degli eventi
	  - Descrivere la condizione di uscita
	  - Descrivere le eccezioni
	  - Descrivere i requisiti non funzionali
	  #+END_QUOTE
-