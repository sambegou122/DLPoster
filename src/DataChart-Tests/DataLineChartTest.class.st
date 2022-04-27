"
A DataLineChartTest is a test class for testing the behavior of DataLineChart
"
Class {
	#name : #DataLineChartTest,
	#superclass : #TestCase,
	#category : #'DataChart-Tests-Kind'
}

{ #category : #tests }
DataLineChartTest >> testAddData [
	| aDictionary barChart |
	aDictionary := (Dictionary new ).
	aDictionary addAll:  { #(17 23 25 14 16 20). { 12. 13. 45. 60. 30. 50} }.
	barChart := DataLineChart new addData: aDictionary.
	self assert: barChart data equals: aDictionary.
	self assert: barChart chart plots class equals: OrderedCollection.
	barChart chart plots do: [ :each| self assert: each class equals: RSLinePlot ].
	barChart chart plots do: [ :each| self assert: each xValues equals: #(17 23 25 14 16 20) ].
	barChart chart plots do: [ :each| self assert: each yValues equals: { 12. 13. 45. 60. 30. 50} ].
]
