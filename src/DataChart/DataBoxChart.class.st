Class {
	#name : #DataBoxChart,
	#superclass : #DataChart,
	#category : #'DataChart-Kind'
}

{ #category : #accessing }
DataBoxChart class >> kind [
	^ 'box'
]

{ #category : #'adding-plots' }
DataBoxChart >> addData: aDictionnary [

	| sortedData |
	self data: aDictionnary.
	sortedData := aDictionnary asArray.
	sortedData do: [ :each | each sorted ].
	self chart addPlot: (self yourPlot y: sortedData)
]

{ #category : #'adding-plots' }
DataBoxChart >> beforeShowing [

]

{ #category : #showing }
DataBoxChart >> yourPlot [
	^ RSBoxPlot new.
]
