function [P, M] = fourier_parts(F)
    F = fftshift(F);
    P = angle(F);
    M = abs(F);
end
