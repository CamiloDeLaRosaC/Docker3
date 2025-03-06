#!/usr/bin/env ruby

def catalan(n)
    cat = Array.new(n+1, 0)
    cat[0] = 1
    (1..n).each do |i|
      (0...i).each do |j|
        cat[i] += cat[j] * cat[i-j-1]
      end
    end
    cat[n]
  end
  
  def main
    N = 30
    start_time = Time.now
    (0...N).each do |i|
      puts "C(#{i}) = #{catalan(i)}"
    end
    end_time = Time.now
    elapsed_ms = (end_time - start_time) * 1000
    puts "Tiempo de ejecución (en Ruby): %.2f ms" % elapsed_ms
  end
  
  main