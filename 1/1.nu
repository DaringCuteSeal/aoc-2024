#!/bin/env nu

let data = open input | parse '{a}   {b}'
let a = $data | get 'a' | sort
let b = $data | get 'b' | sort
mut total = 0;
for x in 0..(($data | length) - 1) {
	$total += ($a | get $x | into int) - ($b | get $x | into int) | math abs
}
print $total
