# A Hypergraph-based Decentralized Infinite State Machine Model Compatible with Semantic Spacetime and Promise Theory

Steve Traugott[^stevegt], Rebecca Snyder[^rebecca]

## Abstract

We introduce the concept of a decentralized infinite state machine (DISM) in which each agent manages its local state and interacts with other agents by making promises about future state transitions. We postulate that this DISM framework is compatible with both Semantic Spacetime (SST) and Promise Theory (PT), providing a natural model for decentralized systems where the interaction between autonomous agents defines system behavior. Additionally, we propose a generic language for describing state transitions in DISM that aligns with SST and PT principles. This language relies on the concept of promises, where the DISM kernel (the agent) signs tuples that describe transitions between functions without those functions making promises themselves. We suspect that this model maintains a separation of concerns between the kernel and hosted functions that is consistent with Promise Theory.

## Foreword
*-- By Steve Traugott*

XXX Retrospective on the prehistory of the DevOps movement's concepts and cultures of convergence, congruence, promise theory, semantic spacetime. Desire for reconciliation between these concepts.

## Discussion

We propose a system for computing, communication, and governance built on consensus mechanisms, specifically designed to tackle the challenges in collaborative work and leadership that hinder organizations and communities, including non-profits and businesses.

This system serves as a decentralized computation network, analogous to how the Internet operates as a decentralized communication network. Just as the Internet is a distributed network, our system functions as a decentralized computer. It is owned and operated by its users rather than any single legal entity, ensuring that the grid remains scalable and resilient as more users join.

In a nutshell, if the [theory](#theory) section is correct, then we should be able to build a decentralized system for equitable and accurate group communication, computation, and decision-making using current technology and concepts from graph theory.

The general idea is that the universe can be modeled as a hypergraph, where each node in the graph is a state of an agent, and each edge in the graph is an action taken by an agent in response to a stimulus. A hypergraph that models the universe can also be thought of as an infinite state machine.

Promise Theory and Semantic Spacetime provide a framework for understanding how agents interact in a decentralized system; a hypergraph appears to be able to model these interactions completely.

States, agents, and graph edges can be referenced by cryptographic hash in content-addressable storage, avoiding the need for central registration of code or data.

As of this writing we are currently working on a proof of concept implementation of this system, using existing libraries for low-level message framing and content-addressable data storage.

XXX need a pretty picture here showing a 3D hypergraph with states and transitions moving upward in time, maybe openscad

## Prediction

If the following model is correct, then we should be able to use it as a basis for design of a decentralized system that can be used to compute any function computable by machine.

It is also reasonable that, if the resulting system includes agents that are super-Turing, e.g. human agents, then the system should be able to compute any function computable by a human.

Finally, if the system includes multiple agents that are human, then it should be able to compute any function computable by a group of humans, including analysis, consensus formation, conflict detection and resolution, and decision recording.

## Theory

### Semantic Spacetime and DISM Compatibility

It's possible that the concepts behind PT, SST, and DISMs are compatible, allowing us to develop a cohesive framework for decentralized computation. By integrating the principles of PT and SST into a DISM framework, we can model decentralized systems where agents operate autonomously, interact locally, and contribute to the emergent behavior of the system as a whole.

The health of any decentralized system relies on the promises that each agent makes to the others. It's important to consider that the developers of a system are themselves agents -- in the case of software-based systems, for instance, the developers who encode the governance algorithms issue promises regarding the behavior of the system.

This paper explores the relationship between ISM, PT, and SST and introduces a generic language for describing state transitions in a way that aligns with these theories.

For the purposes of this paper, it may be helpful to think of a promise as an assertion of fact as of a particular point on a timeline, with veracity equal to true, false, or undecided.

Semantic Spacetime offers a conceptual framework for understanding decentralized systems as a set of agents operating autonomously in both space and time. Agents in SST interact with their environment and each other based on local information and promises. Time and space are fundamental aspects of how agents coordinate and change state.

In the context of ISM, SST can be seen as the backdrop against which agents make promises about state transitions. Each state transition occurs within the spacetime context, and the "next state" in the ISM corresponds to a new configuration of the agent's spacetime environment.

By making promises about the future (the next function to be executed and its expected outputs), agents in an ISM align with the SST principle that system behavior is the emergent result of local interactions in spacetime.

### A Generic Language for State Transitions

To enable ISM compatibility with Promise Theory and Semantic Spacetime, we propose a generic language for describing state transitions. This language uses a tuple format to capture promises about function execution. The proposed format is as follows:

`(f1, invars, outvars, f2)`

Where:

1. **f1 (Current Algorithm/State):**
   - **Definition:** Represents the current algorithm or function that the agent (e.g., an ISM kernel) is executing. This is more than a simple state variable; it's an active process or behavior.
   - **Role:** Serves as the starting point for processing. It encapsulates both the logic and the internal state of the agent before any new input is processed.

2. **invars (Input Variables):**
   - **Definition:** A set of input variables provided to **f1**. These variables can be simple data types or complex, nested structures (akin to Lincoln Stein's *BoulderIO* streaming of nested variables).
   - **Role:** Act as the external data or stimuli that **f1** processes. They influence how the agent's current algorithm operates and can lead to state changes.

3. **outvars (Output Variables):**
   - **Definition:** The set of output variables produced by **f1** after processing **invars**. Like **invars**, these can be nested and complex.
   - **Role:** Represent the results of the computation or transformation performed by **f1**. These outputs can be consumed by other agents or used for further processing.

4. **f2 (Next Algorithm/State):**
   - **Definition:** The algorithm or function that the agent will execute next. **f2** may be the same as **f1** or a modified version, depending on internal side effects during processing.
   - **Role:** Captures the agent's new state after processing. If executing **f1** with **invars** leads to internal changes (e.g., updates to internal variables), these changes are reflected in **f2**.

#### **How the Model Works**

- **State Transition Process:**
  1. **Processing Inputs:** The agent uses **f1** to process **invars**.
  2. **Producing Outputs:** The processing yields **outvars**, which are the outputs or results of **f1**.
  3. **Internal Side Effects:** While processing, **f1** may undergo internal changes (side effects), leading to a new state (**f2**).
  4. **Next State:** The agent transitions to **f2**, which incorporates any modifications from the side effects. If there are no side effects, then **f2 = f1**.

#### **Key Characteristics**

- **Algorithms as Stateful Entities:**
  - Both **f1** and **f2** represent not just functions but the state of the agent's processing logic, including any internal variables or configurations.

- **Emphasis on State Transitions:**
  - The model focuses on how the agent's state evolves over time, rather than viewing functions as stateless operations.

- **Internal Side Effects:**
  - Changes within **f1** during processing are considered side effects that lead to **f2**. This highlights the dynamic nature of the agent's behavior.

- **Deterministic Promises:**
  - The agent makes a promise that, given **invars**, it will produce **outvars** and transition to **f2**. This aligns with *Promise Theory*, emphasizing reliable and predictable interactions.

#### **Relation to Promise Theory and Smart Spacetime**

- **Promise Theory (PT):**
  - **Autonomy and Local Control:** Each agent independently manages its state transitions based on local inputs, adhering to PT's principle of autonomous agents.
  - **Promises as Commitments:** The agent commits to specific behaviors (processing inputs to outputs) without being controlled by external entities.

- **Smart Spacetime (SST):**
  - **Spacetime Framework:** The model maps the temporal evolution (time) and the arrangement of agents and data (space).
  - **Interacting Agents:** Agents interact through **invars** and **outvars**, influencing each other's states over time.

#### **Benefits of the Model**

1. **Modularity:**
   - Agents encapsulate their processing logic and state, making the system easier to understand and maintain.

2. **Scalability:**
   - Decentralized management of state allows the system to scale without centralized bottlenecks.

3. **Adaptability:**
   - Agents can evolve over time as **f1** transitions to **f2**, enabling dynamic behavior.

4. **Transparency:**
   - Explicit representation of inputs, outputs, and state changes enhances clarity.

#### **Practical Applications**

- **Version Control Systems (e.g., Git):**
  - **f1:** Current commit hash (repository state).
  - **invars:** Set of changes (deltas) to apply.
  - **outvars:** May be minimal or empty; the focus is on state transition.
  - **f2:** New commit hash after applying changes.

- **Data Processing Pipelines:**
  - **f1:** Current data transformation function.
  - **invars:** Input data stream.
  - **outvars:** Transformed data.
  - **f2:** Updated function if the transformation logic changes due to processing.

- **Distributed Systems:**
  - **f1:** Current state of a node or service.
  - **invars:** Messages or requests from other nodes.
  - **outvars:** Responses or actions taken.
  - **f2:** New state after processing messages.

- **Machine Learning Models:**
  - **f1:** Current model parameters.
  - **invars:** Training data batch.
  - **outvars:** Updated model performance metrics.
  - **f2:** Model with new parameters after training.

### The Role of the DISM Kernel in State Transitions

The tuple should be signed by the local DISM kernel hosting f1, rather than by f1 itself. The DISM kernel acts as the agent making promises about state transitions. It provides the runtime environment for functions (f1, f2, etc.), and is able to influence their behavior, therefore functions should be considered components of the kernel, rather than independent agents themselves.

## Possible Implementation 

XXX move to before theory section, after discussion

### Suggested Encoding

To encode the promises (claims) made by agents within the DISM framework, the following encoding standards are suggested:

#### CBOR (Concise Binary Object Representation)

**CBOR** is a binary data serialization format that is designed to be small in size and fast to parse. It is well-suited for encoding structured data like promises because of its compactness and flexibility.

- **Advantages:**
  - **Efficiency:** Binary format reduces the size of the encoded data, which is beneficial for distributed systems where bandwidth may be limited.
  - **Flexibility:** Supports a wide range of data types, including complex nested structures.
  - **Interoperability:** Widely supported across various programming languages and platforms.

- **Usage in DISM:**
  - Encode the promise tuples `(f1, invars, outvars, f2)` using CBOR to ensure efficient transmission and storage.
  - Facilitate quick parsing and validation of promises by agents.

#### COSE (CBOR Object Signing and Encryption)

**COSE** builds upon CBOR by introducing mechanisms for signing and encrypting data. This is essential for ensuring the integrity and confidentiality of promises exchanged between agents.

- **Advantages:**
  - **Security:** Provides cryptographic signing to verify the authenticity of promises.
  - **Encryption:** Ensures that sensitive information within promises is protected from unauthorized access.
  - **Standardization:** Adheres to established standards, promoting interoperability.

- **Usage in DISM:**
  - Sign promise tuples with COSE to guarantee that they originate from trusted agents.
  - Encrypt promises when necessary to protect confidential state transitions or sensitive agent interactions.

#### CWT (CBOR Web Token)

**CWT** leverages CBOR and COSE to create secure tokens that can carry claims (promises) in a compact and verifiable manner. It is analogous to JWT (JSON Web Tokens) but optimized for environments where space and efficiency are critical.

- **Advantages:**
  - **Compactness:** Suitable for systems where bandwidth and storage are at a premium.
  - **Security:** Inherits COSE's signing and encryption capabilities.
  - **Extensibility:** Can include custom claims relevant to the DISM framework.

- **Usage in DISM:**
  - Represent promises as CWTs to encapsulate the necessary claims within a secure token.
  - Facilitate the verification of promises by agents without exposing the underlying data unnecessarily.

### Definition of Terms

#### State Machine

A **state machine** is a model of computation that describes a system's behavior as a sequence of states. In a state machine, the system transitions from one state to another based on inputs and internal conditions. 

#### Finite State Machine (FSM)

A **finite state machine** has a fixed number of states and transitions, making it suitable for modeling systems with a limited number of possible states.  

A real-world example of a finite state machine is a traffic light, which has a fixed number of states (red, yellow, green) and transitions between them based on a timer and sensor inputs.

Finite state machines typically repeat a fixed set of states in one or more loops.  Their behavior can be modeled as a cyclic directed graph, where states are nodes and transitions are edges.

#### Infinite State Machine (ISM)

An **infinite state machine (ISM)** is a system in which the number of potential states is unbounded. 

A real-world example of an infinite state machine is a git repository, which can have an unbounded number of commits over time, each representing a unique state of the repository and its history.

Another real-world example of a infinite state machine is a general purpose computing system -- as the system operates, it advances from each disk state to the next based on the programs it executes.   (In theory, the total number of possible states of a physical computer is finite, limited by local storage, but in practice, the machine's state space is effectively unbounded:  Assuming a 1 terabyte disk, a contemporary machine has `8 * 2^10^12` possible bit states -- innumerable in geologic time.)

In theory, it should be possible to commit a machine's entire disk state to a git repository with each state change, but in practice, git is not optimized for frequent commits of large objects.

Infinite state machines typically do not repeat previous states.  Their behavior can be modeled as an open-ended directed graph.

#### Decentralized State Machine (DSM)

A **decentralized state machine (DSM)** is a system of interconnected state machines that operate autonomously and interact with each other with no central controller.  Each machine manages only its own local state based on transitions triggered by inputs.  Inputs may be from local sources or from other state machines.  

The behavior of a decentralized state machine can be modeled as a hypergraph.  If the group includes an infinite state machine, then the graph is open-ended.

#### Decentralized Finite State Machine (DFSM) 

A real-world example of a decentralized finite state machine is the "flag transfer method" of directing traffic at a road construction site.  Each flagger has a fixed set of signals and rules for when to signal them, and they communicate via a token or flag transported by the driver of the last car in a group.  [^flagxfer]

#### Decentralized Infinite State Machine (DISM)

A decentralized ISM is a system of interconnected infinite state machines that operate autonomously and interact with each other with no central controller.  Each machine manages only its own local state based on transitions triggered by inputs.  Inputs may be from local sources or from other state machines.

A real-world example of a decentralized infinite state machine is a group of git repository forks, where each repository is an infinite state machine that can interact with other repositories via pull and push operations.

XXX Each agent acts independently, promoting scalability and fault tolerance. Each agent is responsible for deciding its own next state based on both internal conditions and the promises made by other agents. These agents are autonomous, following the core principle of Promise Theory, where each agent manages its own behavior and is not dictated by any central authority. Agents only promise things that are under their own control -- agents cannot make promises on behalf of others. These promises can be observed by others to inform their own state transitions.

#### Transition Function

A **transition function** is a mapping from the current state of the system to the next state.  In a finite state machine, the transition function might be a static table of state transitions; the table key is (current state, input event), which returns a value of (next state).  In an infinite state machine, the transition function is a dynamic table; given (current state, input), the transition function returns (next state, next state table).  

In our previous example of a general purpose computing system, the transition table is the entire disk state, and the transition function is the process of reading and writing from disk.

#### Agent

An **agent** is an autonomous entity.  An agent might be a person or animal, a computer program, a machine, or other physical object.  At extremely small scale, an agent might be an electron or other subatomic particle.  The defining characteristic of an agent is its ability to influence, and be influenced by, its environment.

#### Pure Functions and Side Effects

A **pure function** is a function that has no side effects and always returns the same output for the same input.  

While pure functions aid in reasoning about a standalone system, it is useful to recognize that decentralized systems cannot exist without side effects; even if all agents in a decentralized system are themselves pure functions, the communications between them constitute side effects that alter the system's total state.

#### Promise Theory

**Promise Theory (PT)**, introduced by Mark Burgess, formalizes a model for understanding how autonomous agents interact in a decentralized environment. In PT, agents make *promises* about their behavior to others.  The model emphasizes that agents can only make promises about their own behavior; agents cannot impose obligations on, nor make promises about, the behavior of other agents.

Promise Theory is a framework for modeling the behavior of autonomous agents in decentralized systems. It asserts that cooperation and coordination emerge from the voluntary commitments (promises) that agents make to one another. In Promise Theory:

- **Agents are Autonomous**: Each agent controls its own behavior and cannot be compelled by others.

- **Local Decision-Making**: Agents make decisions based on local information and the promises they have received from others.

- **Trust and Verification**: Other agents may choose to rely on promises, and over time, trust is built based on the fulfillment of these promises.

Promises are not guarantees; they are assertions an agent makes about its own behavior or state on a timeline.  From the frame of reference of another agent, these assertions may resolve as true, false, or undecided:  A promise may be viewed as fulfilled, broken, or still pending.  Over time, agents build trust by observing the behavior of other agents and their promises.  

Frame of reference matters:  Whether a promise is fulfilled or broken depends on the observer. For example, Bob may view Alice's promise as fulfilled, while Carol views the same promise as broken.  Carol may then tell others that Alice's promise is broken, but it's important to note that, when making this claim, Carol is only making a promise about her own evaluation of Alice.

Relativity matters:  It's worth considering that Carol and Bob may each be using the exact same criteria to evaluate Alice's promise, but they may have different frames of reference.  For example, Bob may be evaluating Alice's promise while he is at rest on Earth's surface, while Carol, in a 20,000km Earth orbit, gains about 38 microseconds per day on her local clock.  If Alice's promise includes microsecond-level precision, then Bob and Carol may be both correct and both in disagreement with each other.  [^gps]

Dave, observing all of the above, may conclude that when he's evaluating Alice's, Bob's and Carol's promises, he may want to add his own compensation for relativistic effects.

#### Semantic Spacetime

**Semantic Spacetime (SST)**, also developed by Mark Burgess, is a natural extension of Promise Theory into physics and cosmology, integrating the dimensions of space and time into how we understand and model interactions within systems. In the SST model, agents exist and interact within a *spacetime* fabric, where the arrangement of agents (space) and the sequence of their interactions (time) are essential to understanding system behavior. 

Semantic Spacetime extends the concepts of space and time into the semantics of system interactions. In this framework:

- **Agents**: Represent autonomous entities that interact with their environment and other agents. An agent may be as complex as a biological organism or as simple as a subatomic particle.

- **Space**: Refers to the arrangement and relationships between agents. The spatial configuration affects how agents interact and disseminate information.

- **Time**: Represents the sequence and timing of interactions. Temporal aspects influence the causality and synchronization of events. The arrow of time, often associated with increasing entropy according to the second law of thermodynamics, implies that systems naturally evolve from states of lower entropy to higher entropy. In Semantic Spacetime, this entropy arrow reflects the progression of system states and the irreversibility of certain processes.

- **Local Interactions**: Emphasizes that system behavior emerges from local interactions rather than global control.

- **Emergent Behavior**: Complex system behaviors arise from the simple interactions of agents over spacetime.

SST and PT are not limited to animate agents; they can be applied to any system where agents interact.  In this model, an agent might even be an electron or other subatomic particle, which promises to follow a set of rules in its interactions with other particles.  Here, too, PT is consistent; we can't make promises on behalf of another, in this case a subatomic particle, and so we are often surprised when the promises we make on their behalf turn out to be wrong.  The efforts of CERN, LLNL, and other national and international labs can be seen as a continuing conversation to discover the true nature of those promises. 

SST is also not limited to linear time; it can represent branching or parallel timelines.  

Promise Theory and SST lead to an interesting observation about real-world organizations, communities, and systems of governance: At their lowest level, all systems rely on promises, and many of those promises are implicit rather than explicit.  For instance, legal and monetary systems rely on the implied promises of the "social contract" between a government and its people.  The standards and practices of a profession rely on the promises of its members to uphold a certain set of values and ethics.  The health of any community or organization relies on promises, both explicit and implicit, that each member makes when joining and participating.  

## Acknowledgments
Angela Traugott, Donaldo Almazon, JJ Salley, XXX
XXX mention LLM models and how used?

## References

[^stevegt]: [http://github.com/stevegt](https://github.com/stevegt)
[^rebecca]: [https://github.com/RebeccaSnyder505](https://github.com/RebeccaSnyder505)
[^turing]: Alan Turing, "On Computable Numbers, with an Application to the Entscheidungsproblem," *Proceedings of the London Mathematical Society*, 1936.
[^pt]: Mark Burgess, *Promise Theory: Principles and Applications*
[^sst]: Mark Burgess, *Semantic Spacetime: A Practical Foundation*
[^pvp]: Steve Traugott, *Push vs Pull*
[^order]: Steve Traugott, *Why Order Matters*
[^antikernel]: Andrew Zonenberg, *Antikernel*
[^flagxfer]: Manual on Uniform Traffic Control Devices for Streets and Highways, US Dept of Transportation [https://mutcd.fhwa.dot.gov/htm/2009/part6/part6c.htm#section6C12](https://mutcd.fhwa.dot.gov/htm/2009/part6/part6c.htm#section6C12)
[^gps]:  Inside the Box: GPS and Relativity [https://www.gpsworld.com/inside-the-box-gps-and-relativity/](https://www.gpsworld.com/inside-the-box-gps-and-relativity/)
