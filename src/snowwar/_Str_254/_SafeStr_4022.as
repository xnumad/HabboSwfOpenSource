package snowwar._Str_254
{
	import com.sulake.core.runtime.IDisposable;
    import snowwar._Str_231._SafeStr_4028;

    public interface _SafeStr_4022 extends IDisposable 
    {
        function distanceTo(_arg_1:_SafeStr_4022):int;
        function directionTo(_arg_1:_SafeStr_4022):Direction8;
        function getNodeAt(_arg_1:Direction8):_SafeStr_4022;
        function directionIsBlocked(_arg_1:Direction8, _arg_2:_SafeStr_4028):Boolean;
        function getPathCost(_arg_1:Direction8, _arg_2:_SafeStr_4028):int;
        function set _SafeStr_18665(_arg_1:Direction8):void;
        function get _SafeStr_18665():Direction8;
        function set _SafeStr_18666(_arg_1:_SafeStr_4022):void;
        function get _SafeStr_18666():_SafeStr_4022;
        function set _SafeStr_18667(_arg_1:int):void;
        function get _SafeStr_18667():int;
        function set _SafeStr_18668(_arg_1:int):void;
        function get _SafeStr_18668():int;
    }
}
