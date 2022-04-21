"
A FirstLayoutTest is a test class for testing the behavior of FirstLayout
"
Class {
	#name : #FirstLayoutTest,
	#superclass : #TestCase,
	#category : #'Data-Layout-Tests-Data-layout'
}

{ #category : #tests }
FirstLayoutTest >> testShow [
	| dataLayout |
	dataLayout := FirstLayout new.
	dataLayout addData: (1 to: 30).
	dataLayout layout: RSClusterLayout.
	self assert: dataLayout show class equals: RSCanvas.
]
