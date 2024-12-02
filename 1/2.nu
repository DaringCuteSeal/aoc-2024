#!/bin/env nu

let data = open input | parse '{a}   {b}'
let left = $data | get 'a' | sort | into int
let right = $data | get 'b' | sort | into int

mut sum = 0
mut idx = 0
let end_idx = ($left | length) - 1

while $idx <= $end_idx {
	let curr_num = $left | get $idx 
	let right_idx = op-int-binary-search-start $curr_num $right 0 $end_idx
	if ($right_idx | is-not-empty) { # i am so dead
		let right_idx_end = op-int-binary-search-end $curr_num $right $right_idx $end_idx
		let count = $right_idx_end - $right_idx + 1
		let left_end = op-int-binary-search-end $curr_num $left $idx $end_idx

		let count_left = $left_end - $idx + 1
		let count_right = $right_idx_end - $right_idx + 1

		$sum += $curr_num * $count_left * $count_right
		$idx += $count_left
	} else {
		$idx += 1
	}
}

$sum
