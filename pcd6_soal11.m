% Membaca citra
I = imread('boneka2.png');

% Jika citra berwarna ubah ke grayscale
if size(I,3) == 3
    I = rgb2gray(I);
end

% Parameter filter
d0 = 0.1;
n = 1;

% Fungsi transfer Low Pass
H_lpf = fillrb(I,d0,n);

% Membuat High Pass Filter
H_hpf = 1 - H_lpf;

% Menampilkan fungsi transfer
figure
mesh(fftshift(H_hpf))
colormap(jet)
title('Fungsi Transfer Butterworth High Pass Filter')
xlabel('Frekuensi u')
ylabel('Frekuensi v')
zlabel('Magnitude')
