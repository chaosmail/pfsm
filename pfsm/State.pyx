"""
    PFSM
    Probabilistic Finite State Machine
"""
from random import uniform


class State(object):

    def __init__(self):
        self._states = []

    """
        Add possible states, that can be entered from the actual one
    """
    def add_state(self, state):
        if isinstance(state, State):
            self._states.append(state)
        else:
            raise ValueError("State must be from type {State}")

    """
        Get the next state
        return {State}
    """
    def _get_next_state(self):

        next_possible_states = []
        next_possible_states_probability = []

        for state in self._states:

            # Check if can enter this state
            if not state.pre_condition():
                continue

            # Add possible States
            next_possible_states.append(state)
            next_possible_states_probability.append(state.get_enter_probability())

        prob = uniform(0, 1)
        actual_prob = 0

        for i in range(len(next_possible_states)):

            # Check probability for entering state
            if prob >= actual_prob and prob < (actual_prob + next_possible_states_probability[i]):
                # Return the next State
                return next_possible_states[i]
            else:
                # Update the probability
                actual_prob += next_possible_states_probability[i]

        return None

    """
        Probability for entering the state
        returns number
    """
    def get_enter_probability(self):
        return 1

    """
        boolean condition, for entering the state
        returns bool
    """
    def pre_condition(self):
        return True

    """
        do something, before entering the new state
    """
    def do_pre_state(self):
        pass

    """
        do something, while in the actual state
    """
    def do_in_state(self):
        pass

    """
        Call next state
    """
    def next(self):

        # Check if can leave actual state
        if not self.post_condition():
            # no state change
            # return old state
            return self

        # get next state
        state = self._get_next_state()

        if state is not None:
            self.do_post_state()
            state.do_pre_state()
            return state

        # no state change
        # return old state
        return self

    """
        do something, before leaving the actual state
    """
    def do_post_state(self):
        pass

    """
        boolean condition, for leaving the state
        return {bool}
    """
    def post_condition(self):
        return True