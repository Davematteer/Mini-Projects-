% Load material data
materials = {
    'Polyethylene terephthalate (PET)', 'Polymer', 1.38, 1.33, 523;
    'Polypropylene', 'Polymer', 0.855, 0.850, 433.2;
    'Stainless steel', 'Metal_Alloy', 7.9, 7.9, 1720;
    'Copper', 'Metal', 8.96, 8.40, 1358;
    'Polyurethane', 'Polymer', 1.2, 1.1, 573;
    'Brass', 'Metal_Alloy', 8.5, 8.4, 1191.5;
    'Zinc', 'Metal', 7.14, 6.57, 693;
    'Aluminium', 'Metal', 2.70, 2.37, 933;
    'Sapphire', 'Ceramic', 3.98, 3.95, 2303;
    'Magnesia (MgO)', 'Ceramic', 3.58, 3.50, 3103;
    'Silica (SiO2)', 'Ceramic', 2.2, 2.1, 1983;
    'Iron', 'Metal', 7.87, 7.0, 1811;
    'Silicon', 'Semiconductor', 2.33, 2.32, 1687;
    'Graphite', 'Carbon_based', 2.25, 2.1, 3800;
    'Platinum', 'Metal', 21.45, 20.8, 2041;
    'Glass fiber-reinforced epoxy', 'Composite', 1.9, 1.8, 500;
    'Polyvinyl chloride (PVC)', 'Polymer', 1.35, 1.35, 503;
    'Teflon (PTFE)', 'Polymer', 2.15, 2.15, 600.2;
    'Wax', 'Organic_Compound', 0.85, 0.90, 353;
    'Carbon nanotubes', 'Carbon_based', 1.4, 1.35, 4000;
    'Charcoal', 'Carbon_based', 1.6, 1.7, 750;
    'Borosilicate glass', 'Glass', 2.2, 2.2, 1550;
    'Soda-lime glass', 'Glass', 2.45, 2.4, 1800;
    'Graphene', 'Carbon_based', 2.3, 2.3, 4000;
    'Boron nitride nanotube (BNNT)', 'Ceramic', 2.2, 2.2, 3273;
    'Wood fiber', 'Natural_Fiber', 1.55, NaN, 548;
    'Porous carbon', 'Carbon_based', 0.9, 1.0, 4000;
};

% Initialize storage
classes = unique(materials(:,2));
data = struct();

% Sanitize class names
for i = 1:length(classes)
    class = classes{i};
    sanitized_class = strrep(class, '-', '_');
    data.(sanitized_class).T = [];
    data.(sanitized_class).DeltaRhoK = [];
    data.(sanitized_class).Names = {};
end

for i = 1:size(materials, 1)
    class = materials{i,2};
    sanitized_class = strrep(class, '-', '_');
    rho_s = materials{i,3};
    rho_l = materials{i,4};
    T = materials{i,5};
    name = materials{i,1};
    
    % Compute density change if both values exist
    if ~isnan(rho_s) && ~isnan(rho_l)
        delta_rho = rho_s - rho_l;
        delta_rho_k = abs((rho_l * delta_rho) / rho_s);
        data.(sanitized_class).T = [data.(sanitized_class).T, T];
        data.(sanitized_class).DeltaRhoK = [data.(sanitized_class).DeltaRhoK, delta_rho_k];
        data.(sanitized_class).Names = [data.(sanitized_class).Names; {name}];
    end
end

% Plot results with individual subplots
numClasses = length(classes);
figure;
for i = 1:numClasses
    sanitized_class = strrep(classes{i}, '-', '_');
    subplot(ceil(sqrt(numClasses)), ceil(sqrt(numClasses)), i);
    if ~isempty(data.(sanitized_class).T)
        T_sorted = sort(data.(sanitized_class).T);
        DeltaRhoK_sorted = data.(sanitized_class).DeltaRhoK;
        [~, sortIdx] = sort(data.(sanitized_class).T);
        DeltaRhoK_sorted = DeltaRhoK_sorted(sortIdx);
        
        scatter(data.(sanitized_class).T, data.(sanitized_class).DeltaRhoK, 50, 'filled');
        hold on;
        p = polyfit(T_sorted, DeltaRhoK_sorted, 2); % Fit a second-order polynomial regression
        T_fit = linspace(min(T_sorted), max(T_sorted), 100);
        DeltaRhoK_fit = polyval(p, T_fit);
        plot(T_fit, DeltaRhoK_fit, '-r', 'LineWidth', 1.5);
        
        % Add labels to points
        for j = 1:length(data.(sanitized_class).T)
            text(data.(sanitized_class).T(j), data.(sanitized_class).DeltaRhoK(j), data.(sanitized_class).Names{j}, 'FontSize', 8, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
        end
    end
    title(classes{i});
    xlabel('Melting/Decomposition Temperature (K)');
    ylabel('|Δρ_k| (kg/m³)');
    grid on;
end
sgtitle('Density Change vs Temperature for Different Material Classes');
