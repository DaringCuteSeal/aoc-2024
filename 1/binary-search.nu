#!/bin/env nu

# Binary search. Returns nothing if not found. If element is found, return its index. Gets the first index of the element if array contains element >1 times.
def op-int-binary-search-start [key: int, arr: list<int>, start: int, end: int] -> int {
	if $start == $end {
		if ($arr | get $start) == $key {
			$start
		} else {
		return
		}
	}

	mut idx = ($start + $end) / 2 | math ceil

	if ($arr | get $idx) == $key {
		if $idx > 0 {
			while $idx > 0 and ($arr | get ($idx - 1)) == $key {
				$idx -= 1
			}
		}
		$idx
	} else if ($arr | get $idx) > $key {
		op-int-binary-search-start $key $arr $start ($idx - 1)
	} else if ($arr | get $idx) < $key {
		op-int-binary-search-start $key $arr $idx $end
	}
}

# Binary search. Returns nothing if not found. If element is found, return its index. Gets the last index of the element if array contains element >1 times.
def op-int-binary-search-end [key: int, arr: list<int>, start: int, end: int] -> int {
	if $start == $end {
		if ($arr | get $start) == $key {
			$start
		} else {
		return
		}
	}

	mut idx = ($start + $end) / 2 | math ceil

	if ($arr | get $idx) == $key {
		if $idx > 0 {
			while $idx < $end and ($arr | get ($idx + 1)) == $key {
				$idx += 1
			}
		}
		$idx
	} else if ($arr | get $idx) > $key {
		op-int-binary-search-end $key $arr $start ($idx - 1)
	} else if ($arr | get $idx) < $key {
		op-int-binary-search-end $key $arr $idx $end
	}
}

def int-binary-search-start [key: int, arr: list<int>] -> int {
	op-int-binary-search-start $key $arr 0 (($arr | length) - 1)
}

def int-binary-search-end [key: int, arr: list<int>] -> int {
	op-int-binary-search-end $key $arr 0 (($arr | length) - 1)
}
