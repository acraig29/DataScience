"""
Start with this to implement the supermarket simulator.
"""

import pandas as pd
import astar as at
from customer_class import Customer

transition_matrix = pd.read_csv('./data/transition_matrix.csv')
transition_matrix.set_index("location", inplace=True)


class Supermarket:
    """manages multiple Customer instances that are currently in the market.
    """
    def __init__(self, customers , minutes, last_id=5  ):        
        # a list of Customer objects
        self.customers = []
        self.minutes = 0
        self.last_id = 0  #id_suffix 

        self.possible_states = 5  # or list of locations?
        #self.market = market  # current supermarket time
        self.current_time = 0
        self.to_move = False

    def __repr__(self):
        
        #return f'Supermarket("{self.customers}", "{self.current_time}")'
        return f'<Supermarket has {len(self.customers)} customers in our supermarket>'

    def get_time(self):
        """current time in HH:MM format,
        """

         # now = datetime.now().time() #creates a time object
        hour = self.minutes // 60 + 7
        minutes = self.minutes % 60
        return f'{str(hour).zfill(2)}:{str(minutes).zfill(2)}'
        

    def print_customers(self):
        
        """print all customers with the current time and id in CSV format.
        """
        self.current_time = self.get_time()
        return f'Supermarket("{self.customers}", "{self.current_time}")'

    '''def next_minute(self):
        self.minutes += 1
        for cust in self.customers:
            cust.next_state()
            #cust.get_shortest_path(grid=at.grid)

        self.to_move = True'''


    def next_minute(self):
        for customer in self.customers:
            initial_state = customer.state
            customer.next_state()
            next_state = customer.state
            print(f"Customer {customer.name} has moved from {initial_state} section to {next_state} section")
            print("---------------------------")

    #def move_customers(self):
        #for cust in self.customers:
           # cust.next_state()
    
    def add_new_customers(self, customers, last_id=5):

        for i in range():
            cust = Customer(str(i) + "_" + str(last_id), "entrance", transition_matrix
                            )
            self.customers.append(cust)

        self.last_id += 1

    
    def reset(self):
        """removes every customer that is not active"""
       
        self.to_move = False
        for cust in self.customers:
            if cust.state == 'checkout':
                self.customers.remove(cust)
                print(f'{cust} removed')

new_day = Supermarket(['Helen Smith', 'Henrik Craig', 'Quentin Jones'], 4, 9)   
new_day.next_minute() 


