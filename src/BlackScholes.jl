function analytic_black_scholes(stock_price::T, strike_price::T,
    volatility::T, risk_free::T, dividend_yield::T, time_to_maturity::T, time::T, option_type::String="call") where {T<:Real}
    norm = Normal()
    current_time = time_to_maturity - time
    volatility_horizon = volatility * sqrt(current_time)
    d1 = (log(stock_price / strike_price) +
          (risk_free - dividend_yield + (volatility^2) / 2) * current_time) / volatility_horizon
    d2 = d1 - volatility_horizon
    if option_type == "call"
        return  stock_price * exp(-dividend_yield * current_time) * cdf(norm, d1) - strike_price * exp(-risk_free * current_time) * cdf(norm, d2)
    elseif option_type == "put"
        return strike_price * exp(-risk_free * current_time) * cdf(norm, -d2) - stock_price * exp(-dividend_yield * current_time) * cdf(norm, -d1)
    else
        error("Invalid option type. Use 'call' or 'put'.")
    end
end