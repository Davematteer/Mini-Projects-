% Data: [ρs_min, ρs_max, ρl, Tm_min, Tm_max, Label, Class]
data = {
    1.38, 1.38, 1.33, 533, 553, "PET", "Polymer";
    0.90, 0.90, 0.85, 463, 468, "PP", "Polymer";
    7.75, 8.05, 7.00, 1700, 1723, "SS", "Metal";
    8.96, 8.96, 8.02, 1358, 1358, "Copper", "Metal";
    1.10, 1.25, 1.05, 473, 573, "PU", "Polymer";
    8.40, 8.73, 8.00, 1189, 1233, "Brass", "Metal";
    2.30, 2.50, NaN, NaN, NaN, "Concrete", "Composite";
    7.14, 7.14, 6.57, 693, 693, "Zinc", "Metal";
    2.70, 2.70, 2.38, 933, 933, "Aluminium", "Metal";
    3.98, 3.98, NaN, 2303, 2303, "Sapphire", "Ceramic";
    3.58, 3.58, NaN, 3073, 3073, "Magnesia", "Ceramic";
};

% Initialize results
results = [];
classes = unique(string(data(:, 7)));

% Process data and calculate |Δρk|
for i = 1:size(data, 1)
    rho_s = mean([data{i, 1}, data{i, 2}]);
    rho_l = data{i, 3};
    Tm = mean([data{i, 4}, data{i, 5}]);
    if ~isnan(rho_l) && ~isnan(Tm)
        delta_rho = rho_s - rho_l;
        delta_rho_k = abs((rho_l * delta_rho) / rho_s) * 1000; % Convert to kg/m³
        results = [results; Tm, delta_rho_k, i]; % Store index for labels
    end
end

% Plot for each class
figure;
hold on;
colors = lines(length(classes));

for j = 1:length(classes)
    % Filter data by class
    class_idx = strcmp(string(data(:, 7)), classes(j));
    class_data = results(ismember(results(:, 3), find(class_idx)), :);
    if ~isempty(class_data)
        scatter(class_data(:, 1), class_data(:, 2), 50, colors(j, :), 'filled', ...
            'DisplayName', classes(j));
        for k = 1:size(class_data, 1)
            text(class_data(k, 1), class_data(k, 2), string(data{class_data(k, 3), 6}), ...
                'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
        end
    end
end

% Add labels and legend
xlabel('Melting/Decomposition Temperature (K)');
ylabel('|Δρ_k| (kg/m³)');
title('Density Change vs. Temperature for Material Classes');
legend show;
grid on;
hold off;
