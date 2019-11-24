require 'set'
require 'pry'

def lcs(s1, s2)

  l1 = s1.length
  l2 = s2.length
  lcsLength = 0

  0.upto(l1) do |i|
    0.upto(l2) do |j|
      k = 0
      c1 = s1[i+k]
      c2 = s2[j+k]
      while !(c1.nil? || c2.nil?)
        c1 = s1[i+k]
        c2 = s2[j+k]

        if (k > lcsLength)
          lcsLength = k
        end

        break if c1 != c2

        k += 1
      end
    end
  end


  lcsLength
end

def lcsDP(s1, s2)
  l = Array.new(s1.length) { Array.new(s2.length, 0) }
  z = 0

  0.upto(s1.length-1) do |i|
    0.upto(s2.length-1) do |j|
      if s1[i] == s2[j]
        if i == 0 || j == 0
          l[i][j] = 1
        else
          l[i][j] = l[i-1][j-1] + 1
        end

        z = l[i][j] if l[i][j] > z
      else
        l[i][j] = 0
      end
    end
  end

  z
end

