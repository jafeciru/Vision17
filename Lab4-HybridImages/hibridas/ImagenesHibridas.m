clear all; close all; clc
%% Messi-Ronaldo
M = imread('Messi.png');
R = imresize(imread('Ronaldo.png'), [size(M,1) size(M,2)]); % se reescala la imagen al tamaño de la imagen de altas frecuencias.
%Matriz de traslacion para la imagen de ronaldo
trasl = zeros(21,21);
trasl(21,11) = 1/2; trasl(11,16) = 1/2;
%Convolucion para la traslacion.
R(:,:,1) = conv2(R(:,:,1),trasl,'same');
R(:,:,2) = conv2(R(:,:,2),trasl,'same');
R(:,:,3) = conv2(R(:,:,3),trasl,'same');
%filtro gaussiano
h = fspecial('gaussian',20, 15);
%imagen filtrada. Imagen de altas frecuencias
MF = zeros(size(M));
MF(:,:,1) = conv2(M(:,:,1),h,'same');
MF(:,:,2) = conv2(M(:,:,2),h,'same');
MF(:,:,3) = conv2(M(:,:,3),h,'same');
%imagen filtrada. Imagen de bajas frecuencias
RF = zeros(size(R));
RF(:,:,1) = conv2(R(:,:,1),h,'same');
RF(:,:,2) = conv2(R(:,:,2),h,'same');
RF(:,:,3) = conv2(R(:,:,3),h,'same');
MD = M-uint8(MF); % Resta de la imagen original del filtrado. Deja detalles
IH = MD+uint8(RF); %Suma de las dos imagenes
imwrite(IH,'ImagenHibridaMessi.jpg');
% Piramide gaussiana, 4 niveles
IH1 = impyramid(IH,'reduce');
IH2 = impyramid(IH1,'reduce');
IH3 = impyramid(IH2,'reduce');
imshow(IH)
figure
subplot(2,2,1),imshow(IH);
subplot(2,2,2),imshow(IH1);
subplot(2,2,3),imshow(IH2);
subplot(2,2,4),imshow(IH3);
%% Tigre - Gato
%Se lleva a cabo el mismo procedimiento que con la imagen anterior. 
G = imread('gatoModificado.jpg');
T = imread('tigreModificado.jpg');
G = imresize(G, [size(T,1) size(T,2)]);
h = fspecial('gaussian',20, 18);
TF = zeros(size(T));
TF(:,:,1) = conv2(T(:,:,1),h,'same');
TF(:,:,2) = conv2(T(:,:,2),h,'same');
TF(:,:,3) = conv2(T(:,:,3),h,'same');
GF = zeros(size(G));
GF(:,:,1) = conv2(G(:,:,1),h,'same');
GF(:,:,2) = conv2(G(:,:,2),h,'same');
GF(:,:,3) = conv2(G(:,:,3),h,'same');
TD = T-uint8(TF);
IHG = TD+uint8(GF);
imwrite(IHG,'ImagenHibridaMessi.jpg');
figure
imshow(IHG)
IHG1 = impyramid(IHG,'reduce');
IHG2 = impyramid(IHG1,'reduce');
IHG3 = impyramid(IHG2,'reduce');
figure
subplot(2,2,1),imshow(IHG);
subplot(2,2,2),imshow(IHG1);
subplot(2,2,3),imshow(IHG2);
subplot(2,2,4),imshow(IHG3);
imwrite(IH,'ImagenHibridaGato.jpg');