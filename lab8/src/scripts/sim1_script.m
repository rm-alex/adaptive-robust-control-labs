%% (1)
set_param('sim1/phd_int', 'InitialCondition', '[0.5;0.5;0.5]');
set_param('sim1/nd1_int', 'InitialCondition', '0.5');
set_param('sim1/nd2_int', 'InitialCondition', '0.5');
set_param('sim1/bhd_int', 'InitialCondition', '10');
set_param('sim1', 'StopTime', '15.0');

%% (2), (3)
set_param('sim1/phd_int', 'InitialCondition', '[0;0;0]');
set_param('sim1/nd1_int', 'InitialCondition', '0');
set_param('sim1/nd2_int', 'InitialCondition', '0');
set_param('sim1/bhd_int', 'InitialCondition', '10');
set_param('sim1', 'StopTime', '100000.0');

%% sim 1
simOut = sim('sim1');
t = simOut.tout;

font_sz=12;

u = squeeze(simOut.get('u').signals.values);
figure;
plot(t, u, 'r', 'LineWidth', 1.5);
hold on;
grid on;
% ylim([-0.15 0.02])
ax = gca;
ax.FontSize = 10;
xlabel('t, sec', 'FontSize', font_sz, 'Interpreter', 'latex');
ylabel('$u(t)$', 'FontSize', font_sz, 'Interpreter', 'latex');
title('Control input $u(t)$', ...
        'FontSize', font_sz, 'Interpreter', 'latex');

y = squeeze(simOut.get('y').signals.values);
figure;
plot(t, y, 'r', 'LineWidth', 1.5);
hold on;
grid on;
% ylim([-7 1]*10^-2)
ax = gca;
ax.FontSize = 10;
xlabel('t, sec', 'FontSize', font_sz, 'Interpreter', 'latex');
ylabel('$y(t)$', 'FontSize', font_sz, 'Interpreter', 'latex');
title('System output $y(t)$', ...
        'FontSize', font_sz, 'Interpreter', 'latex');

psi_hat_p = [simOut.get('ph').signals.values, ...
    simOut.get('b0h').signals.values];
figure;
hold on;
grid on;
plot(t, psi_hat_p(:,1), 'g-',  'LineWidth', 1.5);
plot(t, psi_hat_p(:,2), 'r--',  'LineWidth', 1.5);
plot(t, psi_hat_p(:,3), 'b:', 'LineWidth', 1.5);
plot(t, psi_hat_p(:,4), 'm-', 'LineWidth', 1.5);
% ylim([0 16])
ax = gca;
ax.FontSize = 10;
xlabel('t, sec', 'FontSize', font_sz, 'Interpreter', 'latex');
ylabel('$\hat{\Psi}_p(t)$', 'FontSize', font_sz, 'Interpreter', 'latex');
title('Parameter estimates $\hat{\Psi}_p(t)$', ...
        'FontSize', font_sz, 'Interpreter', 'latex');
legend_entries = {'$\hat{\Psi}_1(t)$', '$\hat{\Psi}_2(t)$', ...
    '$\hat{\Psi}_3(t)$', '$\hat{b}_0(t)$'};
legend(legend_entries, 'Interpreter', 'latex', ...
    'FontSize', font_sz, 'Location', 'best');

%% sim 2
simOut2 = sim('sim1');
t = simOut2.tout;

font_sz = 12;

u = squeeze(simOut2.get('u').signals.values);

figure('Position', [100, 100, 800, 600]);
subplot(2,1,1);
plot(t, u, 'r', 'LineWidth', 1.5);
grid on;
xlabel('t, sec', 'FontSize', font_sz, 'Interpreter', 'latex');
ylabel('$u(t)$', 'FontSize', font_sz, 'Interpreter', 'latex');
title('Control input $u(t)$', 'FontSize', font_sz, 'Interpreter', 'latex');
ax = gca;
ax.FontSize = 10;

subplot(2,1,2);
plot(t, u, 'r', 'LineWidth', 1.5);
% xlim([x1 x2]); ylim([y1 y2]);
grid on;
xlabel('t, sec', 'FontSize', font_sz, 'Interpreter', 'latex');
ylabel('$u(t)$', 'FontSize', font_sz, 'Interpreter', 'latex');
title('Control input $u(t)$ (zoom)', 'FontSize', font_sz, 'Interpreter', 'latex');
ax = gca;
ax.FontSize = 10;

y = squeeze(simOut2.get('y').signals.values);
ym = squeeze(simOut2.get('ym').signals.values);

figure('Position', [150, 150, 800, 600]);
subplot(2,1,1);
plot(t, ym, 'b-', 'LineWidth', 1.5);
hold on;
plot(t, y, 'r--', 'LineWidth', 1.5);
grid on;
xlabel('t, sec', 'FontSize', font_sz, 'Interpreter', 'latex');
ylabel('$y_m(t),\ y(t)$', 'FontSize', font_sz, 'Interpreter', 'latex');
title('Outputs $y_m(t)$ and $y(t)$', ...
      'FontSize', font_sz, 'Interpreter', 'latex');
legend({'$y_m(t)$', '$y(t)$'}, 'Interpreter', 'latex', 'FontSize', font_sz, 'Location', 'best');
ax = gca;
ax.FontSize = 10;

subplot(2,1,2);
plot(t, ym, 'b-', 'LineWidth', 1.5);
hold on;
plot(t, y, 'r--', 'LineWidth', 1.5);
% xlim([x1 x2]); ylim([y1 y2]);
grid on;
xlabel('t, sec', 'FontSize', font_sz, 'Interpreter', 'latex');
ylabel('$y_m(t),\ y(t)$', 'FontSize', font_sz, 'Interpreter', 'latex');
title('Outputs (zoom)', 'FontSize', font_sz, 'Interpreter', 'latex');
legend({'$y_m(t)$', '$y(t)$'}, 'Interpreter', 'latex', 'FontSize', font_sz, 'Location', 'best');
ax = gca;
ax.FontSize = 10;


psi_hat_p = [simOut2.get('ph').signals.values, ...
             simOut2.get('b0h').signals.values];
figure;
hold on;
grid on;
plot(t, psi_hat_p(:,1), 'g-',  'LineWidth', 1.5);
plot(t, psi_hat_p(:,2), 'r-', 'LineWidth', 1.5);
plot(t, psi_hat_p(:,3), 'b:',  'LineWidth', 1.5);
plot(t, psi_hat_p(:,4), 'm-',  'LineWidth', 1.5);
xlabel('t, sec', 'FontSize', font_sz, 'Interpreter', 'latex');
ylabel('$\hat{\Psi}_p(t)$', 'FontSize', font_sz, 'Interpreter', 'latex');
title('Parameter estimates $\hat{\Psi}_p(t)$', ...
      'FontSize', font_sz, 'Interpreter', 'latex');
legend_entries = {'$\hat{\Psi}_1(t)$', '$\hat{\Psi}_2(t)$', ...
                  '$\hat{\Psi}_3(t)$', '$\hat{b}_0(t)$'};
legend(legend_entries, 'Interpreter', 'latex', ...
       'FontSize', font_sz, 'Location', 'best');
ax = gca;
ax.FontSize = 10;
