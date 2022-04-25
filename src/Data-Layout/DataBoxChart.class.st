Class {
	#name : #DataBoxChart,
	#superclass : #DataChart,
	#category : #'Data-Layout'
}

{ #category : #'adding-plots' }
DataBoxChart >> addData: aDictionnary [

	| sortedData |
	self data: aDictionnary.
	sortedData := aDictionnary asArray.
	sortedData do: [ :each | each sorted ].
	self chart addPlot: (self yourPlot y: sortedData)
]

{ #category : #adding }
DataBoxChart >> yourPlot [
	^ RSBoxPlot new.
]
