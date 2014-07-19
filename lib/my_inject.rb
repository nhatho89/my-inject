class Array
	def my_inject(initial=nil)
		clone = self.dup
		memo = initial || clone.slice!(0)
		clone.each { |element| memo = yield memo, element }
		memo
	end

	def recursive_inject(initial=nil, &block)
		memo = initial || self.slice!(0)
		return memo if self.empty?
		memo = yield(memo, self.slice!(0))
		recursive_inject(memo, &block)
	end
end