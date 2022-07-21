Class {
	#name : #DCKiviatPlot,
	#superclass : #DCCircularPlot,
	#category : #'DataChart-Core'
}

{ #category : #building }
DCKiviatPlot >> build [
	" this methode build the plot"
	|rowNames rows result|
	result := OrderedCollection new.
	rowNames := self data first.
	rows := self data allButFirst.
	self rowNames: rowNames rows: rows.
]

{ #category : #building }
DCKiviatPlot >> rowNames: rowNames rows: rows [
	
	self kind 
		addRows: rows;
		axisNames: rowNames.
]

{ #category : #showing }
DCKiviatPlot >> show [
	"this methode allow to show the plot in the canvas"
	^ self kind
]
