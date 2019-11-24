require_relative 'functions'
require_relative 'tests'
require 'securerandom'
require 'benchmark'

MAX_N = 8192
FUNCTIONS = %w(lcs lcsDP)


def benchmark_function(function_name)
  File.open("output/" + function_name, 'w') { |f| f.truncate(0) }


  puts "#{function_name}"

  sub_trials = 4

  unless Dir.exists? "output"
    Dir.mkdir "output"
  end


    #f.puts "n\tTime"
    puts "n\tTime"

    prev = 0

    n = 1
    while (n < MAX_N)
      puts "Trial #{n}"
      sum = 0
      sub_trials.times.map do
        print "."

        # generate random strings of size n
        s1 = SecureRandom.alphanumeric(n)
        s2 = SecureRandom.alphanumeric(n)

        # benchmark the time it takes to perform funciton
        bm = Benchmark.realtime do |b|
          send(function_name, s1, s2)
        end

        sum += bm
      end
      puts

      avg = sum / sub_trials

      if prev != 0
        dbl_ratio = avg / prev
        #puts "Doubling time: #{dbl_ratio}"
        #puts
      end

      File.open("output/" + function_name, 'a') { |f| f.puts("#{n}\t#{avg}\t#{dbl_ratio}") }
      #puts("#{n},\t#{avg}\t#{dbl_ratio},")

      prev = avg

      n *= 2
    end



end

def main

  FUNCTIONS.each do |func_name|
    puts func_name
    benchmark_function(func_name)
  end

  puts "DONE!"
end


test_everything
main