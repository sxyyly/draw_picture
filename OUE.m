% 创建一个新的图形窗口
figure;
% 绘制第1幅图
subplot(2,2, 1,'position',[0.24,0.62,0.2,0.304]);
% 参数设置
epsilon = 1;
beta = 0.01;
d = 16;
alpha_range = linspace(beta, 0.5, 100000);  % 增加采样点数量
n = 1000;

% 调整前OUE协议
p_1 = 1/2;
q_1 = 1 / (exp(epsilon) + 1);
var_before = (q_1 * (1 - q_1)) / (n * (p_1 - q_1)^2) + ((1 - p_1 - q_1)) / (d * n * (p_1 - q_1));

% 调整后OUE协议
var_after = zeros(size(alpha_range));
for i = 1:length(alpha_range)
    alpha = alpha_range(i);
    p_2 = (alpha + beta * exp(epsilon)) / (2 * alpha);
    q_2 = (alpha + beta * exp(epsilon)) * (alpha - beta * exp(epsilon)) / (((alpha + beta * exp(epsilon)) - 2 * alpha * (1 - alpha)) - (alpha + beta * exp(epsilon) - 2 * alpha * (1 - beta)) * exp(epsilon));
    var_after(i) = (q_2 * (1 - q_2)) / (n * (p_2 - q_2)^2) + ((1 - p_2 - q_2)) / (d * n * (p_2 - q_2));
end

% 定义标记形状
marker_shapes = {'^', 'o', 's'};

% 绘图
plot(alpha_range, var_before * ones(size(alpha_range)), 'LineWidth', 1, 'MarkerSize', 10,'Marker', marker_shapes{1}, 'MarkerIndices', 1:10000:numel(alpha_range));
hold on;
plot(alpha_range, var_after, 'LineWidth', 1, 'Marker', marker_shapes{2},'MarkerSize', 10, 'MarkerIndices', 1:10000:numel(alpha_range));
xlabel('Conditional Probability \alpha', 'FontName', 'Times New Roman','FontSize', 12);
ylabel('Mean Squared Error', 'FontName', 'Times New Roman','FontSize', 12);
legend('OUE', 'AOUE', 'FontName', 'Times New Roman','FontSize', 12,'position',[0.325,0.825,0.1355,0.0609]);

% 设置坐标轴范围
xlim([beta, 0.5]);
ylim([-0.0001, 0.004]);
set(gca, 'FontSize', 12); % 设置坐标轴字体大小
% 添加网格线
grid on;
% 显示图形
title('(a) \alpha', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold','position',[0.25,-0.0016,0]);
hold off;
% 绘制第2幅图
subplot(2, 2, 2,'position',[0.57,0.62,0.2,0.304]);
% 参数设置
epsilon = 1;
alpha = 0.1;
d = 16;
beta_range = linspace(0.000001, alpha, 50);
n = 1000;

% 调整前OUE协议
p_1 = 1/2;
q_1 = 1 / (exp(epsilon) + 1);
var_before = (q_1 * (1 - q_1)) / (n * (p_1 - q_1)^2) + ((1 - p_1 - q_1)) / (d * n * (p_1 - q_1));

% 调整后OUE协议
var_after = zeros(size(beta_range));
for i = 1:length(beta_range)
    beta = beta_range(i);
    p_2 = (alpha + beta * exp(epsilon)) / (2 * alpha);
    q_2 = (alpha + beta * exp(epsilon)) * (alpha - beta * exp(epsilon)) / (((alpha + beta * exp(epsilon)) - 2 * alpha * (1 - alpha)) - (alpha + beta * exp(epsilon) - 2 * alpha * (1 - beta)) * exp(epsilon));
    var_after(i) = (q_2 * (1 - q_2)) / (n * (p_2 - q_2)^2) + ((1 - p_2 - q_2)) / (d * n * (p_2 - q_2));
end
% 定义标记形状
marker_shapes = {'^', 'o', 's'};
% 绘图
plot(beta_range, var_before * ones(size(beta_range)),  'Marker', marker_shapes{1}, 'MarkerSize', 10,  'MarkerIndices', 1:10:numel(beta_range),'LineWidth', 1);
hold on;
plot(beta_range, var_after,  'Marker', marker_shapes{2}, 'MarkerSize', 10,  'MarkerIndices', 1:10:numel(beta_range),'LineWidth', 1);
xlabel('Conditional Probability \beta', 'FontName', 'Times New Roman','FontSize', 12);
ylabel('Mean Squared Erro', 'FontName', 'Times New Roman','FontSize', 12);
legend('OUE', 'AOUE', 'FontName', 'Times New Roman','FontSize', 12,'position',[0.655,0.825,0.1355,0.0609]);

% 设置坐标轴范围
xlim([0, alpha]);
ylim([0, 0.004]);
set(gca, 'FontSize', 12); % 设置坐标轴字体大小
% 添加网格线
grid on;
% 显示图形
hold off;
title('(b) \beta', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold','position',[0.05,-0.00145,0]);



% 绘制第三幅图
subplot(2, 2, 3,'position',[0.24,0.15,0.2,0.304]);
% 参数设置
alpha = 0.1;
beta = 0.01;
d = 16;
n = 1000;
epsilon_range = linspace(0.1, 3, 1000); % ε 的取值范围

% 初始化误差数组
var_before = zeros(size(epsilon_range));
var_after = zeros(size(epsilon_range));

% 计算调整前和调整后的 OUE 协议误差
for i = 1:length(epsilon_range)
    epsilon = epsilon_range(i);
    
    % 调整前的扰动概率
    p_1 = 1/2;
    q_1 = 1 / (exp(epsilon) + 1);
    
    % 调整前的误差计算
    var_before(i) = (q_1 * (1 - q_1)) / (n * (p_1 - q_1)^2) + ((1 - p_1 - q_1)) / (d * n * (p_1 - q_1));
    
    % 调整后的扰动概率
    p_2 = (alpha + beta * exp(epsilon)) / (2 * alpha);
    q_2 = (alpha + beta * exp(epsilon)) * (alpha - beta * exp(epsilon)) /  (((alpha + beta * exp(epsilon)) - 2 * alpha * (1 - alpha)) - (alpha + beta * exp(epsilon) - 2 * alpha * (1 - beta)) * exp(epsilon));
    
    % 调整后的误差计算
    var_after(i) = (q_2 * (1 - q_2)) / (n * (p_2 - q_2)^2) + ((1 - p_2 - q_2)) / (d * n * (p_2 - q_2));
end

% 定义标记形状
marker_shapes = {'^', 'o', 's'};

% 绘制曲线

plot(epsilon_range, var_before, 'LineWidth', 1, 'Marker', marker_shapes{1},'MarkerSize',10,'MarkerIndices', 1:100:numel(epsilon_range));
hold on;
plot(epsilon_range, var_after, 'LineWidth', 1, 'Marker', marker_shapes{2}, 'MarkerSize',10,'MarkerIndices', 1:100:numel(epsilon_range));

% 添加图例和标签
xlabel('Privacy Budget \epsilon', 'FontName', 'Times New Roman','FontSize', 12);
ylabel('Mean Squared Error', 'FontName', 'Times New Roman','FontSize', 12);
legend('OUE', 'AOUE', 'FontName', 'Times New Roman','FontSize', 12);

% 设置坐标轴范围
xlim([0.1, 3]);
ylim([0, 0.45]); % 自动调整 y 轴范围以适应数据
set(gca, 'FontSize', 12); % 设置坐标轴字体大小
% 添加网格线
grid on;
% 显示图形
title('(c) \epsilon', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold','position',[1.5,-0.16,0]);
hold off;

% 绘制第四幅图
subplot(2, 2, 4,'position',[0.57,0.15,0.2,0.304]);
% 参数设置
epsilon = 1;
alpha = 0.1;
beta = 0.01;
d_range =16:1:1024; % 属性域大小 d 的范围
n = 1000; % 用户数

% 初始化误差数组
var_before = zeros(size(d_range));
var_after = zeros(size(d_range));

% 调整前的扰动概率
p_1 = 1/2;
q_1 = 1 / (exp(epsilon) + 1);

% 计算调整前的协议误差
for i = 1:length(d_range)
    d = d_range(i);
    var_before(i) = (q_1 * (1 - q_1)) / (n * (p_1 - q_1)^2) + ((1 - p_1 - q_1)) / (d * n * (p_1 - q_1));
end

% 计算调整后的协议误差
for i = 1:length(d_range)
    d = d_range(i);
    % 调整后的扰动概率
    p_2 = (alpha + beta * exp(epsilon)) / (2 * alpha);
    q_2 = (alpha + beta * exp(epsilon)) * (alpha - beta * exp(epsilon)) / ...
          (((alpha + beta * exp(epsilon)) - 2 * alpha * (1 - alpha)) - ...
           (alpha + beta * exp(epsilon) - 2 * alpha * (1 - beta)) * exp(epsilon));
    
    % 调整后的误差计算
    var_after(i) = (q_2 * (1 - q_2)) / (n * (p_2 - q_2)^2) + ((1 - p_2 - q_2)) / (d * n * (p_2 - q_2));
end
% 定义标记形状
marker_shapes = {'^', 'o', 's'};
% 绘制曲线
plot(d_range, var_before,'Marker', marker_shapes{1}, 'MarkerSize', 10, 'MarkerIndices', 1:100:numel(epsilon_range),'LineWidth', 1);
hold on;
plot(d_range, var_after, 'Marker', marker_shapes{2}, 'MarkerSize', 10, 'MarkerIndices', 1:100:numel(epsilon_range),'LineWidth', 1);

% 添加图例和标签

xlabel('Attribute Domain Size d', 'FontName', 'Times New Roman','FontSize', 12);
ylabel('Mean Squared Error', 'FontName', 'Times New Roman','FontSize', 12);
legend('OUE', 'AOUE', 'FontName', 'Times New Roman','FontSize', 12,'position',[0.655,0.345,0.1355,0.0609]);

% 设置坐标轴范围
xlim([16, 1024]);
ylim([0, max([var_before, var_after]) * 1.1]); % 自动调整 y 轴范围以适应数据
set(gca, 'FontSize', 12); % 设置坐标轴字体大小
% 添加网格线
grid on;
title('(d) d', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold','position',[500,-0.0015,0]);
% 显示图形
hold off;
