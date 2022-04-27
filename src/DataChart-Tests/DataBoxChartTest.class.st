"
A DataBoxChartTest is a test class for testing the behavior of DataBoxChart
"
Class {
	#name : #DataBoxChartTest,
	#superclass : #TestCase,
	#category : #'DataChart-Tests-Kind'
}

{ #category : #tests }
DataBoxChartTest >> testAddData [
	| aDictionary barChart |
	aDictionary := (Dictionary new ).
	aDictionary addAll:  { #(17 23 25 14 16 20). { 12. 13. 45. 60. 30. 50} }.
	barChart := DataBoxChart new addData: aDictionary.
	self assert: barChart data equals: aDictionary.
	barChart chart plots do: [ :each| self assert: each class equals: RSBoxPlot ].
]

{ #category : #tests }
DataBoxChartTest >> testAddOneDataSet [
	| aDictionary barChart |
	aDictionary := (Dictionary new ).
	aDictionary addAll:  { #(17 23 25 14 16 20)}.
	barChart := DataBoxChart new addData: aDictionary.
	barChart chart plots do: [ :each| self assert: each class equals: RSBoxPlot ].
]
