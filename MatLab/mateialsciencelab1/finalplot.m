% Group materials into specified categories (Metals, Polymers, and Composites)
categories = struct();
categories.Metals = {'Stainless steel', 'Copper', 'Brass', 'Zinc', 'Iron', 'Aluminium', 'Platinum'};
categories.Polymers = {'Polyethylene terephthalate (PET)', 'Polypropylene', 'Polyurethane', 'Polyvinyl chloride (PVC)', 'Teflon (PTFE)'};
categories.Composites = {'Glass fiber-reinforced epoxy'};

% Combine all categories into one cell array
all_categories = fieldnames(categories);

% Initialize storage for categorized data
categorized_data = struct();

% Process the data for each category
for c = 1:length(all_categories)
    category = all_categories{c};
    materials_in_category = categories.(category);
    
    % Initialize temporary data storage for the category
    categorized_data.(category).T = [];
    categorized_data.(category).DeltaRhoK = [];
    categorized_data.(category).Names = {};
    
    % Extract relevant data for each material in this category
    for i = 1:size(materials, 1)
        name = materials{i,1};
        if any(strcmp(name, materials_in_category))
            class = materials{i,2};
            sanitized_class = strrep(class, '-', '_');
            rho_s = materials{i,3};
            rho_l = materials{i,4};
            T = materials{i,5};
            
            % Compute density change if both values exist
            if ~isnan(rho_s) && ~isnan(rho_l)
                delta_rho = rho_s - rho_l;
                delta_rho_k = abs((rho_l * delta_rho) / rho_s);
                categorized_data.(category).T = [categorized_data.(category).T, T];
                categorized_data.(category).DeltaRhoK = [categorized_data.(category).DeltaRhoK, delta_rho_k];
                categorized_data.(category).Names = [categorized_data.(category).Names; {name}];
            end
        end
    end
end

% Plot results for all categories
figure;
numCategories = length(all_categories);
for i = 1:numCategories
    category = all_categories{i};
    subplot(ceil(sqrt(numCategories)), ceil(sqrt(numCategories)), i);
    if ~isempty(categorized_data.(category).T)
        T_sorted = sort(categorized_data.(category).T);
        DeltaRhoK_sorted = categorized_data.(category).DeltaRhoK;
        [~, sortIdx] = sort(categorized_data.(category).T);
        DeltaRhoK_sorted = DeltaRhoK_sorted(sortIdx);
        
        scatter(categorized_data.(category).T, categorized_data.(category).DeltaRhoK, 50, 'filled');
        hold on;
        % Fit a first-order polynomial (linear fit)
        p = polyfit(T_sorted, DeltaRhoK_sorted, 1); % Linear fit (1st degree)
        T_fit = linspace(min(T_sorted), max(T_sorted), 100);
        DeltaRhoK_fit = polyval(p, T_fit);
        plot(T_fit, DeltaRhoK_fit, '-r', 'LineWidth', 1.5);
        
        % Add labels to points
        for j = 1:length(categorized_data.(category).T)
            text(categorized_data.(category).T(j), categorized_data.(category).DeltaRhoK(j), categorized_data.(category).Names{j}, 'FontSize', 8, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
        end
    end
    title(category);
    xlabel('Melting/Decomposition Temperature (K)');
    ylabel('|Δρ_k| (kg/m³)');
    grid on;
end
sgtitle('Density Change vs Temperature for Metals, Polymers, and Composites');
