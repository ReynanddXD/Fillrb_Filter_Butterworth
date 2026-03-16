function H = fillrb(I, d0, n)
% FILLRB Membuat fungsi transfer Butterworth Low Pass Filter
%
% Masukan:
% I  - matriks citra
% d0 - frekuensi ambang
% n  - orde filter
%
% Keluaran:
% H  - fungsi transfer filter Butterworth

I = double(I);
[a, b] = size(I); % ukuran citra

% menentukan ukuran untuk zero padding
r = nextpow2(2 * max(a, b));
p = 2^r;
q = p;

% menentukan jangkauan frekuensi
u = 0:(p - 1);
v = 0:(q - 1);

% menyesuaikan indeks
idx = find(u > q/2);
u(idx) = u(idx) - q;

idy = find(v > p/2);
v(idy) = v(idy) - p;

% membuat meshgrid
[V, U] = meshgrid(v, u);

% menghitung jarak frekuensi
D = sqrt(V.^2 + U.^2);

% menentukan orde default
if nargin == 2
    n = 1;
end

% menghitung frekuensi ambang
ambang = d0 * p;

% fungsi transfer Butterworth Low Pass Filter
H = 1 ./ (1 + (D ./ ambang).^(2 * n));

end
