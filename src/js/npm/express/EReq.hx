package js.npm.express;

extern class EReq {
	public var query:Dynamic;
	public var path:String;
	public var host:String;
	public var hostname:String;
	public var url:String;
	public var secure:Bool;
	public var body:Dynamic;
	public var params:Dynamic;
	public var headers:Dynamic;
	public var cookies:Dynamic;
	public function get(name:String):String;
	@:overload(function(methods:Array<String>):String {})
	public function accepts(method:String):String;
}
