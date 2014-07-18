class Array
	def my_inject(initial=nil)
		memo = initial || self.slice!(0)
		self.each do |element|
			memo = yield memo, element
		end
		memo
	end

	def recursive_inject(initial=nil, &blk)
		memo = initial || self.slice!(0)
		return memo if self.empty?
		memo = blk.call(memo, slice!(0))
		self.recursive_inject(memo, &blk)
	end
end