Class {
	#name : #DudeDeveloper,
	#superclass : #MooseEntity,
	#instVars : [
		'name'
	],
	#category : #'SmallDude-TextCleaning'
}

{ #category : #meta }
DudeDeveloper class >> annotation [
	<MSEClass: #Developer super: #MooseEntity>
	<package: #Dude>
]

{ #category : #accessing }
DudeDeveloper >> name [
	^ name
]

{ #category : #accessing }
DudeDeveloper >> name: anObject [
	name := anObject
]
