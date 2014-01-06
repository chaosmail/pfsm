# PFSM

Probabilistic Finite State Machine in Python

Usage:

```python
import pfsm


class IdleState(pfsm.State):

    def __init__(self):
        super(IdleState, self).__init__()

        self.add_state(WorkState())


class WorkState(pfsm.State):

    def __init__(self):
        super(WorkState, self).__init__()

        self.add_state(HomeState())

    def do_pre_state(self):
        print("Entering Work State")

    def do_in_state(self):
        print("Inside Work State")

    def do_post_state(self):
        print("Leaving Work State")

    def get_enter_probability(self):
        return 0.8


class HomeState(pfsm.State):

    def __init__(self):
        super(HomeState, self).__init__()

        self.add_state(EndState())

    def do_pre_state(self):
        print("Entering Home State")

    def do_in_state(self):
        print("Inside Home State")

    def do_post_state(self):
        print("Leaving Home State")

    def get_enter_probability(self):
        return 0.2


class EndState(pfsm.State):

    def __init__(self):
        super(EndState, self).__init__()

"""
    Demo of PFSM

    Start in Idle State
    Then change the state
    probabilistically to work and home

    Program finished in end state
"""

step = 0
state = IdleState()

# Idle State
state.do_in_state()

while True:

    state = state.next()
    state.do_in_state()

    step += 1

    if isinstance(state, EndState):
        break

print("End in", step, "Steps")
```

