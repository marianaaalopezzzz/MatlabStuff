% Parámetros
m1 = 1;      % masa de la bola 1
m2 = 1;      % masa de la bola 2 
v1 = 3;      % velocidad inicial de la bola 1
v2 = -2;     % velocidad inicial de la bola 2
x1 = -8;     % posición inicial de la bola 1
x2 = 8;      % posición inicial de la bola 2
radio = 1;   % radio de las bolas
dt = 0.05;   % paso de tiempo
limite = 10; % límites del área de simulación (de -10 a 10)

% Configuración de la ventana de animación
figure;
axis([-limite limite -limite/2 limite/2]); % ajustar los límites en y para simetría
axis equal; % mantener la relación de aspecto igual para que las bolas sean circulares
hold on;

% Crear las bolas
bola1 = rectangle('Position', [x1 - radio, -radio, 2 * radio, 2 * radio], ...
    'Curvature', [1, 1], 'FaceColor', 'b');
bola2 = rectangle('Position', [x2 - radio, -radio, 2 * radio, 2 * radio], ...
    'Curvature', [1, 1], 'FaceColor', 'r');

% Animación
while true
    % Actualizar posiciones
    x1 = x1 + v1 * dt;
    x2 = x2 + v2 * dt;
    
    % Detección de colisiones con los límites
    if x1 - radio < -limite || x1 + radio > limite
        v1 = -v1;
    end
    if x2 - radio < -limite || x2 + radio > limite
        v2 = -v2;
    end
    
    % Detección y manejo de colisión entre las dos bolas
    if abs(x1 - x2) < 2 * radio
        % Cálculo de velocidades después de la colisión elástica
        v1_final = ((m1 - m2) * v1 + 2 * m2 * v2) / (m1 + m2);
        v2_final = ((m2 - m1) * v2 + 2 * m1 * v1) / (m1 + m2);
        
        % Asignar las velocidades finales
        v1 = v1_final;
        v2 = v2_final;
    end
    
    % Actualizar posiciones gráficamente
    bola1.Position = [x1 - radio, -radio, 2 * radio, 2 * radio];
    bola2.Position = [x2 - radio, -radio, 2 * radio, 2 * radio];
    
    % Pausar para animación
    pause(dt);
end
