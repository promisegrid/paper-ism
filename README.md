# A Decentralized Infinite State Machine and Promise-Based State Transition System Compatible with Semantic Spacetime and Promise Theory

## Abstract

This paper introduces the concept of a decentralized infinite state machine (ISM) in which each agent manages its local state and interacts with other agents by making promises about future state transitions. We postulate that this ISM framework is compatible with both Semantic Spacetime (SST) and Promise Theory (PT), providing a natural model for decentralized systems where the interaction between autonomous agents defines system behavior. Additionally, we propose a generic language for describing state transitions in ISM that aligns with SST and PT principles. This language relies on the concept of promises, where the ISM kernel (the agent) signs tuples that describe transitions between functions without those functions making promises themselves. We suspect that this model maintains a separation of concerns between the kernel and hosted functions that is consistent with Promise Theory.

## Definition of Terms

### State Machine

A **state machine** is a model of computation that describes a system's behavior as a sequence of states. In a state machine, the system transitions from one state to another based on inputs and internal conditions. 

### Finite State Machine (FSM)

A **finite state machine** has a fixed number of states and transitions, making it suitable for modeling systems with a limited number of possible states.  

A real-world example of a finite state machine is a traffic light, which has a fixed number of states (red, yellow, green) and transitions between them based on a timer and sensor inputs.

Finite state machines typically repeat a fixed set of states in one or more loops.  Their behavior can be modeled as a cyclic directed graph, where states are nodes and transitions are edges.


### Infinite State Machine (ISM)

An **infinite state machine (ISM)** is a system in which the number of potential states is unbounded. 

A real-world example of an infinite state machine is a git repository, which can have an unbounded number of commits over time, each representing a unique state of the repository and its history.

Another real-world example of a infinite state machine is a general purpose computing system -- as the system operates, it advances from each disk state to the next based on the programs it executes.   (In theory, the total number of possible states of a physical computer is finite, limited by local storage, but in practice, the machine's state space is effectively unbounded:  Assuming a 1 terabyte disk, a contemporary machine has `8 * 2^10^12` possible bit states -- innumerable in geologic time.)

In theory, it should be possible to commit a machine's entire disk state to a git repository with each state change, but in practice, git is not optimized for frequent commits of large objects.

Infinite state machines typically do not repeat previous states.  Their behavior can be modeled as an open-ended directed graph.

### Decentralized State Machine (DSM)

A **decentralized state machine (DSM)** is a system of interconnected state machines that operate autonomously and interact with each other with no central controller.  Each machine manages only its own local state based on transitions triggered by inputs.  Inputs may be from local sources or from other state machines.  

A real-world example of a decentralized finite state machine is the "flag transfer method" of directing traffic at a road construction site.  Each flagger has a fixed set of signals and rules for when to signal them, and they communicate via a token or flag transported by the driver of the last car in a group.  https://mutcd.fhwa.dot.gov/htm/2009/part6/part6c.htm#section6C12

A real-world example of a decentralized infinite state machine is a group of git repository forks, where each repository is an infinite state machine that can interact with other repositories via pull and push operations.

The behavior of a decentralized state machine can be modeled as a hypergraph.  If the group includes an infinite state machine, then the graph is open-ended.

### Transition Function

A **transition function** is a mapping from the current state of the system to the next state.  In a finite state machine, the transition function might be a static table of state transitions; the table key is (current state, input event), which returns a value of (next state).  In an infinite state machine, the transition function is a dynamic table; given (current state, input), the transition function returns (next state, next state table).  

In our previous example of a general purpose computing system, the transition table is the entire disk state, and the transition function is the process of reading and writing from disk.

### Agent

An **agent** is an autonomous entity.  An agent might be a person or animal, a computer program, a machine, or other physical object.  At extremely small scale, an agent might be an electron or other subatomic particle.  The defining characteristic of an agent is its ability to influence, and be influenced by, its envrionment.

### Pure Functions and Side Effects

A **pure function** is a function that has no side effects and always returns the same output for the same input.  

While pure functions aid in reasoning about a standalone system, it is useful to recognize that decentralized systems cannot exist without side effects; even if all agents in a decentralized system are themselves pure functions, the communications between them constitute side effects that alter the system's total state.

### Promise Theory

**Promise Theory (PT)**, introduced by Mark Burgess, formalizes a model for understanding how autonomous agents interact in a decentralized environment. In PT, agents make *promises* about their behavior to others.  The model emphasizes that agents can only make promises about their own behavior; agents cannot impose obligations on, nor make promises about, the behavior of other agents.

Promises are not guarantees; they are assertions an agent makes about its own behavior or state on a timeline.  From the frame of reference of another agent, these assertions may resolve as true, false, or undecided:  A promise may be viewed as fulfilled, broken, or still pending.  Over time, agents build trust by observing the behavior of other agents and their promises.  

Frame of reference matters:  Whether an promise is fulfilled or broken depends on the observer. For example, Bob may view Alice's promise as fulfilled, while Carol views the same promise as broken.  Carol may then tell others that Alice's promise is broken, but it's important to note that, when making this claim, Carol is only making a promise about her own evaluation of Alice.

Relativity matters:  It's worth considering that Carol and Bob may each be using the exact same criteria to evaluate Alice's promise, but they may have different frames of reference.  For example, Bob may be evaluating Alice's promise while he is at rest on Earth's surface, while Carol, in a 20,000km Earth orbit, gains about 38 microseconds per day on her local clock.  If Alice's promise includes microsecond-level precision, then Bob and Carol may be both correct and both in disagreement with each other. https://www.gpsworld.com/inside-the-box-gps-and-relativity/

Dave, observing all of the above, may conclude that when he's evaluating Alice's, Bob's and Carol's promises, he may want to add his own compensation for relativistic effects.

### Semantic Spacetime

**Semantic Spacetime (SST)**, also developed by Mark Burgess, is a natural extension of Promise Theory into physics and cosmology, integrating the dimensions of space and time into how we understand and model interactions within systems. In the SST model, agents exist and interact within a *spacetime* fabric, where the arrangement of agents (space) and the sequence of their interactions (time) are essential to understanding system behavior. 

SST and PT are not limited to animate agents; they can be applied to any system where agents interact.  In this model, an agent might even be an electron or other subatomic particle, which promises to follow a set of rules in its interactions with other particles.  Here, too, PT is consistent; we can't make promises on behalf of another, in this case a subatomic particle, and so we are often surprised when the promises we make on their behalf turn out to be wrong.  The efforts of CERN, LLNL, and other national and international labs can be seen as a continuing conversation to discover the true nature of those promises. 

SST is also not limited to linear time; it can represent branching or parallel timelines.  

Promise Theory and SST lead to an interesting observation about real-world organizations, communities, and systems of governance: At their lowest level, all systems rely on promises, and many of those promises are implicit rather than explicit.  For instance, legal and monetary systems rely on the implied promises of the "social contract" between a government and its people.  The standards and practices of a profession rely on the promises of its members to uphold a certain set of values and ethics.  The health of any community or organization relies on promises, both explicit and implicit, that each member makes when joining and participating.  

## Semantic Spacetime and DISM Compatibility

It's possible that the concepts behind PT, SST, and DISMs are compatible, allowing us to develop a cohesive framework for decentralized computation. By integrating the principles of PT and SST into a DISM framework, we can model decentralized systems where agents operate autonomously, interact locally, and contribute to the emergent behavior of the system as a whole.

The health of any decentralized system relies on the promises that each agent makes to the others. It's important to consider that the developers of a system are themselves agents -- in the case of software-based systems, for instance, the developers who encode the governance algorithms issue promises regarding the behavior of the system.

This paper explores the relationship between ISM, PT, and SST and introduces a generic language for describing state transitions in a way that aligns with these theories.

For the purposes of this paper, it may be helpful to think of a promise as an assertion of fact as of a particular point on a timeline, with veracity equal to true, false, or undecided.

## Decentralized Infinite State Machine (ISM)

The *decentralized* aspect of ISM ensures that there is no central controller, and each agent acts independently, promoting scalability and fault tolerance. Each agent is responsible for deciding its own next state based on both internal conditions and the promises made by other agents. These agents are autonomous, following the core principle of Promise Theory, where each agent manages its own behavior and is not dictated by any central authority. Agents only promise things that are under their own control -- agents cannot make promises on behalf of others. These promises can be observed by others to inform their own state transitions.

## Promise Theory

Promise Theory is a framework for modeling the behavior of autonomous agents in decentralized systems. It asserts that cooperation and coordination emerge from the voluntary commitments (promises) that agents make to one another. In Promise Theory:

- **Agents are Autonomous**: Each agent controls its own behavior and cannot be compelled by others.

- **Local Decision-Making**: Agents make decisions based on local information and the promises they have received from others.

- **Trust and Verification**: Other agents may choose to rely on promises, and over time, trust is built based on the fulfillment of these promises.

By applying Promise Theory to ISM, we ensure that agents interact through voluntary commitments, leading to a more resilient and adaptable system. Agents make promises about their state transitions, which are used by others to make informed decisions.

## Semantic Spacetime

Semantic Spacetime extends the concepts of space and time into the semantics of system interactions. In this framework:

- **Agents**: Represent autonomous entities that interact with their environment and other agents. An agent may be as complex as a biological organism or as simple as a subatomic particle.

- **Space**: Refers to the arrangement and relationships between agents. The spatial configuration affects how agents interact and disseminate information.

- **Time**: Represents the sequence and timing of interactions. Temporal aspects influence the causality and synchronization of events. The arrow of time, often associated with increasing entropy according to the second law of thermodynamics, implies that systems naturally evolve from states of lower entropy to higher entropy. In Semantic Spacetime, this entropy arrow reflects the progression of system states and the irreversibility of certain processes.

- **Local Interactions**: Emphasizes that system behavior emerges from local interactions rather than global control.

- **Emergent Behavior**: Complex system behaviors arise from the simple interactions of agents over spacetime.

In the context of ISM, Semantic Spacetime provides a backdrop for understanding how agents' promises and state transitions unfold over time and across the network. By considering both spatial and temporal dimensions, we can better model and predict the behavior of the decentralized system.

## Semantic Spacetime and ISM Compatibility

Semantic Spacetime offers a conceptual framework for understanding decentralized systems as a set of agents operating autonomously in both space and time. Agents in SST interact with their environment and each other based on local information and promises. Time and space are fundamental aspects of how agents coordinate and change state.

In the context of ISM, SST can be seen as the backdrop against which agents make promises about state transitions. Each state transition occurs within the spacetime context, and the "next state" in the ISM corresponds to a new configuration of the agent's spacetime environment.

By making promises about the future (the next function to be executed and its expected outputs), agents in an ISM align with the SST principle that system behavior is the emergent result of local interactions in spacetime.

## A Generic Language for State Transitions

To enable ISM compatibility with Promise Theory and Semantic Spacetime, we propose a generic language for describing state transitions. This language uses a tuple format to capture promises about function execution. The proposed format is as follows:

```
(f1, in, inerr, out, outerr, rc, f2)
```

Where:  
- **f1**: The function currently being executed.  
- **in**: Input to the function.  
- **inerr**: Any input error, generated by an upstream agent, that the function needs to handle.  
- **out**: The expected output of the function.  
- **outerr**: Any output errors generated by the function.  
- **rc**: Return code indicating the result of the function (e.g., success or failure).  
- **f2**: The next function that will be executed in the state graph.

This tuple asserts (or promises) that "function f1, given input in and input error inerr, will always produce output out, output error outerr, a return code rc, and a new function f2 to execute next."

The tuple is signed by the ISM kernel, which is responsible for controlling function execution. The signature of the ISM kernel represents the *promise* of the kernel to guarantee the behavior specified by the tuple. This approach aligns with Promise Theory, where only the agent (in this case, the ISM kernel) can make promises.

## The Role of the ISM Kernel in State Transitions

The ISM kernel acts as the agent making promises about state transitions. It provides the runtime environment for functions (f1, f2, etc.) but retains control over their behavior.

This separation ensures that individual functions (f1, f2, etc.) cannot make promises about their own behavior or the behavior of the system. Allowing functions to make promises would violate Promise Theory, as only the kernel (the controlling agent) can guarantee outcomes related to state transitions.

Thus, the kernel provides the necessary control over function execution, ensuring that the system adheres to the promised behavior while maintaining compatibility with Promise Theory. Functions themselves remain passive entities that the kernel manages, preventing them from making claims about system behavior or state transitions.

## Discussion and Conclusion

We have postulated that a decentralized infinite state machine, where each agent manages its local state and interacts with other agents through promises about future state transitions, is compatible with Semantic Spacetime (SST) and Promise Theory (PT). This model aligns with the decentralized, autonomous nature of agents in SST and the promise-based interaction model of PT.

Our proposed generic tuple-based language for state transitions formalizes the promises made by the ISM kernel, ensuring that the system operates consistently with the principles of PT and SST. By having the ISM kernel control function execution and make promises about state transitions, we maintain a clear separation of concerns and adhere to the core tenets of Promise Theory.

This framework provides a possible foundation for designing decentralized systems that operate autonomously and scalably, with clear responsibilities for state transitions managed by an ISM kernel. Future work can focus on implementing this model in real-world decentralized systems, exploring the performance and resilience of ISM-based architectures, and further integrating the concepts of Promise Theory and Semantic Spacetime in system design.

## References

[^turing]: Alan Turing, "On Computable Numbers, with an Application to the Entscheidungsproblem," *Proceedings of the London Mathematical Society*, 1936.
[^pt]: Mark Burgess, *Promise Theory: Principles and Applications*
[^sst]: Mark Burgess, *Semantic Spacetime: A Practical Foundation*
[^pvp]: Steve Traugott, *Push vs Pull*
[^order]: Steve Traugott, *Why Order Matters*
[^antikernel]: Andrew Zonenberg, *Antikernel*
