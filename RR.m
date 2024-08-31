% 创建一个新的图形窗口
figure;
% 绘制第1幅图
subplot(1,3, 1,'position',[0.085,0.35,0.25,0.38]);
% 参数设置
epsilon = 1;
beta = 0.01;
d = 8;
alpha_range = linspace(beta, 0.5, 100);
n = 1000;

% 调整前GRR协议
p_1 = exp(epsilon) / (1 + exp(epsilon));
q_1 = 1 - p_1;
var_before = (q_1 * (1 - q_1)) / (n * (p_1 - q_1)^2);

% 调整后GRR协议
var_after = zeros(size(alpha_range));
for i = 1:length(alpha_range)
    alpha = alpha_range(i);
    p_2 = min(1, ((1 - alpha) - (1 - beta) * exp(epsilon)) / ((1 - 2 * alpha) - (1 - 2 * beta) * exp(epsilon)));
    q_2 = 1 - p_2;
    var_after(i) = (q_2 * (1 - q_2)) / (n * (p_2 - q_2)^2);
end

% 定义标记形状
marker_shapes = {'^', 'o', 's'};

% 绘图
plot(alpha_range, var_before * ones(size(alpha_range)), 'LineWidth', 1, 'Marker', marker_shapes{1},'MarkerSize', 10, 'MarkerIndices', 1:10:numel(alpha_range));
hold on;
plot(alpha_range, var_after, 'LineWidth', 1, 'Marker', marker_shapes{2},'MarkerSize', 10, 'MarkerIndices', 1:10:numel(alpha_range));
xlabel('Conditional Probability \alpha', 'FontName', 'Times New Roman','FontSize', 12);
ylabel('Mean Squared Error', 'FontName', 'Times New Roman','FontSize', 12);
legend('RR', 'ARR', 'FontName', 'Times New Roman','FontSize', 12,'position',[0.225,0.62,0.1355,0.0609]);

% 设置坐标轴范围
xlim([beta, 0.5]);
ylim([0, 0.001]);
set(gca, 'FontSize', 12); % 设置坐标轴字体大小
% 添加网格线
grid on;

title('(a) \alpha', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold','position',[0.20,-0.000285,0]);
hold off;

% 绘制第2幅图
subplot(1, 3, 2,'position',[0.395,0.35,0.25,0.38]);
% 参数设置
epsilon = 1;
alpha = 0.1;
beta_range = linspace(0.000001, alpha, 10000);
n = 1000;

% 调整前RR协议
p_1 = exp(epsilon) / (1 + exp(epsilon));
q_1 = 1 - p_1;
var_before = (q_1 * (1 - q_1)) / (n * (p_1 - q_1)^2);

% 调整后RR协议
var_after = zeros(size(beta_range));
for i = 1:length(beta_range)
    beta = beta_range(i);
    p_2 = min(1, ((1 - alpha) - (1 - beta) * exp(epsilon)) / ((1 - 2 * alpha) - (1 - 2 * beta) * exp(epsilon)));
    q_2 = 1 - p_2;
    var_after(i) = (q_2 * (1 - q_2)) / (n * (p_2 - q_2)^2);
end

% 定义标记形状
marker_shapes = {'^', 'o', 's'};

% 绘图

plot(beta_range, var_before * ones(size(beta_range)), 'LineWidth', 1, 'Marker', marker_shapes{1}, 'MarkerSize', 10, 'MarkerIndices', 1:1000:numel(beta_range));
hold on;
plot(beta_range, var_after, 'LineWidth', 1, 'Marker', marker_shapes{2}, 'MarkerSize', 10, 'MarkerIndices', 1:1000:numel(beta_range));
xlabel('Conditional Probability \beta', 'FontName', 'Times New Roman','FontSize', 12);
ylabel('Mean Squared Error', 'FontName', 'Times New Roman','FontSize', 12);
legend('RR', 'ARR', 'FontName', 'Times New Roman','FontSize', 12,'position',[0.535,0.62,0.1355,0.0609]);

% 设置坐标轴范围
xlim([0, alpha]);
ylim([0,  0.001]);
set(gca, 'FontSize', 12); % 设置坐标轴字体大小
% 添加网格线
grid on;
% 显示图形
hold off;
title('(b) \beta', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold','position',[0.05,-0.000285,0]);


% 绘制第三幅图
subplot(1, 3, 3,'position',[0.7,0.35,0.25,0.38]);
% 参数设置
alpha = 0.1;
beta = 0.01;
d = 8;
epsilon_range = linspace(0.1, 3, 100000);
n = 1000;

% 调整前GRR协议
var_before = zeros(size(epsilon_range));
for i = 1:length(epsilon_range)
    epsilon = epsilon_range(i);
    p_1 = exp(epsilon) / (1 + exp(epsilon));
    q_1 = 1 - p_1;
    var_before(i) = (q_1 * (1 - q_1)) / (n * (p_1 - q_1)^2);
end

% 调整后GRR协议
var_after = zeros(size(epsilon_range));
for i = 1:length(epsilon_range)
    epsilon = epsilon_range(i);
    p_2 = min(1, ((1 - alpha) - (1 - beta) * exp(epsilon)) / ((1 - 2 * alpha) - (1 - 2 * beta) * exp(epsilon)));
    q_2 = 1 - p_2;
    var_after(i) = (q_2 * (1 - q_2)) / (n * (p_2 - q_2)^2);
end

% 定义标记形状
marker_shapes = {'^', 'o', 's'};

% 绘图

plot(epsilon_range, var_before, 'LineWidth', 1, 'Marker', marker_shapes{1}, 'MarkerSize', 10, 'MarkerIndices', 1:10000:numel(epsilon_range));
hold on;
plot(epsilon_range, var_after, 'LineWidth', 1, 'Marker', marker_shapes{2}, 'MarkerSize', 10, 'MarkerIndices', 1:10000:numel(epsilon_range));
xlabel('Privacy Budget \epsilon', 'FontName', 'Times New Roman','FontSize', 12);
ylabel('Mean Squared Error', 'FontName', 'Times New Roman','FontSize', 12);
legend('RR', 'ARR', 'FontName', 'Times New Roman','FontSize', 12);

% 设置坐标轴范围
xlim([0.1, 3]);
ylim([0,0.11]);
set(gca, 'FontSize', 12); % 设置坐标轴字体大小
% 添加网格线
grid on;
% 显示图形

title('(c) \epsilon', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold','position',[1.5,-0.0315,0]);
hold off;
