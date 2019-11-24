def test_everything

  # basic tests
  expectedValues = [
      [["abc", "abc"], 3],
      [["", ""], 0],
      [["xabc", "abc"], 3],
      [["abc", "xabc"], 3],
      [["abc", "abcx"], 3],
      [["abcx", "abc"], 3],
      [["xabcx", "abc"], 3],
      [["abc", "xabcx"], 3],
      [["xabcx", "xabcx"], 5],
      [["cbaa", "aabc"], 2],
      [["f1uauasf", "1uasf"], 4],
      [["abcabcabcabc", "abc"], 3],
      [["abc", "abcabcabcabcabc"], 3],
      [["abc99helloxxhelworld9ehelloworldxx", "abc1010xhelloworldaa"], 10],
  ]

  expectedValues.each do |testStrings, expectedValue|

    ["lcs", "lcsDP"].each do |function_name|
      s1 = testStrings.first
      s2 = testStrings.last

      result = send(function_name, s1, s2)
      print "#{function_name}(\"#{s1}\", \"#{s2}\") --> #{result}"
      if (result == expectedValue)
        puts " ... PASSED"
      else
        puts " ... FAILED. Expected #{expectedValue} but got #{result}"
        return false
      end
    end
  end


  2.upto(50) do |n|
    0.upto(10)

    # generate random strings of size n
    s1 = SecureRandom.alphanumeric(n)
    s2 = SecureRandom.alphanumeric(n)
    a1 = lcs(s1, s2)
    a2 = lcsDP(s1, s2)

    print "Testing length #{n} s1: \"#{s1}\", s2: \"#{s2}\" ..."
    if (a1 == a2)
      puts " PASSED"
    else
      puts " FAILED. lcs() returned #{a1} and lcsDP() returned #{a2}. "
      return false
    end
  end
  return true

end
