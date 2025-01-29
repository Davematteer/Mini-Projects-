import matplotlib.pyplot as plt
import numpy as np

# Define materials data
materials = [
    {"name": "Polyethylene terephthalate (PET)", "class": "Polymer", "rho_s": 1.38, "rho_l": 1.33, "T": 523},
    {"name": "Polypropylene", "class": "Polymer", "rho_s": 0.855, "rho_l": 0.850, "T": 433.2},
    # Add remaining materials here...
]

# Compute density change
for material in materials:
    rho_s, rho_l = material["rho_s"], material["rho_l"]
    delta_rho = abs((rho_l - rho_s) / rho_s)
    material["delta_rho"] = delta_rho

# Plot results
material_classes = set(m["class"] for m in materials)
for mat_class in material_classes:
    subset = [m for m in materials if m["class"] == mat_class]
    T_values = [m["T"] for m in subset]
    delta_rho_values = [m["delta_rho"] for m in subset]
    
    plt.figure()
    plt.scatter(T_values, delta_rho_values)
    plt.xlabel("Melting/Decomposition Temperature (K)")
    plt.ylabel("Density Change")
    plt.title(f"Density Change vs Temperature for {mat_class}")
    plt.show()