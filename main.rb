require_relative 'functions'
require_relative 'tests'
require 'securerandom'
require 'benchmark'

MAX_N = 1000
FUNCTIONS = %w(lcs lcsDP)


def benchmark_function(function_name)
  puts "#{function_name}"

  sub_trials = 10

  unless Dir.exists? "output"
    Dir.mkdir "output"
  end


    #f.puts "n\tTime"
    puts "n\tTime"

    prev = 0

    0.upto(MAX_N) do |n|
      sum = 0
      sub_trials.times.map do
        puts "#{n} trial #{function_name}"

        # generate random strings of size n
        s1 = SecureRandom.alphanumeric(n)
        s2 = SecureRandom.alphanumeric(n)

        puts "s1: #{s1} , s2: #{s2}"

        # benchmark the time it takes to perform funciton
        bm = Benchmark.realtime do |b|
          send(function_name, s1, s2)
        end

        sum += bm
      end

      avg = sum / sub_trials

      if prev != 0
        dbl_ratio = avg / prev
        puts "Doubling time: #{dbl_ratio}"
        puts
      end

      File.open("output/" + function_name, 'a') { f.puts("#{n}\t#{avg}\t#{dbl_ratio}") }
      puts("#{n},\t#{avg}\t#{dbl_ratio},")

      prev = avg
    end



end

def main
=begin
  SORTING_FUNCTIONS.each do |function_name|
    benchmark_function(function_name, true)
  end
=end

  FUNCTIONS.each do |func_name|
    puts func_name
    benchmark_function(func_name)
  end

  puts "DONE!"
end


#puts lcs("abc", "abcx")
#puts lcs("abcx", "abc")
#puts lcs("a", "a")
test_everything
#main