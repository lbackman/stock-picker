# stock-picker
The stock picker takes in an array of values (integers) and returns an array
with the indices of the values that have the greatest "profit"

Examples:

stock_picker([3, 2, 2, 1, 2, 5, 3, 4, 2])
=> [3, 5], profit: $5 - $1 = $4

stock_picker([6, 2, 4, 1])
=> [1, 2], profit: $4 - $2 = $2

stock_picker([4, 2, 1])
=> [], do not buy.