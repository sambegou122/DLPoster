"
A DataHistogramChartTest is a test class for testing the behavior of DataHistogramChart
"
Class {
	#name : #DataHistogramChartTest,
	#superclass : #TestCase,
	#category : #'DataChart-Tests-Kind'
}

{ #category : #tests }
DataHistogramChartTest >> testAddAll [
	| data barChart |
	self skip.
	data := { #(17 23 25 14 16 20). { 12. 13. 45. 60. 30. 50} .#(1 3 25 1 6 20) . #(7 21 53 41 7 0). #(1 2 3 23 16 20) }.
	barChart := DataHistogramChart new.
	barChart  addAll: data.
	self assert: barChart chart plots class equals: OrderedCollection.
	barChart chart plots do: [ :each| self assert: each class equals: RSHistogramPlot ].

]

{ #category : #tests }
DataHistogramChartTest >> testAddData [
	| aDictionary barChart |
	self skip.
	aDictionary := (Dictionary new ).
	aDictionary addAll:  { #(17 23 25 14 16 20). { 12. 13. 45. 60. 30. 50} }.
	barChart := DataHistogramChart new addData: aDictionary.
	self assert: barChart data equals: aDictionary.
	barChart chart plots do: [ :each| self assert: each class equals: RSHistogramPlot ].
]
