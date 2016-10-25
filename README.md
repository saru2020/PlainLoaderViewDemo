PlainLoaderViewDemo
===============
Demonstrates the PlainLoaderView Animations that reflects the <a href="https://itunes.apple.com/in/app/fontli/id506650372?mt=8">Fontli App's</a> Splash screen loading view animation.

<br>
There is also a writeup on the <a href="">Imaginea blog</a>.

![PlainLoaderViewDemo]()

<br>

<b>Installation :</b><br/>

	(i) Import "PlainLoaderView.swift" file into your project.
	(ii) NO Other step, jump to setting it up in your controller.
	
<br/>
<b>Usage :</b>

On Your UIViewController's UI setup method, add these lines:<br/>
<b>Initialization:</b><br/>
```swift	
	var loader = PlainLoaderView(frame: self.view.frame)
	self.view.addSubview(loader)
```

<b>To set the animation duration:</b><br/>
```swift	
	loader.animationDuration = 10.0 // Defaults to 4.0
```


<b>To change the loader view’s background & animation stroke colors respectively using these 2 lines of code:</b><br/>
```swift	
	loader.backgroundColor = UIColor.gray // Defaults to clear/no-color
	loader.loaderStrokeColor = UIColor.orange // Defaults to clear/no-color
```


<b>Finally add this line of code to start the animation:</b><br/>
```swift	
	loader.startAnimation()
```

<b>Progressive Animation:</b><br/>
If you’re downloading a series of files and in need to animate in chunks to show the progress, then calculate the percentage and inform the loader on the same.<br/>
For Example, say you want to download ‘imagesCount’ number of images from the server and you’re saving those images into ‘imagesArray’ Array, then this is how you should calculate the percentage:<br/>
```swift	
        let percentage = ( (imagesCount - imagesArray.count) / imagesCount )
```
And assign it to the PlainLoaderView with this line of code:
```swift	
        loadingView.progress = percentage
```

<br/>
<b>Apps Using this Library :</b>

<a href="https://itunes.apple.com/in/app/fontli/id506650372?mt=8">Fontli</a>