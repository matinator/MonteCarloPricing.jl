using MonteCarloPricing
using Test

@testset "MonteCarloPricing.jl" begin
    # test black scholes analytics
    @test analytic_black_scholes(100.00, 110.00, 0.25, 0.05, 0.02, 0.5, 0.0, "call") ≈ 3.85976
    @test analytic_black_scholes(100.00, 110.00, 0.25, 0.05, 0.02, 0.5, 0.0, "put") ≈ 12.138867
    @test_throws "Invalid option type. Use 'call' or 'put'." analytic_black_scholes(100.00, 110.00, 0.25, 0.05, 0.02, 0.5, 0.0, "")
end
