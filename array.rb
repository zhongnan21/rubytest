a = [1, 'abc', 3.14]
puts a
a[0] = nil
puts a

b = %w{zhong nan from china}
puts b.class

c = {
    "leon" => "liming",
    "andy" => "liudehua",
    "jack" => "zhangxueyou",
    "jeff" => "guofucheng"
}
puts c.class
c["leslie"] = "zhangguorong"
puts c
c["leon"] = 'leiming'
puts c
puts c['asdf']
histogram = Hash.new(0)
puts histogram
puts histogram['key1']
puts histogram['key2']
histogram['key1'] = histogram['key1'] + 1
puts histogram['key1']

def find_repetation1(arr)
  repetitions = []
  arr.each_with_index do |obj, i|
    for j in (i + 1)..arr.size
      if arr[i] == arr[j]
        repetitions << arr[i]
      end
    end
  end
  puts repetitions
end

def find_repetation2(arr)
  hash = {}
  arr.each {|obj| hash[obj].nil?? hash[obj] = 1 : hash[obj] = hash[obj] + 1 }
  hash.map {|m| puts m[0] if m[1] > 1}
end

arr1 = ["aaa", "eee", "fff", "hhh", "aaa", "www", "kkk", "kkk"]
find_repetation1 arr1
find_repetation2 arr1