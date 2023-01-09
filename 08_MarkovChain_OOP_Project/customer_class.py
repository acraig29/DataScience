
import pandas as pd
import numpy as np
#%matplotlib inline
 
##load in the transtion matrix for the states probabilties
tm = pd.read_csv('./data/transition_matrix.csv')


class Customer:
    def __init__(self, name, state, transition_matrix, num_states= 6):
        self.name = name
        self.state = state
        #self.budget = budget
        self.transition_matrix = transition_matrix
        self.num_states =  num_states
        self.states = list(transition_matrix.keys())
        """
        a single customer that moves through the supermarket
        in a MCMC simulation
        """
    def __repr__(self):
        return f'<Customer {self.name} in {self.state}>'
    def is_active(self):
        if self.state == 'checkout':
            return True
        return False
        """Returns True if the customer has not reached the checkout yet."""
        #random.choices() or np.random.choice()
    def next_state(self, current_state):
        '''
        Propagates the customer to the next state.
        Returns nothing.
        '''
        '''self.state = random.choice(['spices', 'drinks', 'fruit','checkout'])
        print(self.state )
        nl = np.random.choice( transition_matrix.values, t=transition_matrix.T[self.state] )'''
        return np.random.choice( self.states,p=[self.transition_matrix[current_state][next_state] for next_state in self.states] )
    def make_cust_data(self, current_state, num_states):
        '''for c in range(num_states):
            ns = random.choice(self.state)
            self.state.append(ns)
            print(ns)'''
        future_states= []
        for c in range(num_states):
            next_state = self.next_state(current_state)
            future_states.append(next_state)
            current_state = next_state
        return future_states