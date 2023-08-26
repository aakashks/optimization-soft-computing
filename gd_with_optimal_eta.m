% Initialize values
x = 9;
y = -8;

% create lambda (anonymous) function representing the quadratic
f = @(x, y) 1 / 2 * x.^2 + 5 / 2 * y.^2;

% vector to store the path of descent
path = [x, y, f(x, y)];

% gradient descent with optimal eta
for t = 1:10
    eta = (x^2 + 25 * y^2) / (x^2 + 125 * y^2);
    x = x - eta * x;
    y = y - eta * 5 * y;
    path = [path; x, y, f(x, y)];
end

disp('reslut of gradient descent :');
disp([x, y]);

% create grid for graph
[X, Y] = ndgrid(linspace(-10, 10, 200));
Z = f(X, Y);

% Plot the surface graph with GD path
figure(1);
surfc(X, Y, Z), shading interp, alpha(0.5)
hold on;
plot3(path(:, 1),path(:, 2),path(:, 3),'ro-','Linewidth',2)
hold off;
