http://stackoverflow.com/questions/24233873/mkannotation-swift

http://stackoverflow.com/questions/978897/how-to-trigger-mkannotationviews-callout-view-without-touching-the-pin
calloutAccessoryControlTapped

http://stackoverflow.com/questions/14046972/how-can-i-add-a-disclosure-button-to-a-mkannotation

http://stackoverflow.com/questions/6941199/how-to-get-click-event-from-a-button-added-over-mkannotationview



https://developer.apple.com/library/ios/documentation/MapKit/Reference/MKAnnotationView_Class/index.html#//apple_ref/occ/cl/MKAnnotationView

http://stackoverflow.com/questions/17772108/custom-mkannotation-callout-bubble-with-button

http://stackoverflow.com/questions/1565828/how-to-customize-the-callout-bubble-for-mkannotationview

http://stackoverflow.com/questions/4094325/customizing-the-mkannotation-callout-bubble






map grid only

https://discussions.apple.com/thread/4652223?start=0&tstart=0
https://discussions.apple.com/thread/7086613?start=0&tstart=0

reset by holding power and home for 10 seconds

-----------------------------


map constraints and layout

https://www.raywenderlich.com/113768/adaptive-layout-tutorial-in-ios-9-getting-started

https://www.weheartswift.com/auto-layout-101/

http://stackoverflow.com/questions/27197799/xcode-6-how-to-make-an-image-view-fill-the-screen-on-all-devices-auto-layout-n

---------------------------------------------

multiple annotations

http://mhorga.org/2015/08/01/introduction-to-mapkit.html
---------------------------------------------

pincolor

use subclass

http://stackoverflow.com/questions/33532883/add-different-pin-color-with-mapkit-in-swift-2-1

---------------------------------------------

realm + swift

https://www.raywenderlich.com/112544/realm-tutorial-getting-started
http://www.appcoda.com/foursquare-realm-swift/


https://realm.io/news/building-an-ios-clustered-map-view-in-objective-c/


select annotation
--------------------

http://stackoverflow.com/questions/2417952/multiple-annotation-callouts-displaying-in-mkmapview

THE CLEAN WAY I WOULD DO IT : (not tested myself however)

don't rely on the selection mechanism of the MKMapView
subclass the MKAnnotationView to implement a custom one
do the customization in such a way that the callout is part of the annotation view so that you can display several of them.




crowded places and grouping annotations
---------------------------------------

"The only way to eliminate annotation overcrowding is to remove some of the annotation objects from the map view. This typically involves implementing the mapView:regionWillChangeAnimated: and mapView:regionDidChangeAnimated: methods to detect changes in the map zoom level. During a zoom change, you can add or remove annotations as needed based on their proximity to one another. You might also consider other criteria (such as the user’s current location) to eliminate some annotations."

http://five.agency/having-fun-with-ios-map-kit-grouping-annotations/
https://robots.thoughtbot.com/how-to-handle-large-amounts-of-data-on-maps
http://stackoverflow.com/questions/7801015/iphone-mkmapview-annotation-clustering
https://github.com/yinkou/OCMapView
https://github.com/choefele/CCHMapClusterController
https://infinum.co/the-capsized-eight/articles/a-blazingly-fast-open-source-algorithm-for-poi-clustering-on-ios


zoom for pins to fit the view -

http://stackoverflow.com/questions/4680649/zooming-mkmapview-to-fit-annotation-pins





https://www.raywenderlich.com/87008/overlay-views-mapkit-swift-tutorial





simple intro (third one has gesture)
------------------------------------

http://martianwabbit.com/2014/07/29/using-mapkit-with-swift.html
http://www.ioscreator.com/tutorials/mapkit-tutorial-swift-ios8
http://www.myswiftjourney.me/2014/10/23/using-mapkit-mkmapview-how-to-create-a-annotation/


location permission
-------------------
http://www.techotopia.com/index.php/Working_with_Maps_on_iOS_8_with_Swift,_MapKit_and_the_MKMapView_Class

search a place
---------------

http://sweettutos.com/2015/04/24/swift-mapkit-tutorial-series-how-to-search-a-place-address-or-poi-in-the-map/


using JSON
-----------
https://github.com/lingoer/SwiftyJSON

callout
-------

https://developer.apple.com/library/ios/samplecode/MapCallouts/Introduction/Intro.html#//apple_ref/doc/uid/DTS40009746


-------------------------

n an iOS app, it’s good practice to use the mapView:annotationView:calloutAccessoryControlTapped: delegate method to respond when users tap a callout view’s control (as long as the control is a descendant of UIControl). In your implementation of this method you can discover the identity of the callout view’s annotation view so that you know which annotation the user tapped. In a Mac app, the callout view’s view controller can implement an action method that responds when a user clicks the control in a callout view.

When you use a custom view instead of a standard callout, you need to do extra work to make sure your callout shows and hides appropriately when users interact with it. The steps below outline the process for creating a custom callout that contains a button:

Design an NSView or UIView subclass that represents the custom callout. It’s likely that the subclass needs to implement the drawRect: method to draw your custom content.
Create a view controller that initializes the callout view and performs the action related to the button.
In the annotation view, implement hitTest: to respond to hits that are outside the annotation view’s bounds but inside the callout view’s bounds, as shown in Listing 6-7.
In the annotation view, implement setSelected:animated: to add your callout view as a subview of the annotation view when the user clicks or taps it. If the callout view is already visible when the user selects it, the setSelected: method should remove the callout subview from the annotation view (see Listing 6-8).
In the annotation view’s initWithAnnotation: method, set the canShowCallout property to NO to prevent the map from displaying the standard callout when the user selects the annotation.
Listing 6-7 shows an example of implementing hitTest: to handle hits in the callout view that might be outside the bounds of the annotation view.

-------------------------


https://github.com/robertmryan/CustomMapViewAnnotationCalloutSwift
https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/LocationAwarenessPG/AnnotatingMaps/AnnotatingMaps.html

http://stackoverflow.com/questions/28066623/customise-ios8-callout-bubble-swift

http://stackoverflow.com/questions/30527954/swift-custom-callout-for-mkmapview


http://stackoverflow.com/questions/31738082/map-kit-custom-popupview-instead-of-callout-bubble-view-ios-swift






http://stackoverflow.com/questions/15292318/mkmapview-mkpointannotation-tap-event
---------------------------------------------

There are two ways of detecting user interaction with your annotation view. The common technique is to define a callout (that standard little popover bubble that you see when you tap on a pin in a typical maps app) for your MKAnnotationView. And you create the annotation view for your annotation in the standard viewForAnnotation method:

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;

    MKAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"loc"];
    annotationView.canShowCallout = YES;
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];

    return annotationView;
}
By doing this, you get a callout, but you're adding an right accessory, which is, in my example above, a disclosure indicator. That way, they tap on your annotation view (in my example above, a pin on the map), they see the callout, and when they tap on that callout's right accessory (the little disclosure indicator in this example), your calloutAccessoryControlTapped is called (in my example below, performing a segue to some detail view controller):

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    [self performSegueWithIdentifier:@"DetailsIphone" sender:view];
}
That's a very typical user experience on the small iPhone screen.

But, if you don't like that UX and you don't want the standard callout, but rather you want something else to happen, you can define your MKAnnotationView so that a callout is not shown, but instead you intercept it and do something else (for example, on iPad maps apps, you might show some more sophisticated popover rather than the standard callout). For example, you could have your MKAnnotationView not show a callout:

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;

    MKAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"loc"];
    annotationView.canShowCallout = NO;

    return annotationView;
}
But you can then manually handle didSelectAnnotationView to detect when a user tapped on your MKAnnotationView, in this example showing a popover:

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    [mapView deselectAnnotation:view.annotation animated:YES];

    DetailsViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsPopover"];
    controller.annotation = view.annotation;
    self.popover = [[UIPopoverController alloc] initWithContentViewController:controller];
    self.popover.delegate = self;

---------------------------------------------

http://yuluer.com/page/ciaceiae-swift-can-not-select-annotation-in-code.shtml
http://stackoverflow.com/questions/30063986/swift-directions-to-selected-annotation-from-current-location-in-maps
http://stackoverflow.com/questions/22075292/select-a-map-annotation-from-array-programatically

