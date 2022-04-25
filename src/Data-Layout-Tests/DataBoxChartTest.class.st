"
A DataBoxChartTest is a test class for testing the behavior of DataBoxChart
"
Class {
	#name : #DataBoxChartTest,
	#superclass : #TestCase,
	#category : #'Data-Layout-Tests-Data-Layout'
}

{ #category : #tests }
DataBoxChartTest >> testAddData [
	| aDictionary barChart |
	aDictionary := (Dictionary new ).
	aDictionary addAll:  { #(17 23 25 14 16 20). { 12. 13. 45. 60. 30. 50} }.
	barChart := DataBoxChart new addData: aDictionary.
	self assert: barChart data equals: aDictionary.
	barChart chart plots do: [ :each| self assert: each class equals: RSBoxPlot ].
	barChart chart plots do: [ :each| self assert: each xValues equals: #(#(17 23 25 14 16 20))].
	barChart chart plots do: [ :each| self assert: each yValues equals: #(#(12 13 45 60 30 50))]
]

{ #category : #tests }
DataBoxChartTest >> testAddOneDataSet [
	| aDictionary barChart |
	aDictionary := (Dictionary new ).
	aDictionary addAll:  { #(17 23 25 14 16 20)}.
	barChart := DataBoxChart new addData: aDictionary.
	barChart chart plots do: [ :each| self assert: each class equals: RSBoxPlot ].
	barChart chart plots do: [ :each| self assert: each yValues equals: #(#(17 14 16  20 23 25))]
]
