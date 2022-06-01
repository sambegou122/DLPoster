Class {
	#name : #DCLocation,
	#superclass : #RSLocation,
	#instVars : [
		'legend'
	],
	#category : #'DataChart-Decoration'
}

{ #category : #'public - modifiers' }
DCLocation >> inner [
	super inner.
	legend ifNotNil: [ legend targetOnlyBox ] 
]

{ #category : #accessing }
DCLocation >> legend [
	^ legend
]

{ #category : #accessing }
DCLocation >> legend: aDCLegend [ 
	legend := aDCLegend
]
