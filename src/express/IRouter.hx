package express;

@:autoBuild(express.RouterBuilder.build())
interface IRouter {
	public final __router:Dynamic;
}
