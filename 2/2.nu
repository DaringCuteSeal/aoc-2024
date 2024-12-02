#!/bin/env nu
# Day 2, part 2

def check-diff-validity [diff: int, original_sign: bool] -> bool {
	if ($diff > 0) != $original_sign {
		return false
	} else if $diff == 0 {
		return false
	} else if ($diff | math abs) > 3 {
		return false
	}
	return true
}

def check-arr [arr: list<int>] -> bool {
	let diff = ($arr.1 - $arr.0)
	let sign = $diff > 0 # positive: true, negative: false
	mut state = true
	if not (check-diff-validity $diff $sign) {
		return false
	}
	for i in 1..(($arr | length) - 2) {
		let diff = ($arr | get (($i) + 1)) - ($arr | get ($i))
		if not (check-diff-validity $diff $sign) {
				return false
		}
	}
	return $state
}

let input = open "input" | lines | each {|line| $line | split row " " | into int}

$input | each { |arr|
	if not (check-arr ($arr)) {
		for i in 0..(($arr | length) - 1) {
			if (check-arr ($arr | drop nth $i)) {
				return true
			}
		}
		return false
	}
	return true
	
} | where {|x| $x } | length
