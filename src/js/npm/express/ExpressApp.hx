package js.npm.express;

import js.node.http.Server;

extern class ExpressApp {
	public function set(name:String, value:Dynamic):Void;

	@:overload(function(port:Int, host:String, ?callback:Void->Void):Void {})
	public function listen(port:Int, ?callback:Void->Void):Server;

	@:overload(function(callback:Dynamic):Void {})
	@:overload(function(callback:EReq->EResp->Void):Void {})
	@:overload(function(callback:EReq->EResp->Dynamic->Void):Void {})
	public function use(path:String, callback:EReq->EResp->Void):Void;

	public function get(path:String, callback:EReq->EResp->Void):Void;

	@:overload(function(path:String, params:Dynamic, callback:EReq->EResp->Void):Void {})
	public function post(path:String, callback:EReq->EResp->Void):Void;
}
