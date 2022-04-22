"
A DataHistogramChartTest is a test class for testing the behavior of DataHistogramChart
"
Class {
	#name : #DataHistogramChartTest,
	#superclass : #TestCase,
	#category : #'Data-Layout-Tests-Data-Layout'
}

{ #category : #tests }
DataHistogramChartTest >> testAddData [
	| aDictionary barChart |
	aDictionary := (Dictionary new ).
	aDictionary addAll:  { #(17 23 25 14 16 20). { 12. 13. 45. 60. 30. 50} }.
	barChart := DataHistogramChart new addData: aDictionary.
	self assert: barChart data equals: aDictionary.
	self assert: barChart chart plots class equals: OrderedCollection.
	barChart chart plots do: [ :each| self assert: each class equals: RSHistogramPlot ].
	barChart chart plots do: [ :each| self assert: each xValues equals: #(17 23 25 14 16 20) ].
	barChart chart plots do: [ :each| self assert: each yValues equals: { 12. 13. 45. 60. 30. 50} ].
]
