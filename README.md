# build_flavor

Flutter package to define different build flavors:
<pre>
DEBUG
RELEASE
PROFILE
TEST
</pre>

## Getting Started
<pre>
BannerFlavor({
    Key key,
    @required this.child,
    this.color = Colors.red,
    this.location = BannerLocation.topStart,
  });
</pre>

Wraps the app widget and will display a banner for each flavor <i>EXCEPT:</i><b> Release</b>

<pre>
enum Flavor {
  Debug,
  Release,
  Profile,
  Test,
}

factory ConfigFlavor({@required flavor, 
@required Map<String, dynamic> variables});
</pre>
Builds a global instance (eg: ConfigFlavor.instance), that can hold variables used by the configuration.

To get a value:
<pre>
dynamic value = ConfigFlavor.instance.variable('Tom');
</pre>
This will return whatever value was mapped to the key 'Tom'.

<i>
This will throw an error if the key(eg 'Tom') was <u>NOT</u> loaded in when ConfigFlavor was first called.
</i>

<pre>
final Flavor flavor = ConfigFlavor.instance.flavor;
</pre>
Returns the active run flavor.

## Conclusion

Be kind to each other.