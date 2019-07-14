package js.npm.express;

extern class EResp {
	public var headersSent:Bool;
	public function status(code:Int):EResp;
	@:overload(function(data:Dynamic):Void {})
	public function send(body_or_status:Dynamic, body:Dynamic):Void;
	public function sendFile(path:String):Void;
	@:overload(function(data:Dynamic):Void {})
	public function json(body_or_status:Dynamic, body:Dynamic):Void;
	@:overload(function(view:String, ?callback:Dynamic):Void {})
	public function render(view:String, ?locals:Dynamic, ?callback:Dynamic):Void;
	public function type(type:String):EResp;
	@:overload(function(url:String):Void {})
	public function redirect(status:Int, url:String):Void;
	public function setHeader(key:String, value:String):Void;
	public function removeHeader(key:String):Void;
	public function writeHead(status:Int, data:Dynamic):Void;
	@:overload(function(?data:Dynamic, type:String):Void {})
	public function end(?data:Dynamic):Void;
	public function cookie(name:String, value:String, ?options:Dynamic):Void;
}
