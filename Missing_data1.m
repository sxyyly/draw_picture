% 创建一个新的图形窗口
figure;
% 绘制第一幅图
subplot(1,3, 1,'position',[0.085,0.35,0.25,0.38]);
% 设置参数
epsilon = 1;
beta_values = [0.01, 0.05, 0.1];
hold on;
% 定义标记形状
marker_shapes = {'^', 'o', 's', 'x'};
marker_size = 10; % 增大标记大小
% 设置坐标轴范围
xlim([0, 0.2]);
ylim([0.9, 1.01]);
set(gca, 'FontSize', 12); % 设置坐标轴字体大小
% 绘制曲线
for i = 1:numel(beta_values)
    beta = beta_values(i);
    alpha = linspace(beta, 0.2, 1000000);
    p1 = min(1, ((1 - alpha) - (1 - beta) .* exp(epsilon)) ./ ((1 - 2 * alpha) - (1 - 2 * beta) .* exp(epsilon)));
    plot(alpha, p1, 'LineWidth', 1, 'Marker', marker_shapes{i}, 'MarkerSize', marker_size, 'MarkerIndices', 1:100000:numel(alpha));
end
% 绘制 p_1 = 1 线
x_range = linspace(0, 0.2, 100);
y_p1_1 = ones(size(x_range));
plot(x_range, y_p1_1, 'LineWidth', 1, 'Marker', marker_shapes{end}, 'MarkerSize', marker_size, 'MarkerIndices', 1:10:numel(x_range), 'Color', [0.4940, 0.1840, 0.5560]); % 使用新的标记形状和颜色
% 绘制竖虚线
for i = 1:numel(beta_values)
    alpha = beta_values(i);
    x_line = alpha * ones(size(ylim));
    % 根据索引选择对应的颜色
    switch i
        case 1
            line_color = [0, 0.4470, 0.7410]; % 蓝色
        case 2
            line_color = [0.8500, 0.3250, 0.0980]; % 橙色
        case 3
            line_color = [0.9290, 0.6940, 0.1250]; % 黄色
    end
    
    line(x_line, [0.9,1], 'LineStyle', '--', 'Color', line_color);
end

% 标注横坐标
text(0.01, 0.895, '0.01', 'FontName', 'Times New Roman', 'Color', [0, 0.4470, 0.7410], 'FontSize', 12);

% 设置坐标轴标签和标题
xlabel('Conditional Probability \alpha', 'FontName', 'Times New Roman', 'FontSize', 12);
ylabel('p_1', 'FontName', 'Times New Roman', 'FontSize', 12);
legend('\beta = 0.01', '\beta = 0.05', '\beta = 0.1', '\beta = \alpha/e^\epsilon', 'FontName', 'Times New Roman', 'FontSize', 12,'Location','southwest');
% 添加网格线
grid on;
set(gca, 'FontSize', 12); % 设置坐标轴字体大小
% 设置坐标轴边框
box on;
title('(a) \alpha', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold','position',[0.1,0.869,0]);
hold off;

% 绘制第二幅图
subplot(1, 3, 2,'position',[0.395,0.35,0.25,0.38]);
% 设置参数
epsilon = 1;
alpha_values = [0.2, 0.15, 0.1];
hold on;
% 定义标记形状
marker_shapes = {'^', 'o', 's', 'x'};
marker_size = 10; % 增大标记大小
% 绘制曲线
for i = 1:numel(alpha_values)
alpha = alpha_values(i);
beta = linspace(0, alpha, 100);
p1 = min(1, ((1 - alpha) - (1 - beta) .* exp(epsilon)) ./ ((1 - 2 * alpha) - (1 - 2 * beta) .* exp(epsilon)));
plot(beta, p1, 'LineWidth', 1, 'Marker', marker_shapes{i}, 'MarkerSize', marker_size, 'MarkerIndices', 1:10:numel(beta)); % 使用不同颜色, 增大线宽
end
% 绘制 p_1 = 1 线
x_range = linspace(0, max(alpha_values), 100);
y_p1_1 = ones(size(x_range));
plot(x_range, y_p1_1, 'LineWidth', 1, 'Marker', marker_shapes{end}, 'MarkerSize', marker_size, 'MarkerIndices', 1:10:numel(x_range), 'Color', [0.4940, 0.1840, 0.5560]); % 使用新的标记形状和颜色, 增大线宽

% 绘制竖虚线
for i = 1:numel(alpha_values)
alpha = alpha_values(i);
x_line = alpha * ones(size(ylim));% 根据索引选择对应的颜色
switch i
    case 1
        line_color = [0, 0.4470, 0.7410]; % 蓝色
    case 2
        line_color = [0.8500, 0.3250, 0.0980]; % 橙色
    case 3
        line_color = [0.9290, 0.6940, 0.1250]; % 黄色
end

line(x_line, ylim, 'LineStyle', '--', 'Color', line_color, 'LineWidth', 1); % 增大线宽
end
% 设置坐标轴标签和标题
xlabel('Conditional Probability \beta', 'FontName', 'Times New Roman', 'FontSize', 12); % 增大字体大小
ylabel('p_1', 'FontName', 'Times New Roman', 'FontSize', 12); % 增大字体大小
legend('\alpha = 0.2', '\alpha = 0.15', '\alpha = 0.1', '\alpha = \betae^\epsilon', 'FontName', 'Times New Roman', 'FontSize', 12, 'Location','southeast'); % 增大字体大小, 调整图例位置

% 设置坐标轴范围
xlim([0, max(alpha_values)]);
ylim([0.9, 1.01]);
set(gca, 'FontSize', 12); % 设置坐标轴字体大小
% 添加网格线
grid on;
% 设置坐标轴边框
box on;

hold off;

title('(b) \beta', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold','position',[0.1,0.869,0]);


% 绘制第三幅图
subplot(1,3, 3,'position',[0.7,0.35,0.25,0.38]);
% 设置参数
alpha = 0.1;
beta_values = [0.01, 0.05, 0.1];

hold on;

% 定义标记形状
marker_shapes = {'^', 'o', 's', 'x'};

% 绘制曲线
for i = 1:numel(beta_values)
    beta = beta_values(i);
    epsilon = linspace(0.1, 3, 1000000);
    p1 = min(1, ((1 - alpha) - (1 - beta) .* exp(epsilon)) ./ ((1 - 2 * alpha) - (1 - 2 * beta) .* exp(epsilon)));
    plot(epsilon, p1, 'LineWidth', 1, 'Marker', marker_shapes{i},  'MarkerSize', 10,'MarkerIndices', 1:100000:numel(epsilon));
end

% 绘制 p_1 = 1 线
x_range = linspace(0.1, 3, 100);
y_p1_1 = ones(size(x_range));
plot(x_range, y_p1_1, 'LineWidth', 1, 'Marker', marker_shapes{end}, 'MarkerSize', 10,'MarkerIndices', 1:10:numel(x_range), 'Color', [0.4940, 0.1840, 0.5560]); % 使用新的标记形状和颜色

% 添加竖线
line([0.1, 0.1], ylim, 'LineStyle', '--', 'Color', [0.6350, 0.0780, 0.1840]); % 红色虚线

% 获取当前坐标轴限制
xlim_values = xlim;
ylim_values = ylim;

% 标注横坐标
text(0.1, ylim_values(1) - 0.05 * diff(ylim_values), '0.1', 'FontName', 'Times New Roman', 'Color', [0.6350, 0.0780, 0.1840],'FontSize', 12); % 红色文本

% 设置坐标轴标签和标题
xlabel('Privacy Budget \epsilon', 'FontName', 'Times New Roman','FontSize', 12);
ylabel('p_1', 'FontName', 'Times New Roman','FontSize', 12);
legend('\beta = 0.01', '\beta = 0.05', '\beta = 0.1', '\beta = \alpha/e^\epsilon', 'FontName', 'Times New Roman','FontSize', 12,'Location','southeast');

% 设置坐标轴范围
xlim([0, 3]);
ylim([0.65, 1.05]);
set(gca, 'FontSize', 12); % 设置坐标轴字体大小
% 添加网格线
grid on;
box on;
title('(c) \epsilon', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold','position',[1.5,0.54,0]);
hold off;

