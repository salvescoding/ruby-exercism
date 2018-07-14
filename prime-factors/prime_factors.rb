class PrimeFactors


  def self.for(number)
    return [] if number == 1
    array_of_primes = []
    counter = 2
    new_number = number
    while array_of_primes.reduce(:*) != number
      if new_number % counter == 0
        prime = counter
        array_of_primes << prime
        new_number = new_number / counter
      else
          counter += 1
      end
    end
    array_of_primes
  end

end
