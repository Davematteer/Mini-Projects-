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
    
    # Fracture Stress (last non-zero stress)
    fracture_stress = stress.iloc[-1] if stress.iloc[-1] > 0 else stress.iloc[-2]
    
    # Yield Stress (0.2% offset method)
    elastic_region = strain < 0.002
    if elastic_region.any():
        slope = np.polyfit(strain[elastic_region], stress[elastic_region], 1)[0]
        yield_stress = slope * 0.002  # σ_yield ≈ E * 0.002
    else:
        yield_stress = None
    
    return {
        'UTS (MPa)': round(uts / 1e6, 2),
        'Yield Stress (MPa)': round(yield_stress / 1e6, 2) if yield_stress else 'N/A',
        'Fracture Stress (MPa)': round(fracture_stress / 1e6, 2)
    }

# Adjusted column indices
materials = [
    {'name': 'Aluminium', 'force_idx': 0, 'pos_idx': 1},
    {'name': 'Brass', 'force_idx': 3, 'pos_idx': 4},
    {'name': 'Polymer', 'force_idx': 6, 'pos_idx': 7},
    {'name': 'Steel', 'force_idx': 9, 'pos_idx': 10}
]

# Calculate results
results = {}
for mat in materials:
    stress, strain = calculate_stress_strain(mat['force_idx'], mat['pos_idx'])
    results[mat['name']] = find_key_stresses(stress, strain)

# Print results to terminal
print("\n" + "="*50)
print("           MATERIAL STRESS PROPERTIES")
print("="*50)
for material, values in results.items():
    print(f"\n{material.upper()}:")
    for prop, val in values.items():
        print(f"  - {prop}: {val}")
print("="*50)

# Plotting (optional)
fig, axs = plt.subplots(2, 2, figsize=(12, 8))
plt.suptitle('Stress-Strain Curves', y=1.02, fontsize=14)
for idx, mat in enumerate(materials):
    stress, strain = calculate_stress_strain(mat['force_idx'], mat['pos_idx'])
    ax = axs[idx // 2, idx % 2]
    ax.plot(strain, stress, 'b-', linewidth=1.5)
    ax.set_title(mat['name'])
    ax.set_xlabel('Strain')
    ax.set_ylabel('Stress (Pa)')
    ax.grid(True)
plt.tight_layout()
plt.show()