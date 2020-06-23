package js.npm.express;

@:jsRequire('express')
extern class Express {
	@:selfCall public static function app():ExpressApp;
	@:native('Router') public static function router():Dynamic;
	public static function json(options:{extended:Bool, limit:String}):Dynamic;
	public static function urlencoded(options:{extended:Bool, limit:String}):Dynamic;
	public static inline function getStatic():Dynamic {
		return Syntax.code('(require("express")).static(__dirname + "/public")');
	}
}
