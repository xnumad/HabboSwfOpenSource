package snowwar._Str_231
{
    import com.sulake.core.runtime.IDisposable;

    public interface ISnowWarGameObject extends _SafeStr_4028, IDisposable 
    {
        function get isActive():Boolean;
        function set isActive(_arg_1:Boolean):void;
        function get numberOfVariables():int;
        function getVariable(_arg_1:int):int;
        function subturn(_arg_1:SynchronizedGameStage):void;
        function onRemove():void;
    }
}
