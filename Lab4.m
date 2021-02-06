clc
set(0,'DefaultFigureWindowStyle','docked')

iterations = 10000;

maxx = 100;
maxy = 100;
B = zeros (maxx,maxy);

% set first edge to 1
for side = 1:maxy
    B (1,side) = 1;
end
temp = B;

for iter = 1:iterations
    % i = 2:max-1 doesn't modify the sides
    for x = 2:maxx-1
        for y = 2:maxy-1
            temp (x,y) = (B(x-1,y)+B(x+1,y)+B(x,y-1)+B(x,y+1))./4;
        end
    end
    B = temp;
    if (mod(iter,25) == 0)
        surf (B')
        pause (0.001)
    end
end