% Прямоугольный импульс
function y = rect(t, T) 
    for i = 1:length(t)
        if (abs(t(i) / T) <= 1) %(t(i) >= -T) && (t(i) <= T)
            y(i)=1;
        else
            y(i)=0;
        end
    end
