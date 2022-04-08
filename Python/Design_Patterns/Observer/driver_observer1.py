from observer1 import Publisher, Subscriber

# Create a publisher object
pub = Publisher()

# Create subscriber objects
bob = Subscriber('Bob')
alice = Subscriber('Alice')
john = Subscriber('John')

# Then the subscribers register with the publisher
pub.register(bob)
pub.register(alice)
pub.register(john)

# Then we dispatch a message
pub.dispatch("It's lunchtime")
pub.unregister(john)
pub.dispatch("Time for dinner")