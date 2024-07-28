function analytic_black_scholes(stock_price::T, strike_price::T,
    volatility::T, risk_free::T, dividend_yield::T, time_to_maturity::T, time::T) where {T<:Real}
    norm = Normal()
    current_time = time_to_maturity - time
    volatility_horizon = volatility * sqrt(current_time)
    d1 = (log(stock_price / strike_price) +
          (risk_free - dividend_yield + (volatility^2) / 2) * current_time) / volatility_horizon
    d2 = d1 - volatility_horizon
    call_price = stock_price * exp(-dividend_yield * current_time) * cdf(norm, d1) -
                 strike_price * exp(-risk_free * current_time) * cdf(norm, d2)
    return call_price
end