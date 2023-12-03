% Function to Maximize (Only Unimodal Function)
f = @(x) 4*sin(x)*(1 + cos(x));

% Plot
fplot(f,[-1,7],'b');
hold on; grid on;
title('Plot of f(x)');
xlabel('x'); ylabel('f(x)');

% Initiation
a = 0;                            
b = pi/2;                           
stop = 0.1;               
gr = double((sqrt(5)-1)/2);  

golden_section_search(f, a, b, stop, gr);

function golden_section_search(f, a, b, stop, gr)
    
    i = 1;
    while (abs(a - b) > stop) 

        x1 = a + gr * (b - a);
        x2 = b - gr * (b - a);
    
        if f(x1) > f(x2)
            a = x2;
        else
            b = x1;
        end

        disp([num2str(i) ': ' num2str(x1) ' , ' num2str(x2)]);
        disp(['   {' num2str(f(x1)) ' , ' num2str(f(x2)) '}']);
        disp(['   [', num2str(a) ' , ' num2str(b) ']']);
        scatter([a, b], [f(a), f(b)], LineWidth=2);

        i = i + 1;
    
    end

    % Choose Maximum point
    if f(x1) > f(x2)
        x_max = x1;
    else
        x_max = x2;
    end

    % Display result
        disp(['Minimum: (', num2str(x_max) ',' num2str(f(x_max)) ')']);
        stem(x_max, f(x_max), LineWidth=2);hold off;
end