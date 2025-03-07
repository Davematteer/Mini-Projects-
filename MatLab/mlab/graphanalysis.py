import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Load data and preprocess
data = pd.read_excel("lab4 data.xlsx", sheet_name="Sheet1", skiprows=3)
data.columns = [f"Col_{i}" for i in range(data.shape[1])]

# Constants
d = 0.00329  # diameter in meters
A = 8.5e-6    # area in m²
L0 = 0.03752  # initial length in meters

def calculate_stress_strain(force_col_idx, position_col_idx):
    stress = data.iloc[:, force_col_idx] / A
    strain = data.iloc[:, position_col_idx] / L0
    return stress, strain

def find_key_stresses(stress, strain):
    # Ultimate Tensile Stress (UTS)
    uts = np.max(stress)
    uts_idx = np.argmax(stress)
    
    # Fracture Stress (last non-zero stress before failure)
    fracture_stress = stress.iloc[-1] if stress.iloc[-1] > 0 else stress.iloc[-2]
    
    # Yield Stress (0.2% offset method)
    elastic_region = strain < 0.002  # Assuming linear elasticity up to 0.2% strain
    if elastic_region.any():
        slope = np.polyfit(strain[elastic_region], stress[elastic_region], 1)[0]
        yield_stress = slope * (0.002)  # σ_yield ≈ E * 0.002
    else:
        yield_stress = None  # Data insufficient
    
    return {
        'UTS (MPa)': uts / 1e6,
        'Yield Stress (MPa)': yield_stress / 1e6 if yield_stress else 'N/A',
        'Fracture Stress (MPa)': fracture_stress / 1e6
    }

# Adjusted column indices (from previous fix)
materials = [
    {'name': 'Aluminium', 'force_idx': 0, 'pos_idx': 1},
    {'name': 'Brass', 'force_idx': 3, 'pos_idx': 4},
    {'name': 'Polymer', 'force_idx': 6, 'pos_idx': 7},
    {'name': 'Steel', 'force_idx': 9, 'pos_idx': 10}
]

# Plotting and calculations
fig, axs = plt.subplots(2, 2, figsize=(12, 8))
plt.suptitle('Stress-Strain Curves with Key Stresses', y=1.02, fontsize=14)

results = {}
for idx, mat in enumerate(materials):
    stress, strain = calculate_stress_strain(mat['force_idx'], mat['pos_idx'])
    ax = axs[idx // 2, idx % 2]
    ax.plot(strain, stress, 'b-', linewidth=1.5)
    
    # Calculate key stresses
    key_stresses = find_key_stresses(stress, strain)
    results[mat['name']] = key_stresses
    
    # Mark UTS and Fracture
    ax.plot(strain[np.argmax(stress)], key_stresses['UTS (MPa)'] * 1e6, 'ro', label='UTS')
    ax.plot(strain.iloc[-1], key_stresses['Fracture Stress (MPa)'] * 1e6, 'kx', label='Fracture')
    
    ax.set_title(mat['name'])
    ax.set_xlabel('Strain')
    ax.set_ylabel('Stress (Pa)')
    ax.grid(True)
    ax.legend()

plt.tight_layout()
plt.show()

# Print results
print("\nKey Stress Values:")
for material, values in results.items():
    print(f"\n**{material}**")
    for k, v in values.items():
        print(f"{k}: {v}")