% Create a new figure window
figure;

% Plot the first figure
subplot(1,3, 1,'position',[0.085,0.35,0.25,0.38]);
% Set parameters
epsilon = 1;
beta_values = [0.01, 0.05, 0.1];
hold on;
% Define marker shapes
marker_shapes = {'^', 'o', 's', 'x'};
marker_size = 10; % Increase marker size
% Set axis limits
xlim([0, 0.2]);
ylim([0.9, 1.01]);
set(gca, 'FontSize', 12); % Set axis font size
% Plot curves
for i = 1:numel(beta_values)
    beta = beta_values(i);
    alpha = linspace(beta, 0.2, 1000000);
    p1 = min(1, ((1 - alpha) - (1 - beta) .* exp(epsilon)) ./ ((1 - 2 * alpha) - (1 - 2 * beta) .* exp(epsilon)));
    plot(alpha, p1, 'LineWidth', 1, 'Marker', marker_shapes{i}, 'MarkerSize', marker_size, 'MarkerIndices', 1:100000:numel(alpha));
end
% Plot p_1 = 1 line
x_range = linspace(0, 0.2, 100);
y_p1_1 = ones(size(x_range));
plot(x_range, y_p1_1, 'LineWidth', 1, 'Marker', marker_shapes{end}, 'MarkerSize', marker_size, 'MarkerIndices', 1:10:numel(x_range), 'Color', [0.4940, 0.1840, 0.5560]); % Use new marker shape and color
% Plot vertical dashed lines
for i = 1:numel(beta_values)
    alpha = beta_values(i);
    x_line = alpha * ones(size(ylim));
    % Select line color based on index
    switch i
        case 1
            line_color = [0, 0.4470, 0.7410]; % Blue
        case 2
            line_color = [0.8500, 0.3250, 0.0980]; % Orange
        case 3
            line_color = [0.9290, 0.6940, 0.1250]; % Yellow
    end
    
    line(x_line, [0.9,1], 'LineStyle', '--', 'Color', line_color);
end

% Label x-axis
text(0.01, 0.895, '0.01', 'FontName', 'Times New Roman', 'Color', [0, 0.4470, 0.7410], 'FontSize', 12);

% Set axis labels and title
xlabel('Conditional Probability \alpha', 'FontName', 'Times New Roman', 'FontSize', 12);
ylabel('p_1', 'FontName', 'Times New Roman', 'FontSize', 12);
legend('\beta = 0.01', '\beta = 0.05', '\beta = 0.1', '\beta = \alpha/e^\epsilon', 'FontName', 'Times New Roman', 'FontSize', 12,'Location','southwest');
% Add grid
grid on;
set(gca, 'FontSize', 12); % Set axis font size
% Add box
box on;
title('(a) \alpha', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold','position',[0.1,0.869,0]);
hold off;

% Plot the second figure
subplot(1, 3, 2,'position',[0.395,0.35,0.25,0.38]);
% Set parameters
epsilon = 1;
alpha_values = [0.2, 0.15, 0.1];
hold on;
% Define marker shapes
marker_shapes = {'^', 'o', 's', 'x'};
marker_size = 10; % Increase marker size
% Plot curves
for i = 1:numel(alpha_values)
alpha = alpha_values(i);
beta = linspace(0, alpha, 100);
p1 = min(1, ((1 - alpha) - (1 - beta) .* exp(epsilon)) ./ ((1 - 2 * alpha) - (1 - 2 * beta) .* exp(epsilon)));
plot(beta, p1, 'LineWidth', 1, 'Marker', marker_shapes{i}, 'MarkerSize', marker_size, 'MarkerIndices', 1:10:numel(beta)); % Use different colors, increase line width
end
% Plot p_1 = 1 line
x_range = linspace(0, max(alpha_values), 100);
y_p1_1 = ones(size(x_range));
plot(x_range, y_p1_1, 'LineWidth', 1, 'Marker', marker_shapes{end}, 'MarkerSize', marker_size, 'MarkerIndices', 1:10:numel(x_range), 'Color', [0.4940, 0.1840, 0.5560]); % Use new marker shape and color, increase line width

% Plot vertical dashed lines
for i = 1:numel(alpha_values)
alpha = alpha_values(i);
x_line = alpha * ones(size(ylim));% Select line color based on index
switch i
    case 1
        line_color = [0, 0.4470, 0.7410]; % Blue
    case 2
        line_color = [0.8500, 0.3250, 0.0980]; % Orange
    case 3
        line_color = [0.9290, 0.6940, 0.1250]; % Yellow
end

line(x_line, ylim, 'LineStyle', '--', 'Color', line_color, 'LineWidth', 1); % Increase line width
end
% Set axis labels and title
xlabel('Conditional Probability \beta', 'FontName', 'Times New Roman', 'FontSize', 12); % Increase font size
ylabel('p_1', 'FontName', 'Times New Roman', 'FontSize', 12); % Increase font size
legend('\alpha = 0.2', '\alpha = 0.15', '\alpha = 0.1', '\alpha = \betae^\epsilon', 'FontName', 'Times New Roman', 'FontSize', 12, 'Location','southeast'); % Increase font size, adjust legend position

% Set axis limits
xlim([0, max(alpha_values)]);
ylim([0.9, 1.01]);
set(gca, 'FontSize', 12); % Set axis font size
% Add grid
grid on;
% Add box
box on;

hold off;

title('(b) \beta', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold','position',[0.1,0.869,0]);


% Plot the third figure
subplot(1,3, 3,'position',[0.7,0.35,0.25,0.38]);
% Set parameters
alpha = 0.1;
beta_values = [0.01, 0.05, 0.1];

hold on;

% Define marker shapes
marker_shapes = {'^', 'o', 's', 'x'};

% Plot curves
for i = 1:numel(beta_values)
    beta = beta_values(i);
    epsilon = linspace(0.1, 3, 1000000);
    p1 = min(1, ((1 - alpha) - (1 - beta) .* exp(epsilon)) ./ ((1 - 2 * alpha) - (1 - 2 * beta) .* exp(epsilon)));
    plot(epsilon, p1, 'LineWidth', 1, 'Marker', marker_shapes{i},  'MarkerSize', 10,'MarkerIndices', 1:100000:numel(epsilon));
end

% Plot p_1 = 1 line
x_range = linspace(0.1, 3, 100);
y_p1_1 = ones(size(x_range));
plot(x_range, y_p1_1, 'LineWidth', 1, 'Marker', marker_shapes{end}, 'MarkerSize', 10,'MarkerIndices', 1:10:numel(x_range), 'Color', [0.4940, 0.1840, 0.5560]); % Use new marker shape and color

% Add vertical line
line([0.1, 0.1], ylim, 'LineStyle', '--', 'Color', [0.6350, 0.0780, 0.1840]); % Red dashed line

% Get current axis limits
xlim_values = xlim;
ylim_values = ylim;

% Label x-axis
text(0.1, ylim_values(1) - 0.05 * diff(ylim_values), '0.1', 'FontName', 'Times New Roman', 'Color', [0.6350, 0.0780, 0.1840],'FontSize', 12); % Red text

% Set axis labels and title
xlabel('Privacy Budget \epsilon', 'FontName', 'Times New Roman','FontSize', 12);
ylabel('p_1', 'FontName', 'Times New Roman','FontSize', 12);
legend('\beta = 0.01', '\beta = 0.05', '\beta = 0.1', '\beta = \alpha/e^\epsilon', 'FontName', 'Times New Roman','FontSize', 12,'Location','southeast');

% Set axis limits
xlim([0, 3]);
ylim([0.65, 1.05]);
set(gca, 'FontSize', 12); % Set axis font size
% Add grid
grid on;
box on;
title('(c) \epsilon', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold','position',[1.5,0.54,0]);
hold off;
