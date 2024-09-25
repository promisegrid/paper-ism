# A Decentralized Infinite State Machine and Promise-Based State Transition System Compatible with Semantic Spacetime and Promise Theory

## Abstract

This paper introduces the concept of a decentralized infinite state machine (ISM) in which each agent manages its local state and interacts with other agents by making promises about future state transitions. We postulate that this ISM framework is compatible with both Semantic Spacetime (SST) and Promise Theory (PT), providing a natural model for distributed systems where the interaction between autonomous agents defines system behavior. Additionally, we propose a generic language for describing state transitions in ISM that aligns with SST and PT principles. This language relies on the concept of promises, where the ISM kernel (the agent) signs tuples that define guaranteed transitions between functions without those functions making promises themselves. We argue that this model maintains the separation of concerns between the kernel and the function execution, consistent with Promise Theory.

## Introduction

Distributed systems face challenges in managing state and coordinating behavior across multiple autonomous agents. 

An **infinite state machine (ISM)** describes a system where the number of potential states is unbounded.  The actions of the system can be expressed as a directed open graph of state transitions that are capable of modeling anything computable by machine. XXX reference turing, mention a real-world example.


A **decentralized infinite state machine (ISM)** is a system where each agent manages its local state and interacts with other agents by some communications protocol.
These communications form a directed hypergraph of state transitions, creating a decentralized model of computation.

**Promise Theory (PT)**, introduced by Mark Burgess, provides a formalism for understanding how autonomous agents interact in a distributed environment. In PT, agents make *promises* about their behavior to others, which are declarations of intent rather than enforced obligations. This framework emphasizes that agents can only control their own behavior, not that of others, promoting robustness and scalability in system design.

**Semantic Spacetime (SST)**, also developed by Burgess, extends this concept by integrating the dimensions of space and time into how we understand and model interactions within systems. SST posits that agents exist and interact within a *spacetime* fabric, where the arrangement of agents (space) and the sequence of interactions (time) are essential to understanding system behavior. SST emphasizes the importance of local interactions and the emergent properties that arise from the collective behavior of agents over time.

We hypothesize that the concepts behind ISM, PT, and SST are compatible, allowing us to develop a cohesive framework for decentralized computation. By integrating the principles of PT and SST into the ISM framework, we can model distributed systems where agents operate autonomously, interact locally, and contribute to the emergent behavior of the system as a whole.

This paper explores the relationship between ISM, PT, and SST and introduces a generic language for describing state transitions in a way that aligns with these theories.

## Decentralized Infinite State Machine (ISM)

The *decentralized* aspect of ISM ensures that there is no central controller, and each agent acts independently, promoting scalability and fault tolerance. Each agent is responsible for deciding its own next state based on both internal conditions and the promises made by other agents. These agents are autonomous, following the core principle of Promise Theory, where each agent manages its own behavior and is not dictated by any central authority. Agents only promise things that are under their own control -- agents cannot make promises on behalf of others.  These promises can be observed by others to inform their own state transitions.

## Promise Theory

Promise Theory is a framework for modeling the behavior of autonomous agents in distributed systems. It asserts that cooperation and coordination emerge from the voluntary commitments (promises) that agents make to one another. In Promise Theory:

- **Agents are Autonomous**: Each agent controls its own behavior and cannot be compelled by others.

- **Local Decision-Making**: Agents make decisions based on local information and the promises they have received from others.

- **Trust and Verification**: Other agents may choose to rely on promises, and over time, trust is built based on the fulfillment of these promises.

By applying Promise Theory to ISM, we ensure that agents interact through voluntary commitments, leading to a more resilient and adaptable system. Agents make promises about their state transitions, which are used by others to make informed decisions.

## Semantic Spacetime

Semantic Spacetime extends the concepts of space and time into the semantics of system interactions. In this framework:

- **Agents**: Represent autonomous entities that interact with their environment and other agents.  An agent may be as complex as a biological organism or as simple as a subatomic particle.

- **Space**: Refers to the arrangement and relationships between agents. The spatial configuration affects how agents interact and disseminate information.

- **Time**: Represents the sequence and timing of interactions. Temporal aspects influence the causality and synchronization of events.  XXX mention entropy arrow

- **Local Interactions**: Emphasizes that system behavior emerges from local interactions rather than global control.

- **Emergent Behavior**: Complex system behaviors arise from the simple interactions of agents over spacetime.

In the context of ISM, Semantic Spacetime provides a backdrop for understanding how agents' promises and state transitions unfold over time and across the network. By considering both spatial and temporal dimensions, we can better model and predict the behavior of the decentralized system.

## Semantic Spacetime and ISM Compatibility

Semantic Spacetime offers a conceptual framework for understanding distributed systems as a set of agents operating autonomously in both space and time. Agents in SST interact with their environment and each other based on local information and promises. Time and space are fundamental aspects of how agents coordinate and change state.

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
- **inerr**: Any input error that the function needs to handle.  
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

This framework provides a possible foundation for designing decentralized systems that operate autonomously and scalably, with clear responsibilities for state transitions managed by an ISM kernel. Future work can focus on implementing this model in real-world distributed systems, exploring the performance and resilience of ISM-based architectures, and further integrating the concepts of Promise Theory and Semantic Spacetime in system design.

## References

1. Mark Burgess, *Promise Theory: Principles and Applications*
2. Mark Burgess, *Semantic Spacetime: A Practical Foundation*
3. Steve Traugott, *Push vs Pull*
4. Steve Traugott, *Why Order Matters*
5. Andrew Zonenberg, *Antikernel*
