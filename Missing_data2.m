% Create a new figure window
figure;

% Plot the fourth figure
subplot(1, 2, 1, 'position', [0.2 0.35 0.25 0.38]);
% Parameter definitions
epsilon = 1;
delta = 0.1;
d = 4;
n = 1000; % Assume total sample size is 1000

% Define the range of values for p_1
p1_values = linspace(exp(epsilon) / (1 + exp(epsilon)), 1, 100);

% Calculate one-stage perturbation scheme
p = exp(epsilon) / (exp(epsilon) + d);
q = 1 / (exp(epsilon) + d);
var_one_stage = q * (1 - q) / (n * (p - q)^2) + (1 - p - q) / ((d + 1) * n * (p - q));

% Initialize to store average variance of two-stage scheme
var_two_stage = zeros(size(p1_values));

for i = 1:length(p1_values)
    p1 = p1_values(i);
    q1 = 1 - p1;
    p2 = exp(epsilon) / (exp(epsilon) + d - 1);
    q2 = 1 / (exp(epsilon) + d - 1);
    
    n0 = n * delta;
    ni = n * (1 - delta) / d;
    
    % Calculate variance of missing values
    var_n0 = (n * q1 * (1 - q1)) / ((p1 - q1)^2) + (n0 * (1 - p1 - q1)) / ((p1 - q1));
    
    % Calculate variance of non-missing values
    var_ni = (n * q2 * (1 - p1 * p2)) / (p1 * (p2 - q2)^2) + (ni * (1 - p1 * p2 - p1 * q2)) / ((p1 * p2 - p1 * q2)) + (n0 * (q1 / d * (1 - q1 / d) - p1 * q2 * (1 - p1 * q2))) / ((p1 * p2 - p1 * q2)^2);
    
    % Compute the average variance of the two-stage scheme
    var_two_stage(i) = (var_n0 + d * var_ni) / ((d + 1) * n * n);
end

% Set axis limits
xlim([0.7, 1]);
ylim([0, 0.0025]);

% Define marker shapes
marker_shapes = {'^', 'o', 's'};

% Plot the curves
plot(p1_values, var_one_stage * ones(size(p1_values)), 'LineWidth', 1, 'Marker', marker_shapes{1}, 'MarkerSize', 10, 'MarkerIndices', 1:10:numel(p1_values));
hold on;
plot(p1_values, var_two_stage, 'LineWidth', 1, 'Marker', marker_shapes{2}, 'MarkerSize', 10, 'MarkerIndices', 1:10:numel(p1_values));

% Draw vertical dashed line
alpha = exp(epsilon) / (1 + exp(epsilon));
x_line = alpha * ones(size(ylim));
line_color = [0.9290, 0.6940, 0.1250]; % Yellow
line(x_line, [0, var_one_stage], 'LineStyle', '--', 'Color', line_color);

% Set axis labels and title
xlabel('Missing Status Perturbation Probability p_1', 'FontName', 'Times New Roman', 'FontSize', 12);
ylabel('Mean Squared Error', 'FontName', 'Times New Roman', 'FontSize', 12);
legend('UP', 'TSP', 'FontName', 'Times New Roman', 'FontSize', 12, 'Location', 'SouthEast');

% Annotate formula on x-axis tick
formula_x = exp(epsilon) / (1 + exp(epsilon));
text(formula_x, -0.0001, '$$\frac{e^\epsilon}{1 + e^\epsilon}$$', 'Interpreter', 'latex', 'FontName', 'Times New Roman', 'Color', line_color, 'HorizontalAlignment', 'center', 'FontSize', 12);

% Set axis limits
xlim([0.7, 1]);
ylim([0, 0.0025]);
set(gca, 'FontSize', 12); % Set axis font size
% Add grid lines
grid on;
box on;

title('(a) p_1', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold', 'position', [0.85, -0.0008, 0]);
% Display the figure
hold off;

% Plot the fifth figure
subplot(1, 2, 2, 'position', [0.57 0.35 0.25 0.38]);
% Parameter settings
epsilon = 1;
p_1 = 0.85;
d = 4;
delta_range = linspace(0, 0.2, 100000);
n = 1000;

% One-stage perturbation scheme
p = exp(epsilon) / (exp(epsilon) + d);
q = 1 / (exp(epsilon) + d);
var_one_stage = zeros(size(delta_range));
for i = 1:length(delta_range)
    var = q * (1 - q) / (n * (p - q)^2) + ((1 - p - q)) / ((d + 1) * n * (p - q));
    var_one_stage(i) = var;
end

% Define marker shapes
marker_shapes = {'^', 'o', 's'};

% Two-stage perturbation scheme
q_1 = 1 - p_1;
p_2 = exp(epsilon) / (exp(epsilon) + d - 1);
q_2 = 1 / (exp(epsilon) + d - 1);
var_two_stage = zeros(size(delta_range));
for i = 1:length(delta_range)
    delta = delta_range(i);
    n0 = n * delta;
    ni = (n - n0) / d;
    var_n0 = (n * q_1 * (1 - q_1)) / (p_1 - q_1)^2 + (n0 * (1 - p_1 - q_1)) / ((p_1 - q_1));
    var_ni = (n * q_2 * (1 - p_1 * p_2)) / (p_1 * (p_2 - q_2)^2) + (ni * (1 - p_1 * p_2 - p_1 * q_2)) / ((p_1 * p_2 - p_1 * q_2)) + (n0 * (q_1 / d * (1 - q_1 / d) - p_1 * q_2 * (1 - p_1 * q_2))) / (p_1 * p_2 - p_1 * q_2)^2;
    var = (var_n0 + var_ni * d) / ((d + 1) * n * n);
    var_two_stage(i) = var;
end

% Define marker shapes
marker_shapes = {'^', 'o', 's'};

% Plot one-stage perturbation scheme
plot(delta_range, var_one_stage, 'Marker', marker_shapes{1}, ...
     'MarkerSize', 10, ...
     'MarkerIndices', 1:10000:numel(delta_range), ...
     'LineWidth', 1);
hold on;

% Plot two-stage perturbation scheme
plot(delta_range, var_two_stage, 'Marker', marker_shapes{2}, ...
     'MarkerSize', 10, ...
     'MarkerIndices', 1:10000:numel(delta_range), ...
     'LineWidth', 1);

xlabel('Missing Rate \delta', 'FontName', 'Times New Roman', 'FontSize', 12);
ylabel('Mean Squared Error', 'FontName', 'Times New Roman', 'FontSize', 12);
legend('UP', 'TSP', 'FontName', 'Times New Roman', 'FontSize', 12, 'Location', 'SouthEast');
set(gca, 'FontSize', 12); % Set axis font size

% Set axis limits
xlim([0, 0.2]);
ylim([0, max([var_one_stage, var_two_stage]) * 1.1])

% Add grid lines
grid on;
title('(b) \delta', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold', 'position', [0.1, -0.00074, 0]);

% Display the figure
hold off;
