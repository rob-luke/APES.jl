Using APES

## Li & Stoica fig1
spectral_lines_f = [0.04, 0.05, 0.08, 0.09,    0.16:0.005:0.35]
spectral_lines_p = vec(repmat([pi/4], length(spectral_lines_f)))
spectral_lines_a = [10, 10, 10, 2,   vec(repmat([0.5], length(spectral_lines_f)-4, 1))]

## Simulation properties
N = 128
noise_mean = 0
noise_vari = 1

## Create example signal
z = vec(zeros(N, 1))
n = 1.0:N
for i in 1:length(spectral_lines_f)
    z = z + spectral_lines_a[i] * sin(2 * pi * spectral_lines_f[i] * n + spectral_lines_p[i])
end
srand(1) # For reproducible results
z += sqrt(noise_vari)*randn(size(z))

println("Prime timer")
@time apes(z, spectral_lines_f);
println()
println()

println("Time for 10 runs")
@time for n=1:10; apes(z, 0.0:0.001:0.5); end
