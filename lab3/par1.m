% Параметры эталонной модели
omega_0 = 3.2;
A_m = [0 1; -omega_0^2, -2*omega_0];
B_m = [0; omega_0^2];
C_m = [1 0];
D_m = 0;

% Моделирование
model_ss = ss(A_m, B_m, C_m, D_m);
t = 0:0.01:3;
[y_m, t] = step(model_ss, t);

% Анализ времени переходного процесса
y_steady = 1;
tolerance = 0.05;
for i = length(t):-1:1
    if abs(y_m(i) - y_steady) > tolerance
        actual_t_n = t(i + 1);
        break;
    end
end

fprintf('Расчетное время t_n: 1.50 c\n');
fprintf('Фактическое время t_n: %.3f c\n', actual_t_n);
fprintf('Погрешность: %.3f c\n', abs(actual_t_n - 1.5));

% Построение графика
figure;
plot(t, y_m, 'b', 'LineWidth', 2);
grid on;
hold on;

% Отметка времени переходного процесса
plot([actual_t_n, actual_t_n], [0, 1], 'r--', 'LineWidth', 1.5);
plot([0, t(end)], [1, 1], 'k--');
plot([0, t(end)], [0.95, 0.95], 'g:');
plot([0, t(end)], [1.05, 1.05], 'g:');

title(['Переходная характеристика (Бином Ньютона, n=2, \omega_0 = ', num2str(omega_0), ')']);
xlabel('Время, с');
ylabel('y_M(t)');
legend('y_M(t)', ['t_n = ', num2str(actual_t_n, '%.2f'), ' c'], ...
       'Установившееся значение', 'Зона ±5%', 'Location', 'southeast');

