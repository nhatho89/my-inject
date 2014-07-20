require 'my_inject'

describe Array do
	context 'my_inject' do
		it 'can sum a number without an initial value' do
			expect([1,2,3].my_inject{ |memo, value| memo += value }).to eq 6
		end

		it 'can sum a number with an initial value' do
			expect([1,2,3].my_inject(1){ |memo, value| memo += value }).to eq 7
		end

		it 'can multiple numbers' do
			expect([1,2,3].my_inject(&:*)).to eq 6
		end

		it 'can multiple numbers with an initial value' do
			expect([1,2,3].my_inject(5,&:*)).to eq 30
		end

		it 'can subtract numbers' do
			expect([1,2,3].my_inject(&:-)).to eq -4
		end

		it 'can subtract numbers with an initial value' do
			expect([1,2,3].my_inject(9,&:-)).to eq 3
		end

		it 'can divide numbers' do
			expect([100,2,2].my_inject(&:/)).to eq 25
		end

		it 'can divide numbers with an initial value' do
			expect([100,2,2].my_inject(10000,&:/)).to eq 25
		end

		it 'can find the longest word in an array of strings' do
			words = %w{ cat sheep bear }
			expect(words.my_inject{ |memo, word| memo.length > word.length ? memo : word }).to eq 'sheep'
		end

		it 'can convert a 2D Array into a Hash' do
			array = [['A', 'a'], ['B', 'b'], ['C', 'c']]
			hash = array.my_inject({}) do |memo, values|
			  memo[values.first] = values.last
			  memo
			end
			expect(hash).to eq({'A' => 'a', 'B' => 'b', 'C' => 'c' })
		end

		it 'the orginal array is still the same' do
			original = [1,2,3,4]
			original.my_inject(&:+)
			expect(original).to eq [1,2,3,4]
		end
	end

	context 'recusive_inject' do
		it 'can sum a number without an initial value' do
			expect([1,2,3].recursive_inject{ |memo, value| memo += value }).to eq 6
		end

		it 'can sum a number with an initial value' do
			expect([1,2,3].recursive_inject(1){ |memo, value| memo += value }).to eq 7
		end

		it 'can multiple numbers' do
			expect([1,2,3].recursive_inject(&:*)).to eq 6
		end

		it 'can multiple numbers with an initial value' do
			expect([1,2,3].recursive_inject(5,&:*)).to eq 30
		end

		it 'can subtract numbers' do
			expect([1,2,3].recursive_inject(&:-)).to eq -4
		end

		it 'can subtract numbers with an initial value' do
			expect([1,2,3].recursive_inject(9,&:-)).to eq 3
		end

		it 'can divide numbers' do
			expect([100,2,2].recursive_inject(&:/)).to eq 25
		end

		it 'can divide numbers with an initial value' do
			expect([100,2,2].recursive_inject(10000,&:/)).to eq 25
		end

		it 'can find the longest word in an array of strings' do
			words = %w{ cat sheep bear }
			expect(words.recursive_inject{ |memo, word| memo.length > word.length ? memo : word }).to eq 'sheep'
		end

		it 'can convert a 2D Array into a Hash' do
			array = [['A', 'a'], ['B', 'b'], ['C', 'c']]
			hash = array.recursive_inject({}) do |memo, values|
			  memo[values.first] = values.last
			  memo
			end
			expect(hash).to eq({'A' => 'a', 'B' => 'b', 'C' => 'c' })
		end

	end
end