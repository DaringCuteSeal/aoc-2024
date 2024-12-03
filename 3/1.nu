#!/bin/env nu
# Day 3, part 1

open input | parse --regex 'mul\(\s*(?<num1>\w+)\,\s*(?<num2>\w+)\)' | into int num1 num2 | reduce --fold 0 {|item, accumulator|
	$accumulator + ($item.num1 * $item.num2)
}
