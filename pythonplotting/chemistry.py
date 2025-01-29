import matplotlib.pyplot as plt

# Data
atomic_numbers = [3, 11, 19, 37, 55]
melting_points = [180.5, 97.8, 63.4, 39.3, 28.4]
elements = ['Li', 'Na', 'K', 'Rb', 'Cs']

# Plot
plt.plot(atomic_numbers, melting_points, marker='o', linestyle='-', color='b')
plt.title('Melting Points of Group 1A Elements')
plt.xlabel('Atomic Number')
plt.ylabel('Melting Point (°C)')
plt.xticks(atomic_numbers, elements)
plt.grid()
plt.show()