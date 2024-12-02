#!/bin/env nu
# Day 2, part 1

def check-diff-validity [diff: int, original_sign: bool] {
	if ($diff > 0) != $original_sign {
		return false
	} else if $diff == 0 {
		return false
	} else if ($diff | math abs) > 3 {
		return false
	}
	return true
}

let input = open "input" | lines | each {|line| $line | split row " " | into int}

$input | each { |arr|
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
} | where {|x| $x } | length
