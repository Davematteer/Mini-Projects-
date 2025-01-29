import matplotlib.pyplot as plt

# Data
atomic_numbers = [22, 23, 24, 25, 26, 27, 28, 40, 41, 42, 43, 44, 45, 46, 72, 73, 74, 75, 76, 77, 78]
melting_points = [1668, 1910, 1907, 1246, 1538, 1495, 1455, 1855, 2477, 2623, 2200, 2334, 1964, 1555, 2233, 3017, 3422, 3186, 3033, 2446, 1768]
elements = ['Ti', 'V', 'Cr', 'Mn', 'Fe', 'Co', 'Ni', 'Zr', 'Nb', 'Mo', 'Tc', 'Ru', 'Rh', 'Pd', 'Hf', 'Ta', 'W', 'Re', 'Os', 'Ir', 'Pt']

# Plot
plt.plot(atomic_numbers, melting_points, marker='o', linestyle='-', color='r')
plt.title('Melting Points of Transition Metals')
plt.xlabel('Atomic Number')
plt.ylabel('Melting Point (°C)')
plt.xticks(atomic_numbers, elements, rotation=90)
plt.grid()
plt.show()