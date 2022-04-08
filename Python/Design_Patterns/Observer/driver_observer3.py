from observer3 import *

# Create a publisher object
pub = Publisher(['lunch', 'dinner'])

# Create subscriber objects
bob = Subscriber('Bob')
alice = Subscriber('Alice')
john = Subscriber('John')

# Then the subscribers register with the publisher
pub.register('lunch', bob)
pub.register('dinner', alice)
pub.register('lunch', john)
pub.register('dinner', john)

# Then we dispatch a message
pub.dispatch('lunch', "It's lunchtime")
pub.dispatch('dinner', "Time for dinner")
pub.unregister('dinner', john)
pub.dispatch('dinner', "Please pick up your food at window 13")