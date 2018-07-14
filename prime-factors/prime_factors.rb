class PrimeFactors


  def self.for(number)
    find_primes(number)
  end

  def self.find_primes(number, divisor=2, factors=[])
    while number > 1
      if number % divisor == 0
        factors << divisor
        number /= divisor
      else
        divisor += 1
      end
    end
    factors
  end
end
