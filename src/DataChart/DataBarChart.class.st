Class {
	#name : #DataBarChart,
	#superclass : #DataChart,
	#category : #'DataChart-Kind'
}

{ #category : #accessing }
DataBarChart class >> kind [
	^ 'bar'
]

{ #category : #showing }
DataBarChart >> addData: aDictionnary [

	
	| y |
	self data: aDictionnary.
	y := self data at:2.
	 self chart addPlot: (self yourPlot y: y).
]

{ #category : #showing }
DataBarChart >> beforeShowing [
]

{ #category : #showing }
DataBarChart >> yourPlot [
	^ RSBarPlot new.
]
