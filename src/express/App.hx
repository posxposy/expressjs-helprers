package express;

import js.Syntax;
import haxe.ds.StringMap;
import better.Result;
#if js
import js.npm.express.*;
#end

class App {
	final options:AppOptions;
	var app:ExpressApp;

	public static inline function create(o:AppOptions):App {
		return new App(o);
	}

	public function start(cb:(result:Result<String>) -> Void):Void {
		app.listen(this.options.port, () -> cb(Success('Server has been started on port ${this.options.port}.')))
			.on("error", e -> cb(Failure("Express JS cannot be initialized. Original error: \n" + Std.string(e))));
	}

	public function useRouter(router:IRouter):Void {
		app.use(router.__router);
	}

	function new(o:AppOptions) {
		#if debug
		js.Node.require("source-map-support").install();
		#end
		if (o.defaultHeaders == null) {
			o.defaultHeaders = [
				"Content-Type" => "application/json",
				"Access-Control-Allow-Origin" => "*",
				"Access-Control-Allow-Methods" => "*",
				"Access-Control-Allow-Headers" => "*"
			];
		}

		this.options = o;

		final options = {limit: "50mb", extended: true};
		app = Express.app();
		app.use(Express.getStatic());
		app.use(Express.urlencoded(options));
		app.use(Express.json(options));

		app.use(function(req:EReq, res:EResp, next:() -> Void):Void {
			if (this.options.defaultHeaders != null) {
				for (key => value in this.options.defaultHeaders) {
					res.setHeader(key, value);
				}
			}

			if (req.path == "/_ah/health") {
				res.status(200).send("ok");
				return;
			}

			next();
		});
	}
}

typedef AppOptions = {
	port:Int,
	?defaultHeaders:StringMap<String>
}
