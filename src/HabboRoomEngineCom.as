package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.RoomEngineBootstrap;
    import com.sulake.iid.IIDRoomEngine;
    import binaryData.*;

    public class HabboRoomEngineCom extends SimpleApplication 
    {
        public static var manifest:Class = _Str_13623;
        public static var requiredClasses:Array = new Array(RoomEngineBootstrap, IIDRoomEngine);
    }
}
