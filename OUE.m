% Create a new figure window
figure;

% Plot the first figure
subplot(2,2, 1,'position',[0.24,0.62,0.2,0.304]);
% Parameter settings
epsilon = 1;
beta = 0.01;
d = 16;
alpha_range = linspace(beta, 0.5, 100000);  % Increase the number of sampling points
n = 1000;

% Before adjustment, OUE protocol
p_1 = 1/2;
q_1 = 1 / (exp(epsilon) + 1);
var_before = (q_1 * (1 - q_1)) / (n * (p_1 - q_1)^2) + ((1 - p_1 - q_1)) / (d * n * (p_1 - q_1));

% After adjustment, OUE protocol
var_after = zeros(size(alpha_range));
for i = 1:length(alpha_range)
    alpha = alpha_range(i);
    p_2 = (alpha + beta * exp(epsilon)) / (2 * alpha);
    q_2 = (alpha + beta * exp(epsilon)) * (alpha - beta * exp(epsilon)) / (((alpha + beta * exp(epsilon)) - 2 * alpha * (1 - alpha)) - (alpha + beta * exp(epsilon) - 2 * alpha * (1 - beta)) * exp(epsilon));
    var_after(i) = (q_2 * (1 - q_2)) / (n * (p_2 - q_2)^2) + ((1 - p_2 - q_2)) / (d * n * (p_2 - q_2));
end

% Define marker shapes
marker_shapes = {'^', 'o', 's'};

% Plot
plot(alpha_range, var_before * ones(size(alpha_range)), 'LineWidth', 1, 'MarkerSize', 10,'Marker', marker_shapes{1}, 'MarkerIndices', 1:10000:numel(alpha_range));
hold on;
plot(alpha_range, var_after, 'LineWidth', 1, 'Marker', marker_shapes{2},'MarkerSize', 10, 'MarkerIndices', 1:10000:numel(alpha_range));
xlabel('Conditional Probability \alpha', 'FontName', 'Times New Roman','FontSize', 12);
ylabel('Mean Squared Error', 'FontName', 'Times New Roman','FontSize', 12);
legend('OUE', 'AOUE', 'FontName', 'Times New Roman','FontSize', 12,'position',[0.325,0.825,0.1355,0.0609]);

% Set axis range
xlim([beta, 0.5]);
ylim([-0.0001, 0.004]);
set(gca, 'FontSize', 12); % Set axis font size
% Add grid lines
grid on;
% Display figure
title('(a) \alpha', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold','position',[0.25,-0.0016,0]);
hold off;

% Plot the second figure
subplot(2, 2, 2,'position',[0.57,0.62,0.2,0.304]);
% Parameter settings
epsilon = 1;
alpha = 0.1;
d = 16;
beta_range = linspace(0.000001, alpha, 50);
n = 1000;

% Before adjustment, OUE protocol
p_1 = 1/2;
q_1 = 1 / (exp(epsilon) + 1);
var_before = (q_1 * (1 - q_1)) / (n * (p_1 - q_1)^2) + ((1 - p_1 - q_1)) / (d * n * (p_1 - q_1));

% After adjustment, OUE protocol
var_after = zeros(size(beta_range));
for i = 1:length(beta_range)
    beta = beta_range(i);
    p_2 = (alpha + beta * exp(epsilon)) / (2 * alpha);
    q_2 = (alpha + beta * exp(epsilon)) * (alpha - beta * exp(epsilon)) / (((alpha + beta * exp(epsilon)) - 2 * alpha * (1 - alpha)) - (alpha + beta * exp(epsilon) - 2 * alpha * (1 - beta)) * exp(epsilon));
    var_after(i) = (q_2 * (1 - q_2)) / (n * (p_2 - q_2)^2) + ((1 - p_2 - q_2)) / (d * n * (p_2 - q_2));
end

% Define marker shapes
marker_shapes = {'^', 'o', 's'};

% Plot
plot(beta_range, var_before * ones(size(beta_range)),  'Marker', marker_shapes{1}, 'MarkerSize', 10,  'MarkerIndices', 1:10:numel(beta_range),'LineWidth', 1);
hold on;
plot(beta_range, var_after,  'Marker', marker_shapes{2}, 'MarkerSize', 10,  'MarkerIndices', 1:10:numel(beta_range),'LineWidth', 1);
xlabel('Conditional Probability \beta', 'FontName', 'Times New Roman','FontSize', 12);
ylabel('Mean Squared Erro', 'FontName', 'Times New Roman','FontSize', 12);
legend('OUE', 'AOUE', 'FontName', 'Times New Roman','FontSize', 12,'position',[0.655,0.825,0.1355,0.0609]);

% Set axis range
xlim([0, alpha]);
ylim([0, 0.004]);
set(gca, 'FontSize', 12); % Set axis font size
% Add grid lines
grid on;
% Display figure
hold off;
title('(b) \beta', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold','position',[0.05,-0.00145,0]);

% Plot the third figure
subplot(2, 2, 3,'position',[0.24,0.15,0.2,0.304]);
% Parameter settings
alpha = 0.1;
beta = 0.01;
d = 16;
n = 1000;
epsilon_range = linspace(0.1, 3, 1000); % Range of epsilon values

% Initialize error arrays
var_before = zeros(size(epsilon_range));
var_after = zeros(size(epsilon_range));

% Calculate the error of the OUE protocol before and after adjustment
for i = 1:length(epsilon_range)
    epsilon = epsilon_range(i);
    
    % Before adjustment, disturbance probability
    p_1 = 1/2;
    q_1 = 1 / (exp(epsilon) + 1);
    
    % Error calculation before adjustment
    var_before(i) = (q_1 * (1 - q_1)) / (n * (p_1 - q_1)^2) + ((1 - p_1 - q_1)) / (d * n * (p_1 - q_1));
    
    % After adjustment, disturbance probability
    p_2 = (alpha + beta * exp(epsilon)) / (2 * alpha);
    q_2 = (alpha + beta * exp(epsilon)) * (alpha - beta * exp(epsilon)) /  (((alpha + beta * exp(epsilon)) - 2 * alpha * (1 - alpha)) - (alpha + beta * exp(epsilon) - 2 * alpha * (1 - beta)) * exp(epsilon));
    
    % Error calculation after adjustment
    var_after(i) = (q_2 * (1 - q_2)) / (n * (p_2 - q_2)^2) + ((1 - p_2 - q_2)) / (d * n * (p_2 - q_2));
end

% Define marker shapes
marker_shapes = {'^', 'o', 's'};

% Plot the curves
plot(epsilon_range, var_before, 'LineWidth', 1, 'Marker', marker_shapes{1},'MarkerSize',10,'MarkerIndices', 1:100:numel(epsilon_range));
hold on;
plot(epsilon_range, var_after, 'LineWidth', 1, 'Marker', marker_shapes{2}, 'MarkerSize',10,'MarkerIndices', 1:100:numel(epsilon_range));

% Add legend and labels
xlabel('Privacy Budget \epsilon', 'FontName', 'Times New Roman','FontSize', 12);
ylabel('Mean Squared Error', 'FontName', 'Times New Roman','FontSize', 12);
legend('OUE', 'AOUE', 'FontName', 'Times New Roman','FontSize', 12);

% Set axis range
xlim([0.1, 3]);
ylim([0, 0.45]); % Automatically adjust the y-axis range to fit the data
set(gca, 'FontSize', 12); % Set axis font size
% Add grid lines
grid on;
% Display figure
title('(c) \epsilon', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold','position',[1.5,-0.16,0]);
hold off;

% Plot the fourth figure
subplot(2, 2, 4,'position',[0.57,0.15,0.2,0.304]);
% Parameter settings
epsilon = 1;
alpha = 0.1;
beta = 0.01;
d_range = 16:1:1024; % Range of attribute domain size d
n = 1000; % Number of users

% Initialize error arrays
var_before = zeros(size(d_range));
var_after = zeros(size(d_range));

% Before adjustment, disturbance probability
p_1 = 1/2;
q_1 = 1 / (exp(epsilon) + 1);

% Calculate the error of the protocol before adjustment
for i = 1:length(d_range)
    d = d_range(i);
    var_before(i) = (q_1 * (1 - q_1)) / (n * (p_1 - q_1)^2) + ((1 - p_1 - q_1)) / (d * n * (p_1 - q_1));
end

% Calculate the error of the protocol after adjustment
for i = 1:length(d_range)
    d = d_range(i);
    % After adjustment, disturbance probability
    p_2 = (alpha + beta * exp(epsilon)) / (2 * alpha);
    q_2 = (alpha + beta * exp(epsilon)) * (alpha - beta * exp(epsilon)) / ...
          (((alpha + beta * exp(epsilon)) - 2 * alpha * (1 - alpha)) - ...
           (alpha + beta * exp(epsilon) - 2 * alpha * (1 - beta)) * exp(epsilon));
    
    % Error calculation after adjustment
    var_after(i) = (q_2 * (1 - q_2)) / (n * (p_2 - q_2)^2) + ((1 - p_2 - q_2)) / (d * n * (p_2 - q_2));
end

% Define marker shapes
marker_shapes = {'^', 'o', 's'};

% Plot the curves
plot(d_range, var_before,'Marker', marker_shapes{1}, 'MarkerSize', 10, 'MarkerIndices', 1:100:numel(epsilon_range),'LineWidth', 1);
hold on;
plot(d_range, var_after, 'Marker', marker_shapes{2}, 'MarkerSize', 10, 'MarkerIndices', 1:100:numel(epsilon_range),'LineWidth', 1);

% Add legend and labels
xlabel('Attribute Domain Size d', 'FontName', 'Times New Roman','FontSize', 12);
ylabel('Mean Squared Error', 'FontName', 'Times New Roman','FontSize', 12);
legend('OUE', 'AOUE', 'FontName', 'Times New Roman','FontSize', 12,'position',[0.655,0.345,0.1355,0.0609]);

% Set axis range
xlim([16, 1024]);
ylim([0, max([var_before, var_after]) * 1.1]); % Automatically adjust the y-axis range to fit the data
set(gca, 'FontSize', 12); % Set axis font size
% Add grid lines
grid on;
title('(d) d', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold','position',[500,-0.0015,0]);
% Display figure
hold off;
