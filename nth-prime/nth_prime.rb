class Prime

  def self.nth(num)
    raise ArgumentError, 'There is no zeroth prime' if num == 0
    primes = (2..20).to_a
    primes.map do |x|
      ((x*2)..20).step(x).each{ |y| primes.include?(y) ? primes.delete(y) : next }
    end
    primes.fetch(num - 1)
  end
end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
