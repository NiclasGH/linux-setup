
# Managed by script. 
# Please keep this in sync using pull.sh before and push after making changes

function up() {
	levels=$1

	while [ "$levels" -gt "0" ]; do
		cd ..
		levels=$(($levels - 1))
	done
}

# Rust
## Cargo watch install
function cwi() {
	cargo watch -x "install --path ."
}

## Cargo watch example
function cwe() {
	if [[ $# -eq 1 ]]; then
		cargo watch -q -c -x "run -q -example '$1'"
	else
		echo "Please give exactly 1 Parameter"
	fi
}

## Cargo watch test
## cwt | all tests
## cwt test_fn | specific named tests
## cwt test_file test_fn | specifid test in specifid file
function cwt() {
	if [[ $# -eq 1 ]]; then
		cargo watch -q -c -x "test '$1' -- --nocapture"
	elif [[ $# -eq 2 ]]; then
		cargo watch -q -c -x "test --test '$1' '$2' -- --nocapture"
	else
		cargo watch -q -c -x "test -- --nocapture"
	fi
}
