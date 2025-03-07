import pandas as pd
import matplotlib.pyplot as plt

# Load data and skip metadata rows
data = pd.read_excel("lab4 data.xlsx", sheet_name="Sheet1", skiprows=3)
data.columns = [f"Col_{i}" for i in range(data.shape[1])]

# Constants
d = 0.00329  # diameter in meters
A = 8.5e-6    # area in m²
L0 = 0.03752  # initial length in meters

# Function to calculate stress and strain
def calculate_stress_strain(force_col_idx, position_col_idx):
    stress = data.iloc[:, force_col_idx] / A
    strain = data.iloc[:, position_col_idx] / L0
    return stress, strain

# Create subplots
fig, axs = plt.subplots(2, 2, figsize=(12, 8))
plt.suptitle('Stress-Strain Curves', y=1.02, fontsize=14)

# Adjusted column indices (critical fix for Brass!)
materials = [
    {'name': 'Aluminium', 'force_idx': 0, 'pos_idx': 1, 'ax': axs[0, 0]},  # Columns 0 and 1
    {'name': 'Brass', 'force_idx': 3, 'pos_idx': 4, 'ax': axs[0, 1]},      # Columns 3 and 4 (previously 2,3)
    {'name': 'Polymer', 'force_idx': 6, 'pos_idx': 7, 'ax': axs[1, 0]},    # Columns 6 and 7
    {'name': 'Steel', 'force_idx': 9, 'pos_idx': 10, 'ax': axs[1, 1]}      # Columns 9 and 10
]

for mat in materials:
    stress, strain = calculate_stress_strain(mat['force_idx'], mat['pos_idx'])
    mat['ax'].plot(strain, stress, 'r-', linewidth=1.5)
    mat['ax'].set_title(mat['name'])
    mat['ax'].set_xlabel('Strain')
    mat['ax'].set_ylabel('Stress (Pa)')
    mat['ax'].grid(True)
    mat['ax'].set_xlim(0, strain.max() * 1.1)  # Auto-scale x-axis
    mat['ax'].set_ylim(0, stress.max() * 1.1)  # Auto-scale y-axis

plt.tight_layout()
plt.show()