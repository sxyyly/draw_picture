% Create a new figure window
figure;
% Plot the first figure
subplot(2,2, 1,'position',[0.24,0.62,0.2,0.304]);
% Parameter settings
epsilon = 1;
beta = 0.01;
d = 8;
alpha_range = linspace(beta, 0.499999999, 100);
n = 1000;

% GRR protocol before adjustment
p_1 = exp(epsilon) / (exp(epsilon) + d - 1);
q_1 = 1 / (exp(epsilon) + d - 1);
var_before = (q_1 * (1 - q_1)) / (n * (p_1 - q_1)^2) + ((1 - p_1 - q_1)) / (d * n * (p_1 - q_1));

% GRR protocol after adjustment
var_after = zeros(size(alpha_range));
for i = 1:length(alpha_range)
    alpha = alpha_range(i);
    p_2 = min(1, ((1 - alpha) - (1 - beta) * exp(epsilon)) / ((1 - d * alpha) - (1 - d * beta) * exp(epsilon)));
    q_2 = (1 - p_2) / (d - 1);
    var_after(i) = (q_2 * (1 - q_2)) / (n * (p_2 - q_2)^2) + ((1 - p_2 - q_2)) / (d * n * (p_2 - q_2));
end

% Define marker shapes
marker_shapes = {'^', 'o', 's'};

% Plot
plot(alpha_range, var_before * ones(size(alpha_range)), 'LineWidth', 1, 'Marker', marker_shapes{1},'MarkerSize', 10, 'MarkerIndices', 1:10:numel(alpha_range));
hold on;
plot(alpha_range, var_after, 'LineWidth', 1, 'Marker', marker_shapes{2}, 'MarkerSize', 10,'MarkerIndices', 1:10:numel(alpha_range));
xlabel('Conditional Probability \alpha', 'FontName', 'Times New Roman','FontSize', 12);
ylabel('Mean Squared Error', 'FontName', 'Times New Roman','FontSize', 12);
legend('GRR', 'AGRR', 'FontName', 'Times New Roman','FontSize', 12,'position',[0.3578,0.835,0.0746,0.0609]);

% Set axis limits
xlim([beta, 0.5]);
ylim([0, 0.0035]);
set(gca, 'FontSize', 12); % Set axis font size
% Add grid lines
grid on;

% Display plot
title('(a) \alpha', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold','position',[0.25,-0.0012,0]);
hold off;

% Plot the second figure
subplot(2, 2, 2,'position',[0.57,0.62,0.2,0.304]);
% Parameter settings
epsilon = 1;
alpha = 0.1;
d = 8;
beta_range = linspace(0.000001, alpha, 100000);
n = 1000;

% GRR protocol before adjustment
p_1 = exp(epsilon) / (exp(epsilon) + d - 1);
q_1 = 1 / (exp(epsilon) + d - 1);
var_before = (q_1 * (1 - q_1)) / (n * (p_1 - q_1)^2) + ((1 - p_1 - q_1)) / (d * n * (p_1 - q_1));

% GRR protocol after adjustment
var_after = zeros(size(beta_range));
for i = 1:length(beta_range)
    beta = beta_range(i);
    p_2 = min(1, ((1 - alpha) - (1 - beta) * exp(epsilon)) / ((1 - d * alpha) - (1 - d * beta) * exp(epsilon)));
    q_2 = (1 - p_2) / (d - 1);
    var_after(i) = (q_2 * (1 - q_2)) / (n * (p_2 - q_2)^2) + ((1 - p_2 - q_2)) / (d * n * (p_2 - q_2));
end

% Define marker shapes
marker_shapes = {'^', 'o', 's'};

% Plot
plot(beta_range, var_before * ones(size(beta_range)), 'LineWidth', 1, 'Marker', marker_shapes{1}, 'MarkerSize', 10, 'MarkerIndices', 1:10000:numel(beta_range));
hold on;
plot(beta_range, var_after, 'LineWidth', 1, 'Marker', marker_shapes{2},  'MarkerSize', 10,'MarkerIndices', 1:10000:numel(beta_range));
xlabel('Conditional Probability \beta', 'FontName', 'Times New Roman','FontSize', 12);
ylabel('Mean Squared Error', 'FontName', 'Times New Roman','FontSize', 12);
legend('GRR', 'AGRR', 'FontName', 'Times New Roman','FontSize', 12,'Location','southeast');

% Set axis limits
xlim([0, alpha]);
ylim([0, 0.004]);
set(gca, 'FontSize', 12); % Set axis font size
% Add grid lines
grid on;

% Display plot
hold off;
title('(b) \beta', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold','position',[0.05,-0.0014,0]);

% Plot the third figure
subplot(2, 2, 3,'position',[0.24,0.15,0.2,0.304]);
% Parameter settings
alpha = 0.1;
beta = 0.01;
d = 8;
epsilon_range = linspace(0.1, 3, 10000);
n = 1000;

% GRR protocol before adjustment
var_before = zeros(size(epsilon_range));
for i = 1:length(epsilon_range)
    epsilon = epsilon_range(i);
    p_1 = exp(epsilon) / (exp(epsilon) + d - 1);
    q_1 = 1 / (exp(epsilon) + d - 1);
    var_before(i) = (q_1 * (1 - q_1)) / (n * (p_1 - q_1)^2) + ((1 - p_1 - q_1)) / (d * n * (p_1 - q_1));
end

% GRR protocol after adjustment
var_after = zeros(size(epsilon_range));
for i = 1:length(epsilon_range)
    epsilon = epsilon_range(i);
    p_2 = min(1, ((1 - alpha) - (1 - beta) * exp(epsilon)) / ((1 - d * alpha) - (1 - d * beta) * exp(epsilon)));
    q_2 = (1 - p_2) / (d - 1);
    var_after(i) = (q_2 * (1 - q_2)) / (n * (p_2 - q_2)^2) + ((1 - p_2 - q_2)) / (d * n * (p_2 - q_2));
end

% Define marker shapes
marker_shapes = {'^', 'o', 's'};

% Plot
plot(epsilon_range, var_before, 'LineWidth', 1, 'Marker', marker_shapes{1},'MarkerSize', 10, 'MarkerIndices', 1:1000:numel(epsilon_range));
hold on;
plot(epsilon_range, var_after, 'LineWidth', 1, 'Marker', marker_shapes{2},'MarkerSize', 10, 'MarkerIndices', 1:1000:numel(epsilon_range));
xlabel('Privacy Budget \epsilon', 'FontName', 'Times New Roman','FontSize', 12);
ylabel('Mean Squared Error', 'FontName', 'Times New Roman','FontSize', 12);
legend('GRR', 'AGRR', 'FontName', 'Times New Roman','FontSize', 12);

% Set axis limits
xlim([0.1, 3]);
ylim([0, 0.7]);
set(gca, 'FontSize', 12); % Set axis font size
% Add grid lines
grid on;
title('(c) \epsilon', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold','position',[1.5,-0.24,0]);
hold off;

% Plot the fourth figure
subplot(2, 2, 4,'position',[0.57,0.15,0.2,0.304]);
% Parameter settings
epsilon = 1;
alpha = 0.1;
beta = 0.01;
d_range = 3:10;
n = 1000;

% GRR protocol before adjustment
var_before = zeros(size(d_range));
for i = 1:length(d_range)
    d = d_range(i);
    p_1 = exp(epsilon) / (exp(epsilon) + d - 1);
    q_1 = 1 / (exp(epsilon) + d - 1);
    var_before(i) = (q_1 * (1 - q_1)) / (n * (p_1 - q_1)^2) + ((1 - p_1 - q_1)) / (d * n * (p_1 - q_1));
end

% GRR protocol after adjustment
var_after = zeros(size(d_range));
for i = 1:length(d_range)
    d = d_range(i);
    p_2 = min(1, ((1 - alpha) - (1 - beta) * exp(epsilon)) / ((1 - d * alpha) - (1 - d * beta) * exp(epsilon)));
    q_2 = (1 - p_2) / (d - 1);
    var_after(i) = (q_2 * (1 - q_2)) / (n * (p_2 - q_2)^2) + ((1 - p_2 - q_2)) / (d * n * (p_2 - q_2));
end

% Define marker shapes
marker_shapes = {'^', 'o', 's'};

% Plot
plot(d_range, var_before, 'LineWidth', 1, 'Marker', marker_shapes{1}, 'MarkerSize', 10,'MarkerIndices', 1:2:numel(d_range));
hold on;
plot(d_range, var_after, 'LineWidth', 1, 'Marker', marker_shapes{2}, 'MarkerSize', 10,'MarkerIndices', 1:2:numel(d_range));
xlabel('Domain Size d', 'FontName', 'Times New Roman','FontSize', 12);
ylabel('Mean Squared Error', 'FontName', 'Times New Roman','FontSize', 12);
legend('GRR', 'AGRR', 'FontName', 'Times New Roman','FontSize', 12,'Location','northwest');

% Set axis limits
xlim([3, 10]);
ylim([0, 0.0045]);
set(gca, 'FontSize', 12); % Set axis font size
% Add grid lines
grid on;
title('(d) d', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold','position',[6.5,-0.0015,0]);
% Display plot
hold off;
