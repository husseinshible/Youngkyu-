function [rho] = JB_spectral_2011(T1, T2,param)

T=[0.05 0.08 0.10 0.15 0.20 0.30 0.40 0.50 0.75 1.00 1.50 2.00 2.50 3.00 4.00 5.00];

switch param.mechanism
    case 'kano',        V=Table2Jayaram;
    case 'crustal',     V=Table3Jayaram;
    case {'interface','grid'},   V=Table4Jayaram;
    case 'intraslab',   V=Table5Jayaram;
    case 'normal',      V=Table6Jayaram; 
    case 'oblique',     V=Table7Jayaram;
    case 'reverse',     V=Table8Jayaram;
    case 'strike-slip', V=Table9Jayaram;
end

T_min = min(T1, T2); 
T_max = max(T1, T2); 
[X,Y] = meshgrid(T);
rho   = interp2(X,Y,V,T_min,T_max,'spline');
rho(T_min==T_max)=1;
rho   = min(rho,1);
rho   = max(rho,min(V(:)));
rho(T_min<0.05)=nan;
rho(T_max>5)  =nan;


function Table2=Table2Jayaram()
Table2=[
 1 0.97 0.93 0.91 0.87 0.8 0.72 0.65 0.5 0.39 0.24 0.13 0.07 0.04 0.02 0.08
 0.97 1 0.95 0.89 0.82 0.73 0.65 0.57 0.4 0.3 0.15 0.04 -0.02 -0.04 -0.05 0.01
 0.93 0.95 1 0.92 0.84 0.72 0.64 0.56 0.38 0.28 0.14 0.04 -0.02 -0.03 -0.04 0.02
 0.91 0.89 0.92 1 0.93 0.8 0.7 0.62 0.44 0.34 0.19 0.09 0.02 0.01 0 0.06
 0.87 0.82 0.84 0.93 1 0.89 0.78 0.7 0.52 0.4 0.25 0.14 0.08 0.06 0.04 0.09
 0.8 0.73 0.72 0.8 0.89 1 0.92 0.83 0.64 0.52 0.37 0.25 0.17 0.14 0.12 0.15
 0.72 0.65 0.64 0.7 0.78 0.92 1 0.93 0.76 0.65 0.49 0.38 0.29 0.26 0.21 0.23
 0.65 0.57 0.56 0.62 0.7 0.83 0.93 1 0.86 0.76 0.61 0.5 0.41 0.36 0.3 0.31
 0.5 0.4 0.38 0.44 0.52 0.64 0.76 0.86 1 0.92 0.79 0.69 0.61 0.55 0.45 0.45
 0.39 0.3 0.28 0.34 0.4 0.52 0.65 0.76 0.92 1 0.89 0.79 0.71 0.64 0.54 0.53
 0.24 0.15 0.14 0.19 0.25 0.37 0.49 0.61 0.79 0.89 1 0.92 0.85 0.77 0.66 0.62
 0.13 0.04 0.04 0.09 0.14 0.25 0.38 0.5 0.69 0.79 0.92 1 0.93 0.86 0.75 0.7
 0.07 -0.02 -0.02 0.02 0.08 0.17 0.29 0.41 0.61 0.71 0.85 0.93 1 0.95 0.85 0.78
 0.04 -0.04 -0.03 0.01 0.06 0.14 0.26 0.36 0.55 0.64 0.77 0.86 0.95 1 0.92 0.84
 0.02 -0.05 -0.04 0 0.04 0.12 0.21 0.3 0.45 0.54 0.66 0.75 0.85 0.92 1 0.92
 0.08 0.01 0.02 0.06 0.09 0.15 0.23 0.31 0.45 0.53 0.62 0.7 0.78 0.84 0.92 1];
 
function Table3=Table3Jayaram()
Table3=[
 1 0.96 0.92 0.88 0.84 0.74 0.65 0.56 0.39 0.27 0.1 -0.01 -0.02 0.01 0.02 0.02 
 0.96 1 0.93 0.84 0.76 0.63 0.54 0.44 0.28 0.17 0 -0.11 -0.11 -0.07 -0.05 -0.03
 0.92 0.93 1 0.89 0.78 0.62 0.52 0.42 0.26 0.15 0.01 -0.1 -0.1 -0.05 -0.03 -0.01
 0.88 0.84 0.89 1 0.91 0.72 0.61 0.51 0.34 0.23 0.08 -0.02 -0.04 0 0.02 0.03
 0.84 0.76 0.78 0.91 1 0.84 0.72 0.61 0.42 0.3 0.15 0.06 0.02 0.04 0.06 0.06
 0.74 0.63 0.62 0.72 0.84 1 0.9 0.79 0.58 0.45 0.29 0.18 0.12 0.12 0.12 0.11
 0.65 0.54 0.52 0.61 0.72 0.9 1 0.91 0.73 0.6 0.43 0.32 0.26 0.23 0.21 0.19
 0.56 0.44 0.42 0.51 0.61 0.79 0.91 1 0.85 0.73 0.57 0.45 0.38 0.34 0.29 0.25
 0.39 0.28 0.26 0.34 0.42 0.58 0.73 0.85 1 0.91 0.76 0.66 0.58 0.51 0.44 0.37
 0.27 0.17 0.15 0.23 0.3 0.45 0.6 0.73 0.91 1 0.87 0.77 0.68 0.6 0.51 0.43
 0.1 0 0.01 0.08 0.15 0.29 0.43 0.57 0.76 0.87 1 0.91 0.82 0.72 0.62 0.53
 -0.01 -0.11 -0.1 -0.02 0.06 0.18 0.32 0.45 0.66 0.77 0.91 1 0.92 0.81 0.7 0.6
 -0.02 -0.11 -0.1 -0.04 0.02 0.12 0.26 0.38 0.58 0.68 0.82 0.92 1 0.93 0.81 0.7
 0.01 -0.07 -0.05 0 0.04 0.12 0.23 0.34 0.51 0.6 0.72 0.81 0.93 1 0.91 0.81
 0.02 -0.05 -0.03 0.02 0.06 0.12 0.21 0.29 0.44 0.51 0.62 0.7 0.81 0.91 1 0.92
 0.02 -0.03 -0.01 0.03 0.06 0.11 0.19 0.25 0.37 0.43 0.53 0.6 0.7 0.81 0.92 1];

function Table4=Table4Jayaram()
Table4=[
 1 0.96 0.92 0.9 0.87 0.81 0.75 0.67 0.54 0.45 0.32 0.22 0.15 0.1 0.04 0.03
 0.96 1 0.94 0.87 0.82 0.74 0.67 0.59 0.46 0.36 0.25 0.15 0.09 0.04 -0.01 -0.02
 0.92 0.94 1 0.9 0.83 0.72 0.65 0.57 0.43 0.34 0.23 0.15 0.09 0.05 0 -0.01
 0.9 0.87 0.9 1 0.93 0.79 0.69 0.6 0.46 0.37 0.26 0.17 0.1 0.06 0.01 0
 0.87 0.82 0.83 0.93 1 0.88 0.77 0.66 0.51 0.41 0.28 0.17 0.1 0.07 0.02 0.01
 0.81 0.74 0.72 0.79 0.88 1 0.91 0.8 0.63 0.51 0.37 0.26 0.19 0.14 0.09 0.08
 0.75 0.67 0.65 0.69 0.77 0.91 1 0.92 0.77 0.66 0.51 0.41 0.33 0.27 0.21 0.19
 0.67 0.59 0.57 0.6 0.66 0.8 0.92 1 0.88 0.79 0.63 0.53 0.44 0.38 0.3 0.28
 0.54 0.46 0.43 0.46 0.51 0.63 0.77 0.88 1 0.92 0.79 0.69 0.6 0.53 0.43 0.41
 0.45 0.36 0.34 0.37 0.41 0.51 0.66 0.79 0.92 1 0.88 0.79 0.71 0.64 0.53 0.51
 0.32 0.25 0.23 0.26 0.28 0.37 0.51 0.63 0.79 0.88 1 0.92 0.85 0.78 0.67 0.64
 0.22 0.15 0.15 0.17 0.17 0.26 0.41 0.53 0.69 0.79 0.92 1 0.94 0.88 0.78 0.75
 0.15 0.09 0.09 0.1 0.1 0.19 0.33 0.44 0.6 0.71 0.85 0.94 1 0.96 0.87 0.82
 0.1 0.04 0.05 0.06 0.07 0.14 0.27 0.38 0.53 0.64 0.78 0.88 0.96 1 0.93 0.87
 0.04 -0.01 0 0.01 0.02 0.09 0.21 0.3 0.43 0.53 0.67 0.78 0.87 0.93 1 0.95
 0.03 -0.02 -0.01 0 0.01 0.08 0.19 0.28 0.41 0.51 0.64 0.75 0.82 0.87 0.95 1];

function Table5=Table5Jayaram()
Table5=[ 
 1 0.97 0.94 0.91 0.87 0.79 0.72 0.66 0.44 0.37 0.22 0.09 -0.02 -0.04 0.01 -0.03
 0.97 1 0.95 0.9 0.84 0.75 0.68 0.61 0.39 0.32 0.18 0.05 -0.07 -0.09 -0.03 -0.08
 0.94 0.95 1 0.93 0.86 0.76 0.68 0.62 0.4 0.33 0.18 0.06 -0.05 -0.06 0.01 -0.03
 0.91 0.9 0.93 1 0.95 0.84 0.75 0.69 0.47 0.38 0.23 0.1 0 -0.01 0.05 0.02
 0.87 0.84 0.86 0.95 1 0.91 0.82 0.76 0.54 0.45 0.3 0.16 0.07 0.05 0.1 0.07
 0.79 0.75 0.76 0.84 0.91 1 0.94 0.88 0.69 0.59 0.45 0.31 0.21 0.19 0.21 0.17
 0.72 0.68 0.68 0.75 0.82 0.94 1 0.95 0.78 0.69 0.55 0.41 0.31 0.29 0.29 0.24
 0.66 0.61 0.62 0.69 0.76 0.88 0.95 1 0.86 0.77 0.63 0.49 0.39 0.37 0.36 0.32
 0.44 0.39 0.4 0.47 0.54 0.69 0.78 0.86 1 0.93 0.82 0.7 0.62 0.58 0.5 0.47
 0.37 0.32 0.33 0.38 0.45 0.59 0.69 0.77 0.93 1 0.9 0.8 0.71 0.67 0.58 0.54
 0.22 0.18 0.18 0.23 0.3 0.45 0.55 0.63 0.82 0.9 1 0.93 0.85 0.81 0.68 0.62
 0.09 0.05 0.06 0.1 0.16 0.31 0.41 0.49 0.7 0.8 0.93 1 0.93 0.89 0.77 0.71
 -0.02 -0.07 -0.05 0 0.07 0.21 0.31 0.39 0.62 0.71 0.85 0.93 1 0.97 0.87 0.79
 -0.04 -0.09 -0.06 -0.01 0.05 0.19 0.29 0.37 0.58 0.67 0.81 0.89 0.97 1 0.91 0.84
 0.01 -0.03 0.01 0.05 0.1 0.21 0.29 0.36 0.5 0.58 0.68 0.77 0.87 0.91 1 0.93
 -0.03 -0.08 -0.03 0.02 0.07 0.17 0.24 0.32 0.47 0.54 0.62 0.71 0.79 0.84 0.93 1];

function Table6=Table6Jayaram()
Table6=[
 1 0.97 0.94 0.92 0.87 0.77 0.66 0.58 0.29 0.27 0.13 -0.1 -0.31 -0.37 -0.29 -0.32
 0.97 1 0.95 0.88 0.8 0.69 0.59 0.5 0.23 0.22 0.11 -0.13 -0.34 -0.4 -0.32 -0.35
 0.94 0.95 1 0.91 0.82 0.7 0.59 0.5 0.21 0.19 0.08 -0.14 -0.34 -0.38 -0.3 -0.33
 0.92 0.88 0.91 1 0.92 0.79 0.65 0.57 0.27 0.23 0.11 -0.12 -0.31 -0.35 -0.26 -0.29
 0.87 0.8 0.82 0.92 1 0.87 0.73 0.64 0.34 0.28 0.15 -0.08 -0.24 -0.28 -0.22 -0.24
 0.77 0.69 0.7 0.79 0.87 1 0.91 0.83 0.56 0.47 0.33 0.11 -0.06 -0.11 -0.06 -0.1
 0.66 0.59 0.59 0.65 0.73 0.91 1 0.93 0.68 0.6 0.48 0.26 0.1 0.04 0.07 0.03
 0.58 0.5 0.5 0.57 0.64 0.83 0.93 1 0.78 0.7 0.57 0.37 0.21 0.16 0.2 0.14
 0.29 0.23 0.21 0.27 0.34 0.56 0.68 0.78 1 0.91 0.77 0.64 0.53 0.48 0.46 0.4
 0.27 0.22 0.19 0.23 0.28 0.47 0.6 0.7 0.91 1 0.84 0.7 0.56 0.51 0.5 0.43
 0.13 0.11 0.08 0.11 0.15 0.33 0.48 0.57 0.77 0.84 1 0.87 0.75 0.68 0.62 0.51
 -0.1 -0.13 -0.14 -0.12 -0.08 0.11 0.26 0.37 0.64 0.7 0.87 1 0.92 0.87 0.8 0.7
 -0.31 -0.34 -0.34 -0.31 -0.24 -0.06 0.1 0.21 0.53 0.56 0.75 0.92 1 0.97 0.88 0.81
 -0.37 -0.4 -0.38 -0.35 -0.28 -0.11 0.04 0.16 0.48 0.51 0.68 0.87 0.97 1 0.93 0.88
 -0.29 -0.32 -0.3 -0.26 -0.22 -0.06 0.07 0.2 0.46 0.5 0.62 0.8 0.88 0.93 1 0.94
 -0.32 -0.35 -0.33 -0.29 -0.24 -0.1 0.03 0.14 0.4 0.43 0.51 0.7 0.81 0.88 0.94 1];

function Table7=Table7Jayaram()
Table7=[
 1 0.98 0.95 0.96 0.95 0.94 0.9 0.84 0.66 0.56 0.35 0.16 0.07 0.11 0.11 0.02
 0.98 1 0.97 0.95 0.93 0.9 0.85 0.78 0.6 0.49 0.29 0.1 0.03 0.08 0.08 -0.01
 0.95 0.97 1 0.96 0.92 0.87 0.8 0.73 0.54 0.43 0.24 0.05 -0.03 0.04 0.04 -0.05
 0.96 0.95 0.96 1 0.96 0.9 0.85 0.76 0.58 0.45 0.25 0.07 -0.02 0.03 0.04 -0.04
 0.95 0.93 0.92 0.96 1 0.93 0.87 0.77 0.58 0.47 0.29 0.1 0.03 0.05 0.06 -0.03
 0.94 0.9 0.87 0.9 0.93 1 0.95 0.87 0.68 0.56 0.37 0.17 0.07 0.09 0.11 0.01
 0.9 0.85 0.8 0.85 0.87 0.95 1 0.95 0.78 0.66 0.48 0.28 0.17 0.17 0.18 0.09
 0.84 0.78 0.73 0.76 0.77 0.87 0.95 1 0.88 0.77 0.57 0.37 0.26 0.27 0.26 0.16
 0.66 0.6 0.54 0.58 0.58 0.68 0.78 0.88 1 0.91 0.74 0.57 0.48 0.5 0.45 0.34
 0.56 0.49 0.43 0.45 0.47 0.56 0.66 0.77 0.91 1 0.84 0.69 0.63 0.6 0.53 0.43
 0.35 0.29 0.24 0.25 0.29 0.37 0.48 0.57 0.74 0.84 1 0.89 0.84 0.77 0.71 0.61
 0.16 0.1 0.05 0.07 0.1 0.17 0.28 0.37 0.57 0.69 0.89 1 0.93 0.82 0.77 0.68
 0.07 0.03 -0.03 -0.02 0.03 0.07 0.17 0.26 0.48 0.63 0.84 0.93 1 0.93 0.86 0.78
 0.11 0.08 0.04 0.03 0.05 0.09 0.17 0.27 0.5 0.6 0.77 0.82 0.93 1 0.93 0.83
 0.11 0.08 0.04 0.04 0.06 0.11 0.18 0.26 0.45 0.53 0.71 0.77 0.86 0.93 1 0.93
 0.02 -0.01 -0.05 -0.04 -0.03 0.01 0.09 0.16 0.34 0.43 0.61 0.68 0.78 0.83 0.93 1];

function Table8=Table8Jayaram()
Table8=[
 1 0.96 0.91 0.89 0.85 0.76 0.68 0.6 0.44 0.32 0.18 0.1 0.06 0.05 0.01 0.02
 0.96 1 0.94 0.86 0.79 0.69 0.6 0.51 0.34 0.22 0.09 0.01 -0.03 -0.03 -0.06 -0.06
 0.91 0.94 1 0.9 0.8 0.67 0.59 0.49 0.31 0.19 0.08 0.01 -0.03 -0.02 -0.04 -0.04
 0.89 0.86 0.9 1 0.92 0.76 0.65 0.56 0.37 0.25 0.13 0.06 0.02 0.02 0 -0.01
 0.85 0.79 0.8 0.92 1 0.86 0.75 0.65 0.46 0.33 0.2 0.12 0.07 0.07 0.04 0.02
 0.76 0.69 0.67 0.76 0.86 1 0.91 0.81 0.6 0.47 0.33 0.24 0.18 0.15 0.12 0.09
 0.68 0.6 0.59 0.65 0.75 0.91 1 0.92 0.74 0.62 0.47 0.38 0.31 0.28 0.22 0.19
 0.6 0.51 0.49 0.56 0.65 0.81 0.92 1 0.86 0.75 0.6 0.51 0.43 0.39 0.31 0.28
 0.44 0.34 0.31 0.37 0.46 0.6 0.74 0.86 1 0.92 0.79 0.7 0.62 0.56 0.45 0.41
 0.32 0.22 0.19 0.25 0.33 0.47 0.62 0.75 0.92 1 0.89 0.8 0.73 0.66 0.54 0.5
 0.18 0.09 0.08 0.13 0.2 0.33 0.47 0.6 0.79 0.89 1 0.93 0.86 0.78 0.66 0.6
 0.1 0.01 0.01 0.06 0.12 0.24 0.38 0.51 0.7 0.8 0.93 1 0.94 0.86 0.75 0.69
 0.06 -0.03 -0.03 0.02 0.07 0.18 0.31 0.43 0.62 0.73 0.86 0.94 1 0.95 0.84 0.78
 0.05 -0.03 -0.02 0.02 0.07 0.15 0.28 0.39 0.56 0.66 0.78 0.86 0.95 1 0.91 0.84
 0.01 -0.06 -0.04 0 0.04 0.12 0.22 0.31 0.45 0.54 0.66 0.75 0.84 0.91 1 0.93
 0.02 -0.06 -0.04 -0.01 0.02 0.09 0.19 0.28 0.41 0.5 0.6 0.69 0.78 0.84 0.93 1];

function Table9=Table9Jayaram()
Table9=[
 1 0.94 0.92 0.86 0.76 0.61 0.48 0.31 0.08 -0.04 -0.17 -0.28 -0.31 -0.27 -0.12 -0.06
 0.94 1 0.92 0.8 0.66 0.49 0.36 0.18 -0.02 -0.12 -0.25 -0.36 -0.38 -0.35 -0.18 -0.1
 0.92 0.92 1 0.88 0.73 0.53 0.37 0.2 0.01 -0.1 -0.22 -0.36 -0.38 -0.35 -0.19 -0.12
 0.86 0.8 0.88 1 0.89 0.67 0.51 0.35 0.14 0.02 -0.09 -0.21 -0.25 -0.22 -0.08 -0.01
 0.76 0.66 0.73 0.89 1 0.84 0.67 0.5 0.25 0.1 0 -0.12 -0.17 -0.16 -0.04 0.01
 0.61 0.49 0.53 0.67 0.84 1 0.86 0.7 0.43 0.26 0.15 0.02 -0.02 -0.01 0.08 0.1
 0.48 0.36 0.37 0.51 0.67 0.86 1 0.88 0.61 0.44 0.29 0.17 0.12 0.12 0.17 0.18
 0.31 0.18 0.2 0.35 0.5 0.7 0.88 1 0.78 0.6 0.44 0.33 0.26 0.24 0.23 0.21
 0.08 -0.02 0.01 0.14 0.25 0.43 0.61 0.78 1 0.87 0.71 0.61 0.53 0.5 0.44 0.38
 -0.04 -0.12 -0.1 0.02 0.1 0.26 0.44 0.6 0.87 1 0.85 0.75 0.65 0.61 0.53 0.43
 -0.17 -0.25 -0.22 -0.09 0 0.15 0.29 0.44 0.71 0.85 1 0.9 0.81 0.76 0.67 0.56
 -0.28 -0.36 -0.36 -0.21 -0.12 0.02 0.17 0.33 0.61 0.75 0.9 1 0.93 0.86 0.73 0.6
 -0.31 -0.38 -0.38 -0.25 -0.17 -0.02 0.12 0.26 0.53 0.65 0.81 0.93 1 0.95 0.79 0.65
 -0.27 -0.35 -0.35 -0.22 -0.16 -0.01 0.12 0.24 0.5 0.61 0.76 0.86 0.95 1 0.87 0.74
 -0.12 -0.18 -0.19 -0.08 -0.04 0.08 0.17 0.23 0.44 0.53 0.67 0.73 0.79 0.87 1 0.9
 -0.06 -0.1 -0.12 -0.01 0.01 0.1 0.18 0.21 0.38 0.43 0.56 0.6 0.65 0.74 0.9 1];