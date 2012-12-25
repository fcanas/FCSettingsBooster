# FCSettingsBooster

A head start on implementing a settings view in iOS

`FCSettingsBooster` is a collection of table view cells that interface directly with user preferences stored in `NSUserDefaults`.
Its only benefit over the standard [settings bundle](http://developer.apple.com/library/ios/#DOCUMENTATION/Cocoa/Conceptual/UserDefaults/Preferences/Preferences.html) approch is the ability to use custom views to show values, and custom view controllers to select values for settings.

## Status

The individual components listed as "functional" below are ready for use. 
The architecture and code of a coordinating Settings View Controller is majorly in flux and I suggest nobody use it for the time being.

## Project Roadmap

* Functional
	* Boolean preferences with switches
	* Color Picker using [iOS Color Picker](https://github.com/fcanas/ios-color-picker)
* In Progress
	* -
* Planned
	* Font Picker
	* Easy compatibility with custom cells / preferences
* Under Consideration
	* Button Cell
	* iCloud synchronization – (There are already a few options out there)
	* Preview Cell – Custom cell that can subscribe to certain preference changes
	* Slider Cell
	* StoreKit Enabled cells – *e.g.* remove ads, enable a feature
	
