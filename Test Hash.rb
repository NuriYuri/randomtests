def test1
  a={}
  10000.times do |i| a[i]=nil end
  t=Time.new
  1000000.times do a[99999] end
  Time.new-t
end

def test2
  a={}
  10000.times do |i| a[i.to_s.to_sym]=nil end
  t=Time.new
  1000000.times do a[:"99999"] end
  Time.new-t
end

def test3
  a={}
  10000.times do |i| a[i.to_s]=nil end
  t=Time.new
  1000000.times do a["99999"] end
  Time.new-t
end

def test
  f=File.new("Hash test.csv","wb");
  f<<"Fixnum;Symbol;String;\r\n"
  1000.times do |i|
    puts i
	f << "#{test1};#{test2};#{test3};\r\n"
  end
  f.close
end
