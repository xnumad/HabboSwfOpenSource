package snowwar._Str_231
{
	import com.sulake.core.runtime.IDisposable;
    import snowwar._Str_496.SnowWarGameStageMessageParser;

    public interface _SafeStr_4024 extends IDisposable 
    {
        function initialize(gameArena:SynchronizedGameArena, _arg_2:SnowWarGameStageMessageParser):void;
        function get synchronizedGameArena():SynchronizedGameArena;
        function get roomType():String;
    }
}
