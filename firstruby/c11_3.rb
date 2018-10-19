require 'monitor'
class C11_3 < Monitor
  attr_reader :counter
  def initialize
    @counter = 0
    super
  end
  def increase
    synchronize do
      @counter += 1
    end
  end

end
# or use MonitorMixin
class Counter
  include MonitorMixin
  attr_reader :counter
  def initialize
    @counter = 0
    super
  end
  def increase
    synchronize do
      @counter += 1
    end
  end

  end
# or use an external monitor
class CounterEx
  attr_reader :counter
  def initialize
    @counter = 0
    super
  end
  def increase
    @counter += 1
  end

end
c1 = C11_3.new
t1 = Thread.new{100000.times{c1.increase}}
t2 = Thread.new{100000.times{c1.increase}}
t1.join;t2.join
puts c1.counter
c2 = Counter.new
t1 = Thread.new{100000.times{c2.increase}}
t2 = Thread.new{100000.times{c2.increase}}
t1.join;t2.join
puts c2.counter
cex = CounterEx.new
lock = Monitor.new
t1 = Thread.new{100000.times{lock.synchronize{cex.increase}}}
t2 = Thread.new{100000.times{lock.synchronize{cex.increase}}}
t1.join;t2.join
puts cex.counter
cex1 = CounterEx.new
lock = Monitor.new
cex1.extend(MonitorMixin)
t1 = Thread.new{100000.times{cex1.synchronize{cex1.increase}}}
t2 = Thread.new{100000.times{cex1.synchronize{cex1.increase}}}
t1.join;t2.join
puts cex1.counter

# Sample code from Programing Ruby, page 137
playlist = []
playlist.extend(MonitorMixin)




