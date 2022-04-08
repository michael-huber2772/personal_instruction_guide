from observer2 import *

# Create a publisher object
pub = Publisher()

# Create subscriber objects
bob = SubscriberOne('Bob')
alice = SubscriberTwo('Alice')
john = SubscriberOne('John')

# Then the subscribers register with the publisher
pub.register(bob, bob.update)
pub.register(alice, alice.receive)
pub.register(john)

# Then we dispatch a message
pub.dispatch("It's lunchtime")
pub.unregister(john)
pub.dispatch("Time for dinner")